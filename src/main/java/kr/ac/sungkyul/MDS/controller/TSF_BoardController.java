package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class TSF_BoardController {

	@Autowired
	TSF_MainService TSF_BoardService;

	@RequestMapping("/main/notice")
	public String notice(HttpSession session) {
		// 공지사항 리스트

		System.out.println("main/notice ");

		MemberVo memberVo;
		memberVo = (MemberVo) session.getAttribute("authUser");

		System.out.println("list session test " + memberVo);

		session.setAttribute("authUser", memberVo);
		return "TSF/board/notice_list";
	}

	@RequestMapping("main/notice/writeform")
	public String writeform(HttpSession session) {

		System.out.println("main/notice/writeform");

		return "TSF/board/notice_writeform";
	}
	
	

	@RequestMapping(value = "register", method = RequestMethod.POST)
	// 글등록
	public String registerBoard(BoardVo boardVo, MultipartFile file) throws Exception {
		System.out.println("글등록");
		BoardService.insertBoard(boardVo, file);
		System.out.println(file.getOriginalFilename().toString());
		return "redirect:list";
	}
	
	
	

}