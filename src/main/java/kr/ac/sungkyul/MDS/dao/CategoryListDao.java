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


	/**
	 * SPF 개인 쇼핑몰의 카테고리를 가져옴
	 * 만든이 : 이민우
	 * @param mallVo
	 * @return
	 */
	public List<CategoryListVo> get_CategoryList(MallVo mallVo) {
		List<CategoryListVo> categoryList = sqlSession.selectList("SPF_categorylist.get_category_List", mallVo);
		return categoryList;
	}

}
