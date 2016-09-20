package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TSF_MainController {
	
	@RequestMapping("/main")
	public String index() {
		
		System.out.println("userid ");

		return "TSF/main/index";
	}

}