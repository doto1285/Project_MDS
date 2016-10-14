package kr.ac.sungkyul.MDS.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Repository
public class TSA_BoardDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertBoard(BoardVo boardVo) {
		sqlSession.insert("tsa_board.insertBoard", boardVo);
		return boardVo.getBoard_no();
	}

	public List<BoardVo> GetBoardContentsList(int boardlist_no, int page, int pagesize, String keyword) {

		// 해당 게시판의 게시글들을 가져온다.
		Map<String, Object> map = new HashMap<>();
		map.put("page_start", (page - 1) * pagesize + 1);
		map.put("page_end", page * pagesize);
		map.put("boardlist_no", boardlist_no);
		System.out.println("맵 출력 " + map);
		List<BoardVo> listvo = sqlSession.selectList("tsa_board.GetBoardContentsList", map);

		//
		// for (BoardVo vo : listvo) {
		// System.out.println("게시글 " + vo);
		// }
		//
		return listvo;

	}

	public void NewWrite(BoardVo boardVo) {
		// TODO Auto-generated method stub
		// 새 글 등록하기
		sqlSession.insert("tsa_board.NewWrite", boardVo);

	}

	public BoardVo GetBoardContent(int board_no) {
		// TODO Auto-generated method stub

		BoardVo boardVo = sqlSession.selectOne("tsa_board.GetBoardContent", board_no);

		System.out.println("출력될 게시글" + boardVo);
		return boardVo;
	}

	public void ReplyWrite_orderno_update(BoardVo boardVo) {
		// TODO Auto-generated method stub
		// 답글 달기 order_no 증가
		sqlSession.update("tsa_board.ReplyWrite_orderno_update", boardVo);
	}

	public void ReplyWrite(BoardVo boardVo) {
		// TODO Auto-generated method stub
		// 답글 달기
		sqlSession.insert("tsa_board.ReplyWrite", boardVo);
	}

	public int getTotalCount(int boardlist_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("tsa_board.totalCount", boardlist_no);
	}

	

}
