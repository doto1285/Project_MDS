package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Repository
public class CategoryListDao {

	@Autowired
	private SqlSession sqlSession;

	public List<CategoryListVo> getCategoryList(String domain) {
		// TODO Auto-generated method stub
		// 해당 쇼핑몰의 카테고리 리스트를 불러온다 sky

		List<CategoryListVo> listvo = sqlSession.selectList("SPA_categorylist.getCategoryList", domain);
		return listvo;
	}

	public void ModifyName(CategoryListVo vo) {
		// TODO Auto-generated method stub
		// 카테고리 이름을 수정한다 sky
		sqlSession.update("SPA_categorylist.ModifyName", vo);
	}

	public void InsertCategory(CategoryListVo vo) {
		// TODO Auto-generated method stub
		// 새로운 1차 카테고리 추가 sky
			sqlSession.insert("SPA_categorylist.InsertCategory", vo);
	}


	public void DeleteCategory(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 카테고리 삭제 sky
		sqlSession.update("SPA_categorylist.DeleteCategory", msgchangecateNo);
	}

	public CategoryListVo getMyVo(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 자신의 카테고리 정보를 가져온다
		return sqlSession.selectOne("SPA_categorylist.getMyVo", msgchangecateNo);
	}



	public void DeleteCategory_OrderNoDown(CategoryListVo vo) {
		// TODO Auto-generated method stub
		// 카테고리 삭제시 자신보다 orderNo가 큰 카테고리들의 orderNo를 1씩 감소시킨다
		sqlSession.update("SPA_categorylist.DeleteCategory_OrderNoDown", vo);
	}

	public CategoryListVo getBelowOrderNo(CategoryListVo vo) {
		// TODO Auto-generated method stub
		//자신보다 orderNo가 1낮은 카테고리 정보를 가져온다
		 return sqlSession.selectOne("SPA_categorylist.getBelowOrderNo", vo);
	}

	public void updateOrderno(CategoryListVo vo) {
		// TODO Auto-generated method stub
		//변경된 orderno를 데이터베이스에 저장한다
		sqlSession.update("SPA_categorylist.updateOrderno", vo);
		
		
	}

	public CategoryListVo getAboveOrderNo(CategoryListVo vo) {
		// TODO Auto-generated method stub
		//자신보다 orderNo가 1높은 카테고리 정보를 가져온다
		 return sqlSession.selectOne("SPA_categorylist.getAboveOrderNo", vo);
	}

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
