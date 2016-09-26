package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;;

@Service
public class SPA_CategoryListService {
	
	@Autowired
	private CategoryListDao categoryListDao;
	
	public List<CategoryListVo> getCategoryList(String domain) {
		List<CategoryListVo> categoryList = categoryListDao.get(domain);
		return categoryList;
	}


}
