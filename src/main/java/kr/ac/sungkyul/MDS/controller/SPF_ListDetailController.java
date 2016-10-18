package kr.ac.sungkyul.MDS.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.service.SPF_ProductService;
import kr.ac.sungkyul.MDS.vo.ProductVo;

@Controller
public class SPF_ListDetailController {
	
	@Autowired
	SPF_ProductService SPF_productService;

	@RequestMapping("{mall_domain}/listdetail")
	public String listDetail(@PathVariable String mall_domain, Model model, ProductVo productVo) {

		int product_no = productVo.getProduct_no();
		Map<String, Object> map = new HashMap<String, Object>();
		map = SPF_productService.get_Product_detail(product_no);
		model.addAttribute("map", map);
		
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
