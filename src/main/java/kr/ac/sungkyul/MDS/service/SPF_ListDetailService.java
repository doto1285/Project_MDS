package kr.ac.sungkyul.MDS.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;

@Service
public class SPF_ListDetailService {

	@Autowired
	ProductDao productDao;

	/**
	 * product_no을 통해 상품의 상세 정보를 얻어온다.
	 * 만든이 : 이민우
	 * @param product_no
	 * @return
	 */
	public Map get_Product_detail(int product_no){
		
		return productDao.get_Product_detail(product_no);
	}
	
	public List<ProductOptionVo> get_Product_Option_SizeList(ProductOptionVo productOptionVo){
		return productDao.get_Product_Option_SizeList(productOptionVo);
	}
}
