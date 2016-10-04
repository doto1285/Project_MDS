package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class SPF_MainController {

	@Autowired
	SPF_MainService mainService;

	public boolean isUserCheck(String domain, HttpSession session) {

		// 사용법
		// if(!isUserCheck(domain, session)) {
		// return "redirect:/main";
		// }

		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		if (memberVo == null || memberVo.getMember_id() != domain) {
			return false;
		}
		return true;
	}

	/**
	 * 쇼핑몰 프론트 메인화면
	 * 
	 * @param domain
	 * @param model
	 * @return
	 */
	@RequestMapping("{domain}/main")
	public String index(@PathVariable String domain, Model model, HttpSession session) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);

		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		model.addAttribute("memberVo", memberVo);

		if (!isUserCheck(domain, session)) {
			return "redirect:/main";
		}
		
		return "SPF/main/index";
	}

	@RequestMapping("{domain}/join")
	public String join(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/member/join";
	}

	@RequestMapping("{domain}/login")
	public String login(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/member/login";
	}

	@RequestMapping("{domain}/list")
	public String list(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/product/list";
	}

	@RequestMapping("{domain}/list/detail")
	public String listDetail(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/product/listDetail";
	}

	@RequestMapping("{domain}/order")
	public String order(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/order/order";
	}

	@RequestMapping("{domain}/shoppingbasket")
	public String shoppingBasket(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/subMenu/shoppingBasket";
	}

	@RequestMapping("{domain}/orderdelivery")
	public String orderDelivery(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/subMenu/orderDelivery";
	}

}
