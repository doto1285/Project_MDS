package kr.ac.sungkyul.MDS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.service.SPF_OrderDeliveryService;
import kr.ac.sungkyul.MDS.service.SPF_OrderService;
import kr.ac.sungkyul.MDS.vo.MallVo;
import net.sf.json.JSONArray;

@Controller
public class SPF_OrderDeliveryController {

	// @Autowired
	// SPF_OrderDeliveryService SPF_orderDeliveryService;

	@Autowired
	SPF_MallService SPF_mallService;

	@Autowired
	SPF_MainService SPF_mainService;

	@Autowired
	SPF_MallimgService SPF_mallimgService;

	@Autowired
	BoardService boardService;

	@Autowired
	MemberService memberService;
	
	@Autowired
	SPF_OrderDeliveryService SPF_orderDeliveryService;

	@RequestMapping("{mall_domain}/orderdelivery")
	public String orderDelivery(@PathVariable String mall_domain, Model model, HttpSession session) {

		return "SPF/subMenu/orderDelivery";
	}

	@ResponseBody
	@RequestMapping("{mall_domain}/orderdeliveryinsert")
	public String orderDeliveryInsert(@PathVariable String mall_domain, Model model, HttpSession session,
			@RequestBody String paramData) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		SPF_orderDeliveryService.orderInfoInsert(resultMap, mallVo.getMall_no());

		return "http://localhost:8088/Project_MDS/" + mall_domain + "/orderdelivery";
	}
	
	@ResponseBody
	@RequestMapping("{mall_domain}/basketdeleteoforder")
	public String basketDeleteOfOrder(@PathVariable String mall_domain, Model model, HttpSession session,
			@RequestBody String paramData) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		SPF_orderDeliveryService.deleteBasket(resultMap);

		return "http://localhost:8088/Project_MDS/" + mall_domain + "/orderdelivery";
	}

}
