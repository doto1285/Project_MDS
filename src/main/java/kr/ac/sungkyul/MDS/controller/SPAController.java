package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/SPA")
public class SPAController {
	
	@RequestMapping("{userid}/main")
	public String index(@PathVariable String userid) {
		
		System.out.println("userid " + userid);

		return "SPA/main/index";
	}

}