package kr.ac.sungkyul.MDS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.vo.MallVo;
import net.sf.json.JSONArray;

@Controller
public class SPF_OrderController {

	@RequestMapping("{mall_domain}/order")
	public String shoppingBasketInsert(@PathVariable String mall_domain, Model model, HttpSession session)
	{
		return "SPF/order/order";
	}
	
}
