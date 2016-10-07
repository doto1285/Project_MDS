package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;;

@Service
public class SPA_CategoryListService {

	@Autowired
	private CategoryListDao categoryListDao;

	// public Map<String, Object> getCategoryList(String domain) {
	// List<CategoryListVo> categoryList = categoryListDao.get(domain);
	// Map<String, Object> map = new HashMap<String, Object>();
	//
	// int group = 0;
	// String temp = "";
	// List<String> grouplist = new ArrayList<>();
	// List<String> list = new ArrayList<>();
	// for (CategoryListVo vo : categoryList) {
	// if (group != vo.getCategorylist_group()) {
	// if(!list.isEmpty()) {
	// map.put(temp, list);
	// System.out.println(temp);
	// list.clear();
	// temp = "";
	// }
	// group = vo.getCategorylist_group();
	// temp = vo.getCategorylist_name();
	// grouplist.add(vo.getCategorylist_name());
	// } else {
	// list.add(vo.getCategorylist_name());
	// }
	// }
	//
	// map.put("group", grouplist);
	// return map;
	// }

}
