package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPA_CategoryListService;
import kr.ac.sungkyul.MDS.service.SPA_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Controller
@RequestMapping("/SPA")
public class SPA_CategoryController {

	@Autowired
	MemberService memberService;

	@Autowired
	SPA_MainService SPA_mainservice;
	
	@Autowired
	SPF_MallService SPF_MallService;

	@Autowired
	SPA_CategoryListService categoryListService;

	@RequestMapping(value = "{domain}/category/{group_no}", method = RequestMethod.GET)
	// 리스트 출력
	public String categorylist(@PathVariable String domain, @PathVariable int group_no, HttpSession session, Model model) {
		// Map<String, Object> categoryListMap =
		// categoryListService.getCategoryList(domain);
		// model.addAttribute("map", categoryListMap);

		// 해당 쇼핑몰의 카테고리 리스트를 불러온다 sky
		List<CategoryListVo> categoryList = categoryListService.getCategoryList(domain);

		for (CategoryListVo vo : categoryList) {

			System.out.println("카테고리 리스트 " + vo);
		}
		System.out.println("===================================");
		
		model.addAttribute("categoryList", categoryList);
		session.setAttribute("group_no", group_no);

		return "SPA/category/categorylist";
	}

	@RequestMapping(value = "{domain}/categorymodifyform", method = RequestMethod.GET)
	// 수정하는 폼
	public String categorylistModifyForm(@PathVariable String domain, HttpSession session, Model model) {
		// Map<String, Object> categoryListMap =
		// categoryListService.getCategoryList(domain);
		// model.addAttribute("map", categoryListMap);
		return "SPA/category/categorymodifyform";
	}

	@ResponseBody
	@RequestMapping(value = "{domain}/categorymodify", method = RequestMethod.POST)
	public String categorylistModify(@PathVariable String domain, HttpSession session,String msgchangeName, int msgchangecateNo) {
		// 카테고리 이름 변경시 모달창에서 저장하기 눌렀을때 sky
		
		System.out.println("수정 이름"+msgchangeName);
		System.out.println("수정 번호"+msgchangecateNo);
		
		CategoryListVo vo = new CategoryListVo();
		vo.setCategorylist_name(msgchangeName.trim());
		vo.setCategorylist_no(msgchangecateNo);
		
		System.out.println("수정할 객체" + vo);
		
		
		categoryListService.ModifyName(vo);
		
		 vo = categoryListService.getMyVo(msgchangecateNo);
		String url = "http://localhost:8088/Project_MDS/SPA/12maket/category/" + vo.getCategorylist_group();
		System.out.println("url test : " + url);
		return url;
	}
	
	@RequestMapping(value = "{domain}/category/insertCategory", method = RequestMethod.GET)
	public String InsertCategory(@PathVariable String domain,
			//새로운 1차 카테고리 추가
			@RequestParam(value = "newCategorie") String newCategorie,
			@RequestParam(value = "count_order") int count_order
			) {
		
		System.out.println("버튼 클릭" + domain + newCategorie);
		int mall_no =  (SPF_MallService.domainCheck(domain)).getMall_no();
		
		System.out.println("가져온 mall_no " + mall_no);
		CategoryListVo vo = new CategoryListVo();
		vo.setCategorylist_name(newCategorie);
		vo.setCategorylist_orderno(count_order);
		vo.setCategorylist_depth(1);
		vo.setCategorylist_state(1);
		vo.setMall_no(mall_no);
		
		System.out.println("추가할 카테고리 " + vo);
		categoryListService.InsertCategory(vo);
		
		return "redirect:/SPA/"+domain+"/category/0";
	}
	
	@RequestMapping(value = "{domain}/category/insertCategoryV2", method = RequestMethod.GET)
	public String insertCategoryV2(@PathVariable String domain,
			//새로운 2차 카테고리 추가
			@RequestParam(value = "newCategorie") String newCategorie,
			@RequestParam(value = "group_no") int group_no,
			@RequestParam(value = "count_order") int count_order
			) {
		
		System.out.println("group_no: " + group_no);
		System.out.println("버튼 클릭" + domain + newCategorie);
		int mall_no =  (SPF_MallService.domainCheck(domain)).getMall_no();
		
		System.out.println("가져온 mall_no " + mall_no);
		
		CategoryListVo vo = new CategoryListVo();
		vo.setCategorylist_name(newCategorie);
		vo.setCategorylist_group(group_no);
		vo.setCategorylist_orderno(count_order);
		vo.setCategorylist_depth(2);
		vo.setCategorylist_state(1);
		vo.setMall_no(mall_no);
		
		System.out.println("해당그룹의 2차 카테고리 개수: " + count_order);

		
		System.out.println("추가할 카테고리 " + vo);
		categoryListService.InsertCategory(vo);
		
		return "redirect:/SPA/"+domain+"/category/"+group_no;
	}
	
	
	@ResponseBody	//ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/categorydelete", method = RequestMethod.POST)
	// 카테고리 삭제 sky
	public String categorydelete(@PathVariable String domain, HttpSession session, Model model, int msgchangecateNo) {
		
		System.out.println("삭제할 카테고리 " + msgchangecateNo);
		
		categoryListService.DeleteCategory(msgchangecateNo);
		
		return "javascript:window.location.reload(true)";
	}
	
	
	
	@ResponseBody	//ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/categoryUp", method = RequestMethod.POST)
	// 카테고리 Up sky
	public String categoryUp(@PathVariable String domain, HttpSession session, Model model, int msgchangecateNo) {
		
		System.out.println("위로 올라갈 카테고리 번호 : " + msgchangecateNo);
		categoryListService.categoryUp(msgchangecateNo);
		
		return "javascript:window.location.reload(true)";
	}

	
	
	@ResponseBody	//ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/categoryDown", method = RequestMethod.POST)
	// 카테고리 Down sky
	public String categoryDown(@PathVariable String domain, HttpSession session, Model model, int msgchangecateNo) {
		
		System.out.println("아래로 내려갈 카테고리 번호 : " + msgchangecateNo);
		categoryListService.categoryDown(msgchangecateNo);
		
		return "javascript:window.location.reload(true)";
	}
	
	@RequestMapping(value = "{domain}/category", method = RequestMethod.GET)
	// 리스트 출력
	public String categorylist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		// Map<String, Object> categoryListMap =
		// categoryListService.getCategoryList(domain);
		// model.addAttribute("map", categoryListMap);
		return "SPA/category/categorylist";
	}


	

}