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
		//개인회원, 기업회원 로그인
		System.out.println("로그인 화면");

		return "member/loginform";
	}
	
	@RequestMapping("/main/loginfromadmin")
	public String admin_login() {
		//관리자 로그인
		System.out.println("관리자 로그인 화면");
		
		return "member/admin_loginform";
	}

	
	@RequestMapping( value="/main/login", method=RequestMethod.POST )
	public String login(
			//개인, 기업회원 로그인
		HttpSession session,
		@RequestParam( value = "id", required=false, defaultValue="" ) String id,
		@RequestParam( value="password", required=false, defaultValue="" ) String password,
		@RequestParam( value="member_distinction", required=false, defaultValue="" ) int member_distinction
		
		){

		System.out.println("controller - " + id + "  "+ password + member_distinction);
		MemberVo authUser = memberService.login( id, password, member_distinction);
		
		
		if( authUser == null ) {
			System.out.println("로그인 실패");
			return "redirect:/main/loginfrom";	
		}
		
		// 인증 성공
		System.out.println("로그인 성공");
		session.setAttribute( "authUser", authUser);
		
		return "redirect:/main";
	}
	
	@RequestMapping("/main/logout")
	//로그아웃
	public String logout( HttpSession session ) {
	System.out.println("로그아웃");
		session.removeAttribute( "authUser" );
		session.invalidate();
		return "redirect:/main";
		
	}
	
}
