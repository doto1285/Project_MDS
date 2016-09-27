package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.BoardListDao;
import kr.ac.sungkyul.MDS.vo.BoardListVo;

@Service
public class BoardService {

	@Autowired
	private BoardListDao boardListDao;

	public List<BoardListVo> GetBoardList(String userid) {
		// TODO Auto-generated method stub
		List<BoardListVo> GetBoardList = boardListDao.GetBoardList(userid);
		
		return GetBoardList;
	}

	public BoardListVo GetBoard(String userid, int boardlist_no) {
		// TODO Auto-generated method stub
		
		BoardListVo GetBoard = boardListDao.GetBoard(userid, boardlist_no);
		return GetBoard;
	}

	
	
	
	
	
	

}
