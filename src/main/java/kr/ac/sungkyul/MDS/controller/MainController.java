package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	@RequestMapping("{userid}/main")
	public String index(@PathVariable String userid) {
		
		System.out.println("userid " + userid);

		return "TSF/main/index";
	}

}