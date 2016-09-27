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


	
	
	
	
	
	
	
//	public List<BoardVo> listBoard(){
//		System.out.println("dao");
//		return sqlSession.selectList("bbs.listBoard");
//	}
//
//	public BoardVo selectBoard(BoardVo boardVo) {
//		return sqlSession.selectOne("bbs.selectBoard", boardVo);
//	}
//
//	public void modifyBoard(BoardVo boardVo) {
//		// TODO Auto-generated method stub
//		sqlSession.update("bbs.modifyBoard", boardVo);
//	}
//
//	public void delete(BoardVo boardVo) {
//		// TODO Auto-generated method stub
//		sqlSession.delete("bbs.delete", boardVo);
//		
//	}
//
//	public void insertAttachFile(AttachFileVo attachFileVo) {
//		// TODO Auto-generated method stub
//		sqlSession.insert("bbs.insertAttachFile", attachFileVo);
//		
//	}
//
//	public AttachFileVo selectAttachFileByNO(int no) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("bbs.selectAttachFileByNO", no);
//	}
//
//	public AttachFileVo selectAttachFileByFNO(int fNO) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("bbs.selectAttachFileByfNO", fNO);
//	}
//
//	public BoardVo selectBoard(int no) {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("bbs.selectBoard", no);
//	}
	
}
