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
import kr.ac.sungkyul.MDS.service.SPA_MainService;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Controller
@RequestMapping("/SPA")
public class SPA_MainController {

	@Autowired
	MemberService memberService;

	@Autowired
	SPA_MainService SPA_mainservice;

	@Autowired
	SPA_CategoryListService categoryListService;

	/**
	 * 메인화면 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/main", method = RequestMethod.GET)
	public String index(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/main/index";
	}

	/**
	 * 쇼핑몰정보관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/mall", method = RequestMethod.GET)
	public String mall(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		MallVo mallVo = SPA_mainservice.getSelectMall(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPA/mall/mall";
	}

	/**
	 * 쇼핑몰 로고이미지 관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/malllogo", method = RequestMethod.GET)
	public String malllogoimg(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/mall/malllogoimg";
	}

	/**
	 * 쇼핑몰 메인이미지 관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/mallmain", method = RequestMethod.GET)
	public String mallmainimg(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/mall/mallmainimg";
	}

	/**
	 * 쇼핑몰 정보수정 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @param mallVo
	 * @return
	 */
	@RequestMapping(value = "{domain}/mallmodify", method = RequestMethod.POST)
	public String mallmodify(@PathVariable String domain, HttpSession session, Model model, MallVo mallVo) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		SPA_mainservice.modifyMall(mallVo);
		return "redirect:/SPA/" + domain + "/mall";
	}

	//////////////////////
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

	@RequestMapping(value = "{domain}/categorymodifyform", method = RequestMethod.GET)
	// 수정하는 폼
	public String categorylistModifyForm(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		// Map<String, Object> categoryListMap =
		// categoryListService.getCategoryList(domain);
		// model.addAttribute("map", categoryListMap);
		return "SPA/category/categorymodifyform";
	}

	@RequestMapping(value = "{domain}/categorymodify", method = RequestMethod.POST)
	public String categorylistModify(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		// 저장하기 눌렀을때
		return "redirect:/SPA/" + domain + "/category";
	}
	///////////////////////////////////

	@RequestMapping(value = "{domain}/product", method = RequestMethod.GET)
	public String productlist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productlist";
	}

	@RequestMapping(value = "{domain}/productinsertform", method = RequestMethod.GET)
	public String productinsert(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productinsertform";
	}

	@RequestMapping(value = "{domain}/productmodifyform", method = RequestMethod.GET)
	public String productmodifyform(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productmodifyform";
	}

	@RequestMapping(value = "{domain}/order", method = RequestMethod.GET)
	public String orderlist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		Map<String, Object> map = SPA_mainservice.getOrderinfo(domain);
		model.addAttribute("map", map);
		return "SPA/order/orderlist";
	}

	@RequestMapping(value = "{domain}/member", method = RequestMethod.GET)
	public String memberlist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/memberlist";
	}

	@RequestMapping(value = "{domain}/faq", method = RequestMethod.GET)
	public String faqlist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqlist";
	}

	@RequestMapping(value = "{domain}/faqview", method = RequestMethod.GET)
	public String faqview(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqview";
	}

	@RequestMapping(value = "{domain}/faqinsertform", method = RequestMethod.GET)
	public String faqinsert(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqinsertform";
	}

	@RequestMapping(value = "{domain}/qna", method = RequestMethod.GET)
	public String qnalist(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnalist";
	}

	@RequestMapping(value = "{domain}/qnaview", method = RequestMethod.GET)
	public String qnaview(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnaview";
	}

	@RequestMapping(value = "{domain}/qnainsertform", method = RequestMethod.GET)
	public String qnainsertform(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnainsertform";
	}
}