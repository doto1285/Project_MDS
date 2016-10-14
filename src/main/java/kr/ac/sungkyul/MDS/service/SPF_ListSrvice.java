package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPF_ListSrvice {
	
	@Autowired
	ProductDao productDao;

	/**
	 * categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기(리스트화면에서 사용)
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductList(int categorylist_no) {
		
		return productDao.getProductList(categorylist_no);
	}
	
	/**
	 * 낮은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListLowPrice(int categorylist_no) {
		
		return productDao.getProductListLowPrice(categorylist_no);
	}
	
	/**
	 * 높은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기
	 * 만든이 : 이민우 
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListHighPrice(int categorylist_no) {
		
		return productDao.getProductListHighPrice(categorylist_no);
	}

}
