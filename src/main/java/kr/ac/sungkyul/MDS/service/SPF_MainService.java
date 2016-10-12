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
	
	/**
	 * SPF 개인 쇼핑몰의 Footer을 가져옴
	 * 만든이 : 이민우
	 * @param mall_no
	 * @return
	 */
	public MallVo get_Footer(int mall_no) {
		MallVo mallVo = mallDao.get_Footer(mall_no);
		return mallVo;
	}
	
	/**
	 * SPF 개인 쇼핑몰의 카테고리를 가져옴
	 * 만든이 : 이민우
	 * @param mallVo
	 * @return
	 */
	public List<CategoryListVo> get_CategoryList(MallVo mallVo){
		List<CategoryListVo> categoryList = categoryListDao.get_CategoryList(mallVo);
		return categoryList;
	}


}
