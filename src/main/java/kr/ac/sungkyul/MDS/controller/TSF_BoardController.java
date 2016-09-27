package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class TSF_BoardController {

	@Autowired
	BoardService BoardService;

	@RequestMapping("/{userid}/board/{boardlist_no}")
	public String notice(@PathVariable String userid, @PathVariable int boardlist_no, HttpSession session) {
		/*// 게시판
		System.out.println("게시판 번호" + boardlist_no);

		// 일반, 기업, 관리자 권한을 사용하기 위해 로그인된 세션에서 유저의 정보를 가져온다
		MemberVo memberVo;
		memberVo = (MemberVo) session.getAttribute("authUser");
//		System.out.println("list session test " + memberVo);
		session.setAttribute("authUser", memberVo);
		
		
*/
		// 게시판 정보 가져오기
		BoardListVo GetBoard = BoardService.GetBoard(userid, boardlist_no);
		session.setAttribute("GetBoard", GetBoard);

		return "TSF/board/list";
	}

	@RequestMapping("main/board/writeform")
	public String writeform(HttpSession session) {

		System.out.println("main/notice/writeform");

		return "TSF/board/writeform";
	}

	// @RequestMapping(value = "main/notice/write", method = RequestMethod.POST)
	// // 글등록
	// public String registerBoard(BoardVo boardVo, MultipartFile file) throws
	// Exception {
	// System.out.println("글등록");
	//
	// BoardService.insertBoard(boardVo, file);
	//// System.out.println(file.getOriginalFilename().toString());
	//
	// return "redirect:/main/notice";
	// }

}