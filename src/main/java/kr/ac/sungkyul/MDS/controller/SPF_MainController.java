package kr.ac.sungkyul.MDS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Controller
public class SPF_MainController {
	
	@Autowired
	SPF_MainService mainService;

	@RequestMapping("{domain}/main")
	public String index(@PathVariable String domain, Model model) {
		MallVo mallVo = mainService.get_footer(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPF/main/index";
	}

	@RequestMapping("{domain}/join")
	public String join() {
		return "SPF/member/join";
	}

	@RequestMapping("{domain}/login")
	public String login() {
		return "SPF/member/login";
	}

	@RequestMapping("{domain}/list")
	public String list() {
		return "SPF/product/list";
	}

	@RequestMapping("{domain}/list/detail")
	public String listDetail() {
		return "SPF/product/listDetail";
	}

	@RequestMapping("{domain}/order")
	public String order() {
		return "SPF/order/order";
	}
	
	@RequestMapping("{domain}/shoppingbasket")
	public String shoppingBasket() {
		return "SPF/subMenu/shoppingBasket";
	}
	
	@RequestMapping("{domain}/orderdelivery")
	public String orderDelivery() {
		return "SPF/subMenu/orderDelivery";
	}
	
	@RequestMapping("spf/demo")
	public String header() {
		return "SPF/main/demo";
	}

}
