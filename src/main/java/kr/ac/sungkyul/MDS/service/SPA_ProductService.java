package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import kr.ac.sungkyul.MDS.dao.ProductDao;

@Service
public class SPA_ProductService {
	@Autowired
	ProductDao productDao;
	
	public void deleteProduct(int productNo) {

		//삭제개발시작
	
	}

}
