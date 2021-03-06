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
import kr.ac.sungkyul.MDS.vo.MallVo;

@Service
public class BoardService {

	// 리스팅 되는 게시물 수
	private static final int LIST_PAGESIZE = 10;
	// 페이지 리스트에 표시되는 페이지 수
	private static final int LIST_BLOCKSIZE = 5;

	@Autowired
	private BoardListDao boardListDao;

	@Autowired
	private BoardDao boardDao;

	public List<BoardListVo> GetBoardList(String userid) {
		List<BoardListVo> GetBoardList = boardListDao.GetBoardList(userid);

		return GetBoardList;
	}

	public BoardListVo GetBoard(String userid, int boardlist_no) {
		// 게시판 정보 가져오기
		BoardListVo GetBoard = boardListDao.GetBoard(userid, boardlist_no);
		return GetBoard;
	}

	public void NewWrite(BoardVo boardVo) {
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
		// 답글 등록하기
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

	

	public void BoardModify(BoardVo boardVo) {
		//게시글 수정하기
		boardDao.BoardModify(boardVo);
	}
	
	public void delete(BoardVo boardVo) {
		//게시글 삭제하기 (state = 0으로 변경)
		
		BoardVo vo2 = boardDao.checkReply(boardVo);
		
		if (vo2 == null) {
			boardVo.setBoard_state(0);
		} else {
			if ( boardVo.getBoard_depth() >= vo2.getBoard_depth()) {
				// 댓글에 댓글이 달려있지 않을경우, 게시글 삭제 (state = 2으로 변경)
				boardVo.setBoard_state(0);
			} else {
				boardVo.setBoard_state(2);
			}
		}
		
		System.out.println(boardVo.getBoard_state());
		
		boardDao.delete(boardVo);
	}
	

	public boolean checkPw(int board_no,  String pw) {
		//입력한 비밀번호가 맞는지 확인

		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoard_no(board_no);
		boardVo.setBoard_password(pw);
		
		return boardDao.checkPw(boardVo);
	}
	

	public void addHit(int board_no) {
		//게시글을 클릭하면 조회수가 1씩 증가한다.
		boardDao.addHit(board_no);
	}

	/////////////////////// 게시판 부분
	

	public List<BoardListVo> getBoardListInfo(String domain) {
		//해당 도메인에 개설된 게시판 정보를 가져온다
		return boardListDao.getBoardListInfo(domain);
	}

	public void insertBoardList(BoardListVo vo) {
		//새 게시판을 삽입한다.
		boardListDao.insertBoardList(vo);
	}

	public void boardListModify(BoardListVo vo) {
		//게시판 정보를 수정한다.
		boardListDao.boardListModify(vo);
	}

	public BoardListVo boardListUp(int boardlistno) {
		// 게시판 순서를 위로 올린다
		BoardListVo vo  = boardListDao.getMyVo(boardlistno); // 순서를 위로 올릴 게시판(자기자신) 정보를 가져온다
		BoardListVo vo2  = boardListDao.getBelowOrderNo(vo);//자신보다 orderNo가 1낮은 게시판 정보를 가져온다
		
		
		int temp = vo.getBoard_orderno();
		
		vo.setBoard_orderno(vo2.getBoard_orderno());
		vo2.setBoard_orderno(temp);

		boardListDao.updateOrderno(vo);		//변경된 orderno를 데이터베이스에 저장한다
		boardListDao.updateOrderno(vo2);	//변경된 orderno를 데이터베이스에 저장한다
		
		return null;
	}
	
	public BoardListVo boardListDown(int boardlistno) {
		// 게시판 순서를 위로 올린다
		
		BoardListVo vo  = boardListDao.getMyVo(boardlistno); // 순서를 위로 올릴 게시판(자기자신) 정보를 가져온다
		BoardListVo vo2  = boardListDao.getAboveOrderNo(vo);//자신보다 orderNo가 1높은 게시판 정보를 가져온다
		
		int temp = vo.getBoard_orderno();
		
		vo.setBoard_orderno(vo2.getBoard_orderno());
		vo2.setBoard_orderno(temp);
		
		boardListDao.updateOrderno(vo);		//변경된 orderno를 데이터베이스에 저장한다
		boardListDao.updateOrderno(vo2);	//변경된 orderno를 데이터베이스에 저장한다
		
		return null;
	}

	public void boardlistdelete(int boardlistno) {
		//게시판 삭제
		BoardListVo vo  = boardListDao.getMyVo(boardlistno); // 삭제할 게시판 자기 자신의 정보를 가져온다
		boardListDao.boardlistdelete(boardlistno);	//변경된 orderno를 데이터베이스에 저장한다 (state = 0 으로 수정한다)
		boardListDao.DeleteCategory_OrderNoDown(vo);	//자신보다 orderNo가 큰 게시판들의 orderNo를 1씩 감소시킨다
	}
	
	/**
	    * mallVo 안의 mall_no을 가지고 SPF 개인쇼핑몰에서 게시판 리스트를 가져옴
	    * 만든이 : 이민우
	    * @param mallVo
	    * @return
	    */
	   public List<BoardListVo> SPF_GetBoardList(MallVo mallVo) {
	      // TODO Auto-generated method stub
	      List<BoardListVo> GetBoardList = boardListDao.SPF_GetBoardList(mallVo);

	      return GetBoardList;
	   }




}