package kr.ac.sungkyul.MDS.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class SPF_BoardController {

	@RequestMapping("/{domain}/boardlist/{boardlist_no}")
	public String boardlist(@PathVariable String domain, @PathVariable int boardlist_no){
		
		return "SPF/board/board";
	}
	
	@RequestMapping("/{domain}/view/{boardlist_no}")
	public String view(@PathVariable String domain, @PathVariable int boardlist_no){
		
		return "SPF/board/boardreplyform";
	}
	
	@RequestMapping("/{domain}/write/{boardlist_no}")
	public String write(@PathVariable String domain, @PathVariable int boardlist_no){
		
		return "SPF/board/boardview";
	}
	
	@RequestMapping("/{domain}/reply/{boardlist_no}")
	public String reply(@PathVariable String domain, @PathVariable int boardlist_no){
		
		return "SPF/board/boardwriteform";
	}
	
	
	
}
