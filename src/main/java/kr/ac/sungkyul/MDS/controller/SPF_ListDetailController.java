package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SPF_ListDetailController {

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
