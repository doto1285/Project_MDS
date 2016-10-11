package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Repository
public class CategoryListDao {

	@Autowired
	private SqlSession sqlSession;

	// public List<CategoryListVo> get(String domain) {
	// List<CategoryListVo> listvo = sqlSession.selectList(
	// "SPA_categorylist.get_damain_categorylist", domain );
	// return listvo;
	// }

	public List<CategoryListVo> get_1stCategoryList(MallVo mallVo) {
		List<CategoryListVo> categoryList1st = sqlSession.selectList("SPF_categorylist.1st_category_Name", mallVo);
		return categoryList1st;
	}
	
	public List<CategoryListVo> get_2ndCategoryList(CategoryListVo catecoryListVo) {
		List<CategoryListVo> categoryList2nd = sqlSession.selectList("SPF_categorylist.2nd_category_Name", catecoryListVo);
		return categoryList2nd;
	}
}
