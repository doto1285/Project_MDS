package kr.ac.sungkyul.MDS.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.sungkyul.MDS.dao.BoardDao;
import kr.ac.sungkyul.MDS.dao.BoardListDao;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Service
public class BoardService {
	


	// 리스팅 되는 게시물 수
	private static final int LIST_PAGESIZE = 5; 
	// 페이지 리스트에 표시되는 페이지 수
	private static final int LIST_BLOCKSIZE = 5; 

	@Autowired
	private BoardListDao boardListDao;
	
	@Autowired
	private BoardDao boardDao;

	public List<BoardListVo> GetBoardList(String userid) {
		// TODO Auto-generated method stub
		List<BoardListVo> GetBoardList = boardListDao.GetBoardList(userid);
		
		return GetBoardList;
	}

	public BoardListVo GetBoard(String userid, int boardlist_no) {
		// TODO Auto-generated method stub
		// 게시판 정보 가져오기
		BoardListVo GetBoard = boardListDao.GetBoard(userid, boardlist_no);
		return GetBoard;
	}

//	public List<BoardVo> GetBoardContentsList(int boardlist_no, int page, int pagesize) {
//		// TODO Auto-generated method stub
//		// 해당 게시판의 게시글들을 가져온다.
//		
////		List<BoardVo> GetBoardContentsList = boardDao.GetBoardContentsList(boardlist_no, page, pagesize);
//		
//		return GetBoardContentsList;
//	}

	public void NewWrite(BoardVo boardVo) {
		// TODO Auto-generated method stub
		// 새 글 등록하기
		boardDao.NewWrite(boardVo);
	}

	public BoardVo GetBoardContent(int board_no) {
		// TODO Auto-generated method stub
		// 선택한 게시글 내용 가져오기
		
		return boardDao.GetBoardContent(board_no);
	}

	@Transactional
	public void ReplyWrite(BoardVo boardVo) {
		// TODO Auto-generated method stub
		//답글 등록하기
		boardDao.ReplyWrite_orderno_update(boardVo);
		boardDao.ReplyWrite(boardVo);
	}
	
	
public Map<String, Object> GetBoardContentsList(int boardlist_no, int page, String keyword) {
		
		// 1. 현재 페이지 값 받기 = page

		// 2. 페이지를 그리기 위한 기초 작업
		int totalCount = boardDao.getTotalCount(boardlist_no);
		int pageCount = (int) Math.ceil((double) totalCount / LIST_PAGESIZE);
		int blockCount = (int) Math.ceil((double) pageCount / LIST_BLOCKSIZE);
		int currentBlock = (int) Math.ceil((double) page / LIST_BLOCKSIZE);

		// 3. page값 검증
		if (page < 1) {
			page = 1;
			currentBlock = 1;
		} else if (page > pageCount) {
			page = pageCount;
			currentBlock = (int) Math.ceil((double) page / LIST_BLOCKSIZE);
		}

		// 4. 페이지를 그리기 위한 값 계산
		int startPage = (currentBlock - 1) * LIST_BLOCKSIZE + 1;
		int endPage = (startPage - 1) + LIST_BLOCKSIZE;
		int prevPage = (page >= startPage) ? (page - 1) : (currentBlock - 1) * LIST_BLOCKSIZE;
		int nextPage = (page <= endPage) ? (page + 1) : currentBlock * LIST_BLOCKSIZE + 1;
		int nexttoPage = (currentBlock < blockCount) ? currentBlock * LIST_BLOCKSIZE + 1 : page;
		int prevtoPage = (currentBlock > 1) ? startPage - 3 : page;


		List<BoardVo> GetBoardContentsList = boardDao.GetBoardContentsList(boardlist_no, page, LIST_PAGESIZE, keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		
		// 5. map에 객체 담기
		map.put("sizeList", LIST_PAGESIZE);
		map.put("firstPage", startPage);
		map.put("lastPage", endPage);
		map.put("prevPage", prevPage);
		map.put("nextPage", nextPage);
		map.put("currentPage", page);
		map.put("pageCount", pageCount);
		map.put("GetBoardContentsList", GetBoardContentsList);
		map.put("totalCount", totalCount);
		map.put("keyword", keyword);
		map.put("nexttoPage", nexttoPage);
		map.put("prevtoPage", prevtoPage);
		map.put("boardlist_no", boardlist_no);

		return map;
	}

}
