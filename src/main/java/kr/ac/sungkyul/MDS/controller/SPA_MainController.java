package kr.ac.sungkyul.MDS.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPA_CategoryListService;
import kr.ac.sungkyul.MDS.service.SPA_MallService;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/SPA")
public class SPA_MainController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	SPA_MallService SPA_mallservice;

	@Autowired
	SPA_CategoryListService categoryListService;

	@RequestMapping(value = "{domain}/main", method = RequestMethod.GET)
	public String index(@PathVariable String domain, HttpSession session) {
		return "SPA/main/index";
	}

	@RequestMapping(value = "{domain}/mall", method = RequestMethod.GET)
	public String mall(@PathVariable String domain, HttpSession session, Model model) {
		MallVo mallVo = SPA_mallservice.getSelectMall(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPA/mall/mall";
	}

	@RequestMapping(value = "{domain}/mallmodify", method = RequestMethod.POST)
	public String mallmodify(@PathVariable String domain, HttpSession session, Model model, MallVo mallVo) {
		System.out.println(mallVo);
		System.out.println(SPA_mallservice.modifyMall(mallVo));
		return "redirect:/SPA/"+domain+"/mall";
	}

	@RequestMapping(value = "{domain}/category", method = RequestMethod.GET)
	public String categorylist(@PathVariable String domain, HttpSession session, Model model) {
		Map<String, Object> categoryListMap = categoryListService.getCategoryList(domain);
		model.addAttribute("map", categoryListMap);
		return "SPA/category/categorylist";
	}

	@RequestMapping(value = "{domain}/categorymodifyform", method = RequestMethod.GET)
	public String categorylistModifyForm(@PathVariable String domain, HttpSession session, Model model) {
		Map<String, Object> categoryListMap = categoryListService.getCategoryList(domain);
		model.addAttribute("map", categoryListMap);
		return "SPA/category/categorymodifyform";
	}

	@RequestMapping(value = "{domain}/categorymodify", method = RequestMethod.GET)
	public String categorylistModify(@PathVariable String domain, HttpSession session, Model model) {
		// 미구현
		return null;
	}
	
	@RequestMapping(value = "{domain}/product", method = RequestMethod.GET)
	public String productlist(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/product/productlist";
	}
	
	@RequestMapping(value = "{domain}/productinsertform", method = RequestMethod.GET)
	public String productinsert(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/product/productinsertform";
	}
	
	@RequestMapping(value = "{domain}/productmodifyform", method = RequestMethod.GET)
	public String productmodifyform(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/product/productmodifyform";
	}
	
	@RequestMapping(value = "{domain}/order", method = RequestMethod.GET)
	public String orderlist(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/order/orderlist";
	}
	
	@RequestMapping(value = "{domain}/ordermanagement", method = RequestMethod.GET)
	public String ordermanagement(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/order/ordermanagement";
	}
	
	@RequestMapping(value = "{domain}/member", method = RequestMethod.GET)
	public String memberlist(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/memberlist";
	}
	
	@RequestMapping(value = "{domain}/faq", method = RequestMethod.GET)
	public String faqlist(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/faqlist";
	}
	
	@RequestMapping(value = "{domain}/faqview", method = RequestMethod.GET)
	public String faqview(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/faqview";
	}
	
	@RequestMapping(value = "{domain}/faqinsertform", method = RequestMethod.GET)
	public String faqinsert(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/faqinsertform";
	}
	
	@RequestMapping(value = "{domain}/qna", method = RequestMethod.GET)
	public String h(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/qnalist";
	}
	
	@RequestMapping(value = "{domain}/qnaview", method = RequestMethod.GET)
	public String i(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/qnaview";
	}
	
	@RequestMapping(value = "{domain}/qnainsertform", method = RequestMethod.GET)
	public String j(@PathVariable String domain, HttpSession session, Model model) {
		return "SPA/member/qnainsertform";
	}

	public boolean isUserCheck(String domain, HttpSession session) {

		// 사용법
		// if(!isUserCheck(userid, session)) {
		// return "redirect:/main";
		// }

		MemberVo memberVo = (MemberVo) session.getAttribute("member");
		if (memberVo == null || memberVo.getMember_id() != domain) {
			return false;
		}
		return true;
	}
}