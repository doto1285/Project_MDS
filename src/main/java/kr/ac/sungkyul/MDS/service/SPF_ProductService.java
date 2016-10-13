package kr.ac.sungkyul.MDS.service;

import java.util.List;

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
	
	public List<ProductListVo> get_Product_Content(MallVo mallVo){
		return productDao.get_Product_Content(mallVo);
	}
}
