package kr.ac.sungkyul.MDS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.TSF_MainService;

public class SPF_ListController {

	@Autowired
	MemberService memberService;

	@Autowired
	TSF_MainService TSF_MainService;
	
	@Autowired
	SPF_MainService SPF_mainService;
	
	@Autowired
	SPF_MallService SPF_mallService;
	
	@RequestMapping("{mall_domain}/list")
	public String list(@PathVariable String mall_domain, Model model) {

		return "SPF/product/list";
	}

	@RequestMapping("{mall_domain}/list/detail")
	public String listDetail(@PathVariable String mall_domain, Model model) {

		return "SPF/product/listDetail";
	}

	@RequestMapping("{mall_domain}/order")
	public String order(@PathVariable String mall_domain, Model model) {

		return "SPF/order/order";
	}

	@RequestMapping("{mall_domain}/shoppingbasket")
	public String shoppingBasket(@PathVariable String mall_domain, Model model) {

		return "SPF/subMenu/shoppingBasket";
	}

	@RequestMapping("{mall_domain}/orderdelivery")
	public String orderDelivery(@PathVariable String mall_domain, Model model) {

		return "SPF/subMenu/orderDelivery";
	}
	
}
