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
public class BoardDao {

	@Autowired
	private SqlSession sqlSession;

	public int insertBoard(BoardVo boardVo) {
		sqlSession.insert("TSF_board.insertBoard", boardVo);
		return boardVo.getBoard_no();
	}

	public List<BoardVo> GetBoardContentsList(int boardlist_no, int page, int pagesize, String keyword) {

		// 해당 게시판의 게시글들을 가져온다.
		Map<String, Object> map = new HashMap<>();
		map.put("page_start", (page - 1) * pagesize + 1);
		map.put("page_end", page * pagesize);
		map.put("boardlist_no", boardlist_no);

		System.out.println("맵 출력 " + map);
		List<BoardVo> listvo = sqlSession.selectList("TSF_board.GetBoardContentsList", map);

		for (BoardVo vo : listvo) {
			// System.out.println("게시글 " + vo);
			if (vo.getBoard_state() == 2) {
				vo.setBoard_title("<삭제된 게시글 입니다>");
				vo.setBoard_content("<삭제된 게시글입니다>");
			}
		}

		return listvo;

	}

	public void NewWrite(BoardVo boardVo) {
		// 새 글 등록하기
		sqlSession.insert("TSF_board.NewWrite", boardVo);

	}

	public BoardVo GetBoardContent(int board_no) {

		BoardVo boardVo = sqlSession.selectOne("TSF_board.GetBoardContent", board_no);

		if (boardVo.getBoard_state() == 2) {
			boardVo.setBoard_title("<삭제된 게시글 입니다>");
			boardVo.setBoard_content("<삭제된 게시글입니다>");
		}

		System.out.println("출력될 게시글" + boardVo);
		return boardVo;
	}

	public void ReplyWrite_orderno_update(BoardVo boardVo) {
		// 답글 달기 order_no 증가
		sqlSession.update("TSF_board.ReplyWrite_orderno_update", boardVo);
	}

	public void ReplyWrite(BoardVo boardVo) {
		// 답글 달기
		sqlSession.insert("TSF_board.ReplyWrite", boardVo);
	}

	public int getTotalCount(int boardlist_no) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("TSF_board.totalCount", boardlist_no);
	}

	public void BoardModify(BoardVo boardVo) {
		// 게시글 수정
		sqlSession.update("TSF_board.BoardModify", boardVo);

	}

	public BoardVo checkReply(BoardVo boardVo) {
		// 게시글글의 댓글이 있는지 확인
		return sqlSession.selectOne("TSF_board.checkReply", boardVo);
	}

	
	public void delete(BoardVo boardVo) {
		// 게시글 삭제하기 (state = 0으로 변경)
			sqlSession.update("TSF_board.delete", boardVo);
	}

	public boolean checkPw(BoardVo boardVo) {

		BoardVo vo = sqlSession.selectOne("TSF_board.checkPw", boardVo);
		System.out.println("비밀번호 확인" + vo);

		if (vo != null) {
			return true;
		} else {
			return false;
		}

	}

	public void addHit(int board_no) {
		// 게시글을 클릭하면 조회수가 1씩 증가한다.
		sqlSession.update("TSF_board.addHit", board_no);

	}

}
