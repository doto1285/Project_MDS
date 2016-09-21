package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.vo.MemberVo;


@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	

	@RequestMapping("/main/loginfrom")
	public String index() {

		System.out.println("로그인 화면");

		return "member/loginform";
	}

	
	@RequestMapping( value="/main/login", method=RequestMethod.POST )
	public String login(
		HttpSession session,
		@RequestParam( value = "id", required=false, defaultValue="" ) String id,
		@RequestParam( value="password", required=false, defaultValue="" ) String password
		){

		System.out.println("controller - " + id + "  "+ password);
		MemberVo authUser = memberService.login( id, password );
		
		
		if( authUser == null ) {
			return "redirect:/main/loginform";	
		}
		
		// 인증 성공
		session.setAttribute( "authUser", authUser);
		
		return "redirect:/main";
	}
	
	
	
}
