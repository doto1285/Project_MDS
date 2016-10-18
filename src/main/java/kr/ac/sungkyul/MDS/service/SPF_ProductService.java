package kr.ac.sungkyul.MDS.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPF_ProductService {

	@Autowired
	private ProductDao productDao;
	
	/**
	 * product_no을 통해 상품의 상세 정보를 얻어온다.
	 * 만든이 : 이민우
	 * @param product_no
	 * @return
	 */
	public Map get_Product_detail(int product_no){
		
		return productDao.get_Product_detail(product_no);
	}
	
	public List<ProductListVo> get_Product_Content(MallVo mallVo){
		return productDao.get_Product_Content(mallVo);
	}
}
