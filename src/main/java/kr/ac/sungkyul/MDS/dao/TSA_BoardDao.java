package kr.ac.sungkyul.MDS.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Repository
public class TSA_BoardDao {

	@Autowired
	private SqlSession sqlSession;

	

	public List<MemberVo> GetUserManageList() {
		// 회원리스트 불러오기.
		return sqlSession.selectList("TSA_board.GetUserManage"); // xml namespace . xml id
	}
	

	
	
	
	
	
	
	public List<MallVo> GetShopManage() {
		// 회원리스트 불러오기.
		List<MallVo> a = sqlSession.selectList("TSA_board.GetShopManage"); // xml namespace . xml id
		System.out.println("MallVo : " + a);
		return a;
	}
	
	
	
	
	
	
	
	

}
