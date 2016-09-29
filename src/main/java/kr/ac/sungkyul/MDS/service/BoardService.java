package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.BoardListDao;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Service
public class BoardService {

	@Autowired
	private BoardListDao boardListDao;
	
	@Autowired
	private BoardListDao boardDao;

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

	public List<BoardVo> GetBoardContentsList(int boardlist_no) {
		// TODO Auto-generated method stub
		// 해당 게시판의 게시글들을 가져온다.
		
		List<BoardVo> GetBoardContentsList = boardDao.GetBoardContentsList(boardlist_no);
		
		return GetBoardContentsList;
	}

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

	
	
	

	
	
	
	
	
	

}
