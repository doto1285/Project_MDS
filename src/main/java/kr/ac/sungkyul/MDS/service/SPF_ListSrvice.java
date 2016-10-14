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

	public List<CategoryProductListVo> getProductList(int categorylist_no) {
		
		return productDao.getProductList(categorylist_no);
	}

}
