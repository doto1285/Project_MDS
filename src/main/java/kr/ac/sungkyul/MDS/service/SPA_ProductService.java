package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPA_ProductService {
	@Autowired
	ProductDao productDao;
	@Autowired
	MallDao mallDao;

	/**
	 * 상품리스트를 가져온다
	 * 
	 * @param domain
	 * @return
	 */
	public List<ProductListVo> getProductInfo(String domain) {
		MallVo mallVo = mallDao.domainCheck(domain);
		List<ProductListVo> productlist = productDao.get_Product_Content(mallVo);
		for(int i=0; i<productlist.size(); i++) {
			productlist.get(i).setProduct_no(productDao.getProductNo(productlist.get(i).getProduct_name()));
		}

		return productlist;
	}

	public void deleteProduct(int productNo) {
		productDao.deleteProduct(productNo);
	}

}
