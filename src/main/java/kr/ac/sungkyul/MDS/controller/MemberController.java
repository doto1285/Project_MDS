package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {

	@RequestMapping("/main/login")
	public String index() {

		System.out.println("로그인 화면");

		return "member/loginform";
	}

}
