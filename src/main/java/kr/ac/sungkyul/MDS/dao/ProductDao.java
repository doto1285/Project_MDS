package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;

@Repository
public class ProductDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ProductVo get_Product_name(int no) {
		//추천 쇼핑몰 목록에 가져온 쇼핑몰 리스트를 랜덤으로 생성한다
		ProductVo vo = sqlSession.selectOne("SPA_product.get_produnt_name", no);
		return vo;
	}
	
	/**
	 * mall_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우
	 * @param mallVo
	 * @return
	 */
	public List<ProductListVo> get_Product_Content(MallVo mallVo){
		return sqlSession.selectList("SPF_product.get_product_content", mallVo);
	}
	
	
	public List<CategoryProductListVo> getProductList(int categorylist_no){
		return sqlSession.selectList("SPF_product.get_product_list", categorylist_no);
	}

}
