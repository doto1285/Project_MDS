package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/SPA")
public class SPA_MainController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping("{userid}/main")
	public String index(@PathVariable String userid, HttpSession session) {
		//세션 값이랑 userid랑 일치하는지 확인
		/**
		MemberVo memberVo = (MemberVo) session.getAttribute("member");
		memberVo = memberService.check(memberVo.getMember_no());
		if( memberVo == null ) {
			return "redirect:/main";	
		}
		**/
		
		return "SPA/main/index";
	}
	
	@RequestMapping
	public String categorylist() {
		return null;
	}

}