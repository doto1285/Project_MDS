package kr.ac.sungkyul.MDS.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.TSF_MainService;

@Controller
public class TSF_MainController {
	

	@Autowired
	TSF_MainService TSF_MainService;
	
	@RequestMapping("/main")
	public String index() {
		
		System.out.println("userid ");
	
		return "TSF/main/index";
	}

}