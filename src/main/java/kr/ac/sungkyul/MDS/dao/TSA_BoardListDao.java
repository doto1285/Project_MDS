package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Repository
public class TSA_BoardListDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BoardListVo> GetBoardList(String userid) {
		// TODO Auto-generated method stub
		List<BoardListVo> listvo = sqlSession.selectList("TSA_boardList.GetBoardList", userid);

		System.out.println("boardlistdao - getBoardList");
		for (BoardListVo vo : listvo) {
			System.out.println("개설된 게시판 리스트 " + vo);
		}
		return listvo;
	}

	public BoardListVo GetBoard(String userid, int boardlist_no) {
		// TODO Auto-generated method stub

		BoardListVo boardListvo = new BoardListVo();

		boardListvo.setUserid(userid);
		boardListvo.setBoardlist_no(boardlist_no);

		BoardListVo GetBoard = sqlSession.selectOne("TSA_boardList.GetBoard", boardListvo);

		System.out.println("게시판 정보 " + GetBoard);

		return GetBoard;
	}

	

}
