package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Service
public class SPF_MainService {
	
	@Autowired
	MallDao mallDao;
	
	@Autowired
	CategoryListDao categoryListDao;
	
	public MallVo get_Footer(int mall_no) {
		MallVo mallVo = mallDao.get_Footer(mall_no);
		return mallVo;
	}
	
	public List<CategoryListVo> get_1stCategoryList(MallVo mallVo){
		List<CategoryListVo> categoryList1st = categoryListDao.get_1stCategoryList(mallVo);
		return categoryList1st;
	}
	
	public List<CategoryListVo> get_2stCategoryList(CategoryListVo catecoryListVo) {
		List<CategoryListVo> categoryList2nd = categoryListDao.get_2ndCategoryList(catecoryListVo);
		return categoryList2nd;
	}


}
