package kr.ac.sungkyul.MDS.dao;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Repository
public class BoardDao {

   @Autowired
   private SqlSession sqlSession;

   
   public int insertBoard(BoardVo boardVo){
      sqlSession.insert("TSF_board.insertBoard", boardVo);
      return boardVo.getBoard_no();
   }


   public List<BoardVo> GetBoardContentsList(int boardlist_no) {
      // TODO Auto-generated method stub
      // 해당 게시판의 게시글들을 가져온다.

      List<BoardVo> listvo = sqlSession.selectList("TSF_board.boardlist_no", boardlist_no);
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

   public void ReplyWrite_orderno_update(BoardVo boardVo) {
      // TODO Auto-generated method stub
      // 답글 달기 order_no 증가
      sqlSession.update("TSF_board.ReplyWrite_orderno_update", boardVo);
   }

   public void ReplyWrite(BoardVo boardVo) {
      // TODO Auto-generated method stub
      // 답글 달기
      sqlSession.insert("TSF_board.ReplyWrite", boardVo);
   }

}