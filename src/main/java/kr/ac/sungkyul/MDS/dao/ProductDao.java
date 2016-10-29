package kr.ac.sungkyul.MDS.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;
import kr.ac.sungkyul.MDS.vo.ProductimgVo;

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
	 * product_no을 통해 상품의 상세 정보를 얻어온다.
	 * 만든이 : 이민우
	 * @param product_no
	 * @return
	 */
	public Map get_Product_detail(int product_no){
		Map<String, Object> map = new HashMap<String, Object>();
		ProductVo productVo = sqlSession.selectOne("SPF_product.get_product_detail_product", product_no);
		ProductimgVo productimgflag0 = sqlSession.selectOne("SPF_product.get_product_detail_productimg_flag0", product_no);
		ProductimgVo productimgflag1 = sqlSession.selectOne("SPF_product.get_product_detail_productimg_flag1", product_no);
		ProductimgVo productimgflag2 = sqlSession.selectOne("SPF_product.get_product_detail_productimg_flag2", product_no);
		List<ProductOptionVo> productOptionList = sqlSession.selectList("SPF_product.get_product_detail_productoption", product_no);
		map.put("productVo", productVo);
		map.put("productimgflag0", productimgflag0);
		map.put("productimgflag1", productimgflag1);
		map.put("productimgflag2", productimgflag2);
		map.put("productOptionList", productOptionList);
		
		return map;
	}
	
	/**
	 * productoption_no을 통해 소비자가 선택한 상품의 색상과 맞는 사이즈 리스트를 가져온다
	 * 만든이 : 이민우
	 * @param product_no
	 * @return
	 */
	public List<ProductOptionVo> get_Product_Option_SizeList(ProductOptionVo productOptionVo){
		List<ProductOptionVo> productOptionSizeList = sqlSession.selectList("SPF_product.get_product_detail_productoption_size", productOptionVo);
	return productOptionSizeList;
	}
	
	/**
	 * mall_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기(메인에서 사용)
	 * 만든이 : 이민우
	 * @param mallVo
	 * @return
	 */
	public List<ProductListVo> get_Product_Content(MallVo mallVo){
		return sqlSession.selectList("SPF_product.get_product_allcontent", mallVo);
	}
	
	/**
	 * 페이징을 위해 한 페이지에 보여줄 상품들을 쪼개어 보내줌
	 * 만든이 : 이민우
	 * @param categoryProductListVoPaging
	 * @return
	 */
	public List<CategoryProductListVo> getProductListPaging(CategoryProductListVo categoryProductListVoPaging){
		return sqlSession.selectList("SPF_product.get_product_list_paging", categoryProductListVoPaging);
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
	public List<CategoryProductListVo> getProductListLowPrice(CategoryProductListVo categoryProductListVoPaging){
		return sqlSession.selectList("SPF_product.get_product_list_lowprice", categoryProductListVoPaging);
	}
	
	/**
	 * 높은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListHighPrice(CategoryProductListVo categoryProductListVoPaging){
		return sqlSession.selectList("SPF_product.get_product_list_highprice", categoryProductListVoPaging);
	}

	/**
	 * 현재 선택된 상품 카테고리를 표현하기 위해 필요한 함수
	 * 만든이 : 이민우
	 * @param categorylist_groupNo
	 * @return
	 */
	public List<CategoryListVo> getCategoryGroupList(int categorylist_groupNo){
		
		return sqlSession.selectList("SPF_product.get_category_List", categorylist_groupNo);
	}
	
	/**
	 * 상품번호를 맞는 상품을 삭제한다.
	 * @param productno
	 */
	public void deleteProduct(int productno) {
		sqlSession.delete("SPA_product.deleteproduct", productno);
	}
	
	/**
	 * 상품이름을 통해 상품번호를 가져온다.
	 * @param productName
	 * @return
	 */
	public int getProductNo(String productName) {
		return sqlSession.selectOne("SPA_product.get_produnt_no", productName);
	}
	
	/**
	 * 상품옵션번호에 맞는 상품옵션을 가져온다.
	 * @param produntOptionNo
	 * @return
	 */
	public ProductOptionVo getProductOption(int produntOptionNo) {
		return sqlSession.selectOne("SPA_product.get_produntoption", produntOptionNo);
	}
	
	/**
	 * 상품을 추가한다.
	 * @param ProductVo
	 * @return
	 */
	public int insertProduct(ProductVo productVo) {
		sqlSession.insert("SPA_product.insertProduct", productVo);
		return productVo.getProduct_no();
	}
	
	/**
	 * 상품을 수정한다.
	 * @param ProductVo
	 * @return
	 */
	public void modifyProduct(ProductVo productVo) {
		sqlSession.update("SPA_product.updateProduct", productVo);
	}
	
	/**
	 * 상품옵션을 추가한다.
	 * @param productOptionVo
	 */
	public void insertProductOption(ProductOptionVo productOptionVo) {
		sqlSession.insert("SPA_product.insertProductOption", productOptionVo);
	}
	
	/**
	 * 상품옵션을 수정한다.
	 * @param productOptionVo
	 */
	public void modifyProductOption(ProductOptionVo productOptionVo) {
		sqlSession.update("SPA_product.updateProductOption", productOptionVo);
	}
	
	/**
	 * 상품을 추가하기전 이름이 같은 것이 있는지 중복검사
	 * @param product_name
	 * @return
	 */
	public ProductVo getProductDistinct(String product_name) {
		return sqlSession.selectOne("SPA_product.getProductDistinct", product_name);
	}
	
	/**
	 * 상품번호를 이용하여 상품정보를 가져온다.
	 * @param product_no
	 * @return
	 */
	public ProductVo getProduct(int product_no) {
		return sqlSession.selectOne("SPA_product.get_produnt", product_no);
	}
	
	/**
	 * 상품번호를 이용하여 모든 상품옵션을 가져온다.
	 * @param product_no
	 * @return
	 */
	public List<ProductOptionVo> getProductOptionList(int product_no) {
		return sqlSession.selectList("SPA_product.get_produntoptionlist", product_no);
	}
}
