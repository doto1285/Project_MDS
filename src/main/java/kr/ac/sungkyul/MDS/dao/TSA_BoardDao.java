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


	public List<MemberVo> GetUserManageList( int page, int pagesize, String keyword) {

	
		Map<String, Object> map = new HashMap<>();
		map.put("page_start", (page - 1) * pagesize + 1);
		map.put("page_end", page * pagesize);

		System.out.println("맵 출력 " + map);
		List<MemberVo> listvo = sqlSession.selectList("TSA_board.GetUserManage", map);
		
		for (MemberVo vo : listvo) {
			 System.out.println("회원 " + vo);
		}
		
		return listvo;

		}

	
	public List<MallVo> GetShopManageList( int page, int pagesize, String keyword) {
		
		
		Map<String, Object> map = new HashMap<>();
		map.put("page_start", (page - 1) * pagesize + 1);
		map.put("page_end", page * pagesize);
		
		System.out.println("맵 출력 " + map);
		List<MallVo> listvo = sqlSession.selectList("TSA_board.GetShopManage", map);
		
		for (MallVo vo : listvo) {
			System.out.println("회원 " + vo);
		}
		
		return listvo;
		
	}
	

	public int getTotalCount() {
		// TODO Auto-generated method stub
		//전체 사용자 개수를 찾는다
		
		return sqlSession.selectOne("TSA_board.getTotalCount");
	}
}
