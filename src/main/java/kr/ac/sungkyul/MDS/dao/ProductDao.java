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
	 * mall_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기(메인에서 사용)
	 * 만든이 : 이민우
	 * @param mallVo
	 * @return
	 */
	public List<ProductListVo> get_Product_Content(MallVo mallVo){
		return sqlSession.selectList("SPF_product.get_product_content", mallVo);
	}
	
	/**
	 * categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기(리스트화면에서 사용)
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductList(int categorylist_no){
		return sqlSession.selectList("SPF_product.get_product_list", categorylist_no);
	}
	
	/**
	 * 낮은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListLowPrice(int categorylist_no){
		return sqlSession.selectList("SPF_product.get_product_list_lowprice", categorylist_no);
	}
	
	/**
	 * 높은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListHighPrice(int categorylist_no){
		return sqlSession.selectList("SPF_product.get_product_list_highprice", categorylist_no);
	}

}
