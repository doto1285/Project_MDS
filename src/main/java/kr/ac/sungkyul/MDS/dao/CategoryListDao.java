package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.CategoryListVo;

@Repository
public class CategoryListDao {
	
	@Autowired
	private SqlSession sqlSession;
	
//	public List<CategoryListVo> get(String domain) {
//		List<CategoryListVo> listvo = sqlSession.selectList( "SPA_categorylist.get_damain_categorylist", domain );
//		return listvo;
//	}

}
