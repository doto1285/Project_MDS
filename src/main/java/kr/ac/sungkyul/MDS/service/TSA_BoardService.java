package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.BoardDao;
import kr.ac.sungkyul.MDS.dao.BoardListDao;
import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;


@Service
public class TSA_BoardService {
	@Autowired
	private BoardDao boardDao;
	@Autowired
	private BoardListDao boardListDao;
	@Autowired
	private MemberDao memberDao;
	

	public void join(MemberVo vo) {
		memberDao.insert(vo);
	}

	public MemberVo login(String id, String password, int member_distinction) {
		System.out.println("service - " + id + " " + password);
		MemberVo authUser = memberDao.get(id, password, member_distinction);
		return authUser;
	}

	public MallVo GetJoinMall() {
		// TODO Auto-generated method stub
		return null;
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
		
		//List<BoardVo> GetBoardContentsList = boardDao.GetBoardContentsList(boardlist_no);
		
		//return GetBoardContentsList;
		return null;

	
	}
}
