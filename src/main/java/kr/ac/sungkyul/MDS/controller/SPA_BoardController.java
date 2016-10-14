package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/SPA")
public class SPA_BoardController {
	
	@RequestMapping(value = "{domain}/makeboard", method = RequestMethod.GET)
	public String makeboardform(@PathVariable String domain, HttpSession session) {
		return "SPA/member/makeboard";
	}

}
