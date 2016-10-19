package kr.ac.sungkyul.MDS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.service.SPF_ListDetailService;
import kr.ac.sungkyul.MDS.service.SPF_ProductService;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;

@Controller
public class SPF_ListDetailController {
	
	@Autowired
	SPF_ListDetailService SPF_listDetailService;

	@RequestMapping("{mall_domain}/listdetail")
	public String listDetail(@PathVariable String mall_domain, Model model, ProductVo productVo) {

		int product_no = productVo.getProduct_no();
		Map<String, Object> map = new HashMap<String, Object>();
		map = SPF_listDetailService.get_Product_detail(product_no);
		model.addAttribute("map", map);
		
		return "SPF/product/listDetail";
	}

	@ResponseBody
	@RequestMapping(value = "{mall_domain}/productOption", method = RequestMethod.POST)
	public List<ProductOptionVo> productOption(@PathVariable String mall_domain, Model model, 
			@RequestBody ProductOptionVo productOptionVo) {
		List<ProductOptionVo> sizeList = SPF_listDetailService.get_Product_Option_SizeList(productOptionVo);
		
		return sizeList;
	}
	
	
}
