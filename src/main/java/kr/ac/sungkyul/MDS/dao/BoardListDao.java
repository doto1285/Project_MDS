package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Repository
public class BoardListDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BoardListVo> GetBoardList(String userid) {
		// TODO Auto-generated method stub
		List<BoardListVo> listvo = sqlSession.selectList("TSF_boardList.GetBoardList", userid);

		System.out.println("biardlistdao - getBoardList");
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

		BoardListVo GetBoard = sqlSession.selectOne("TSF_boardList.GetBoard", boardListvo);

		System.out.println("게시판 정보 " + GetBoard);

		return GetBoard;
	}

	public List<BoardVo> GetBoardContentsList(int boardlist_no) {
		// TODO Auto-generated method stub
		// 해당 게시판의 게시글들을 가져온다.

		List<BoardVo> listvo = sqlSession.selectList("TSF_board.boardlist_no", boardlist_no);

		for (BoardVo vo : listvo) {
			System.out.println("게시글 목록 " + vo);
		}
		return listvo;

	}

	public void NewWrite(BoardVo boardVo) {
		// TODO Auto-generated method stub
		// 새 글 등록하기
		sqlSession.insert("TSF_board.NewWrite", boardVo);

	}

	public BoardVo GetBoardContent(int board_no) {
		// TODO Auto-generated method stub

		BoardVo boardVo = sqlSession.selectOne("TSF_board.GetBoardContent", board_no);

		System.out.println("출력될 게시글" + boardVo);
		return boardVo;
	}

	// public List<BoardVo> listBoard(){
	// System.out.println("dao");
	// return sqlSession.selectList("bbs.listBoard");
	// }
	//
	// public BoardVo selectBoard(BoardVo boardVo) {
	// return sqlSession.selectOne("bbs.selectBoard", boardVo);
	// }
	//
	// public void modifyBoard(BoardVo boardVo) {
	// // TODO Auto-generated method stub
	// sqlSession.update("bbs.modifyBoard", boardVo);
	// }
	//
	// public void delete(BoardVo boardVo) {
	// // TODO Auto-generated method stub
	// sqlSession.delete("bbs.delete", boardVo);
	//
	// }
	//
	// public void insertAttachFile(AttachFileVo attachFileVo) {
	// // TODO Auto-generated method stub
	// sqlSession.insert("bbs.insertAttachFile", attachFileVo);
	//
	// }
	//
	// public AttachFileVo selectAttachFileByNO(int no) {
	// // TODO Auto-generated method stub
	// return sqlSession.selectOne("bbs.selectAttachFileByNO", no);
	// }
	//
	// public AttachFileVo selectAttachFileByFNO(int fNO) {
	// // TODO Auto-generated method stub
	// return sqlSession.selectOne("bbs.selectAttachFileByfNO", fNO);
	// }
	//
	// public BoardVo selectBoard(int no) {
	// // TODO Auto-generated method stub
	// return sqlSession.selectOne("bbs.selectBoard", no);
	// }

}