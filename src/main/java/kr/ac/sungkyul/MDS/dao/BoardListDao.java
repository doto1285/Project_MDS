package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Repository
public class BoardListDao {

	@Autowired
	private SqlSession sqlSession;

	public List<BoardListVo> GetBoardList(String userid) {
		// TODO Auto-generated method stub
		List<BoardListVo> listvo = sqlSession.selectList("TSF_boardList.GetBoardList", userid);

//		System.out.println("biardlistdao - getBoardList");
//		for (BoardListVo vo : listvo) {
//			System.out.println("개설된 게시판 리스트 " + vo);
//		}
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
	
	public List<BoardListVo> getBoardListInfo(String domain) {
		// TODO Auto-generated method stub
		//해당 도메인에 개설된 게시판 정보를 가져온다
		
		return sqlSession.selectList("TSF_boardList.getBoardListInfo", domain);	
		
		
		
	}

	public void insertBoardList(BoardListVo vo) {
		// TODO Auto-generated method stub
		//새 게시판을 삽입한다.
		sqlSession.insert("TSF_boardList.insertBoardList", vo);	
	}

	public void boardListModify(BoardListVo vo) {
		// TODO Auto-generated method stub
		//게시판 정보를 수정한다
		sqlSession.update("TSF_boardList.boardListModify", vo);
		
	}
	
	public void updateOrderno(BoardListVo vo) {
		// TODO Auto-generated method stub
		//수정된 orderNo를 업데이트 한다.
		sqlSession.update("TSF_boardList.updateOrderno", vo);
		
	}

	public BoardListVo getMyVo(int boardlistno) {
		// TODO Auto-generated method stub
		// 자기 게시판의 정보를 가져온다
		return sqlSession.selectOne("TSF_boardList.getMyVo", boardlistno);
	}

	public BoardListVo getBelowOrderNo(BoardListVo vo) {
		// TODO Auto-generated method stub
		//자신보다 orderNo가 1낮은 게시판 정보를 가져온다
		
		return sqlSession.selectOne("TSF_boardList.getBelowOrderNo", vo);
	}

	public BoardListVo getAboveOrderNo(BoardListVo vo) {
		// TODO Auto-generated method stub
		//자신보다 orderNo가 1높은 게시판 정보를 가져온다
		return sqlSession.selectOne("TSF_boardList.getAboveOrderNo", vo);
	}

	public void boardlistdelete(int boardlistno) {
		// TODO Auto-generated method stub
		//게시판 삭제 (== stateNo를 0으로 변경)
		sqlSession.update("TSF_boardList.boardlistdelete", boardlistno);
	}

	public void DeleteCategory_OrderNoDown(BoardListVo vo) {
		// TODO Auto-generated method stub
		//자신보다 orderNo가 큰 게시판들의 orderNo를 1씩 감소시킨다
		sqlSession.update("TSF_boardList.DeleteCategory_OrderNoDown", vo);
	}
	
	/**
	    * mallVo 안의 mall_no을 가지고 SPF 개인쇼핑몰에서 게시판 리스트를 가져옴
	    * 만든이 : 이민우
	    * @param mallVo
	    * @return
	    */
	   public List<BoardListVo> SPF_GetBoardList(MallVo mallVo) {
	      // TODO Auto-generated method stub
	      List<BoardListVo> BoardList = sqlSession.selectList("TSF_boardList.SPF_GetBoardList", mallVo);

	      return BoardList;
	   }

}
