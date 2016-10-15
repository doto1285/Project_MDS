package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPF_ListSrvice {

	@Autowired
	ProductDao productDao;

	/**
	 * categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기(리스트화면에서 사용) 만든이 : 이민우
	 * 
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductList(int categorylist_no) {

		return productDao.getProductList(categorylist_no);
	}

	/**
	 * 페이징을 위해 한 페이지에 보여줄 상품들을 쪼개어 보내줌 만든이 : 이민우
	 * 
	 * @param categoryProductListVoPaging
	 * @return
	 */
	public List<CategoryProductListVo> getProductListPaging(CategoryProductListVo categoryProductListVoPaging) {
		return productDao.getProductListPaging(categoryProductListVoPaging);
	}

	/**
	 * 낮은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기 만든이 : 이민우
	 * 
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListLowPrice(CategoryProductListVo categoryProductListVoPaging) {

		return productDao.getProductListLowPrice(categoryProductListVoPaging);
	}

	/**
	 * 높은 가격 기준으로 categorylist_no을 이용해 올바른 상품이름, 가격, 상품 이미지URL 가져오기 만든이 : 이민우
	 * 
	 * @param categorylist_no
	 * @return
	 */
	public List<CategoryProductListVo> getProductListHighPrice(CategoryProductListVo categoryProductListVoPaging) {

		return productDao.getProductListHighPrice(categoryProductListVoPaging);
	}

	/**
	 * 현재 선택된 상품 카테고리를 표현하기 위해 필요한 함수
	 * 만든이 : 이민우
	 * @param categorylist_groupNo
	 * @return
	 */
	public List<CategoryListVo> getCategoryGroupList(int categorylist_groupNo) {

		return productDao.getCategoryGroupList(categorylist_groupNo);
	}

}
