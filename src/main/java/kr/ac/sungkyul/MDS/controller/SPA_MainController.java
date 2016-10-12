package kr.ac.sungkyul.MDS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPA_CategoryListService;
import kr.ac.sungkyul.MDS.service.SPA_MainService;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

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
	 * 로그아웃
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/logout", method = RequestMethod.GET)
	public String logout(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/main";
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
	public String mallLogoImg(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		String url = SPA_mainservice.getMallImg(domain, 0);
		model.addAttribute("url", url);
		return "SPA/mall/malllogoimg";
	}
	
	@RequestMapping(value = "{domain}/malllogomodify", method = RequestMethod.POST)
	public String mallLogoImgModify(@PathVariable String domain, HttpSession session, MultipartFile file) throws Exception {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		if (file.isEmpty()) {
			return "redirect:/SPA/" + domain + "/malllogo";
		}
		SPA_mainservice.insertMallImg(domain, file, 0);
		return "redirect:/SPA/" + domain + "/malllogo";
	}
	
	@RequestMapping(value = "{domain}/malllogodelete", method = RequestMethod.POST)
	public String mallLogoImgDelete(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "redirect:/SPA/" + domain + "/malllogo";
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
	public String mallMainImg(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/mall/mallmainimg";
	}
	
	@RequestMapping(value = "{domain}/mallmainmodify", method = RequestMethod.POST)
	public String mallMainImgModify(@PathVariable String domain, HttpSession session, MultipartFile file) throws Exception {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		
		return "redirect:/SPA/" + domain + "/mallmain";
	}
	
	@RequestMapping(value = "{domain}/mallmaindelete", method = RequestMethod.POST)
	public String mallMainImgDelete(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "redirect:/SPA/" + domain + "/mallmain";
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
	public String mallModify(@PathVariable String domain, HttpSession session, MallVo mallVo) {
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

	/**
	 * 상품 리스트 화면
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/product", method = RequestMethod.GET)
	public String productList(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productlist";
	}

	@RequestMapping(value = "{domain}/productinsertform", method = RequestMethod.GET)
	public String productInsert(@PathVariable String domain, HttpSession session) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productinsertform";
	}

	@RequestMapping(value = "{domain}/productmodifyform", method = RequestMethod.GET)
	public String productModifyForm(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/product/productmodifyform";
	}

	/**
	 * 주문목록 화면
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/order", method = RequestMethod.GET)
	public String orderList(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		Map<String, Object> map = SPA_mainservice.getOrderInfo(domain);
		model.addAttribute("map", map);
		return "SPA/order/orderlist";
	}

	/**
	 * 고객목록 화면
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/member", method = RequestMethod.GET)
	public String memberList(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		List<MemberVo> list = SPA_mainservice.getMemberInfo(domain);
		model.addAttribute("list", list);
		return "SPA/member/memberlist";
	}

	/**
	 * FAQ 게시판 출력
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/faq", method = RequestMethod.GET)
	public String faqList(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqlist";
	}

	@RequestMapping(value = "{domain}/faqview", method = RequestMethod.GET)
	public String faqView(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqview";
	}

	@RequestMapping(value = "{domain}/faqinsertform", method = RequestMethod.GET)
	public String faqInsert(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/faqinsertform";
	}

	/**
	 * Q&A 게시판 출력
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/qna", method = RequestMethod.GET)
	public String qnaList(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnalist";
	}

	@RequestMapping(value = "{domain}/qnaview", method = RequestMethod.GET)
	public String qnaView(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnaview";
	}

	@RequestMapping(value = "{domain}/qnainsertform", method = RequestMethod.GET)
	public String qnaInsertform(@PathVariable String domain, HttpSession session, Model model) {
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		return "SPA/member/qnainsertform";
	}
}