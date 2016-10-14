package kr.ac.sungkyul.MDS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.TSA_BoardService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/TSA")

public class TSA_BoardController {

	@Autowired
	TSA_BoardService TSA_BoardService;

	@RequestMapping("main/board/{boardlist_no}")
	public String notice(Model model, @PathVariable String userid, @PathVariable int boardlist_no, HttpSession session,
			@RequestParam(value = "p", required = true, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
		/*
		 * // 게시판 System.out.println("게시판 번호" + boardlist_no);
		 * 
		 * // 일반, 기업, 관리자 권한을 사용하기 위해 로그인된 세션에서 유저의 정보를 가져온다 MemberVo memberVo;
		 * memberVo = (MemberVo) session.getAttribute("authUser"); //
		 * System.out.println("list session test " + memberVo);
		 * session.setAttribute("authUser", memberVo);
		 */
		// 게시판 정보 가져오기
		BoardListVo GetBoard = TSA_BoardService.GetBoard(userid, boardlist_no);
		session.setAttribute("GetBoard", GetBoard);

		int pagesize = 5;

		// 해당 게시판에 게시글 가져오기
		Map<String, Object> map = TSA_BoardService.GetBoardContentsList(boardlist_no, page, keyword);
		model.addAttribute("map", map);

		return "TSA/board/notice";
	}

	@RequestMapping("main/board/view")
	public String view(HttpSession session, @RequestParam(value = "no") int board_no) {
		// list에서 글 제목 선택시 view로 연결

		// 선택한 게시글 내용 가져오기
		BoardVo GetBoardContent = TSA_BoardService.GetBoardContent(board_no);
		session.setAttribute("GetBoardContent", GetBoardContent);

		System.out.println("/TSA/main/board/view");
		return "TSA/board/view";
	}

	@RequestMapping("main/logout")
	// 로그아웃
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.setAttribute("authUser",null);
		session.invalidate();
		return "redirect:/TSA/admin/main";
	}

	

	@RequestMapping("/main/board/notice")
	public String list() {
		System.out.println("servicecenter");
		return "TSA/board/notice";
	}
	
	@RequestMapping("/main/board/servicecenter")
	public String list1() {
		System.out.println("servicecenter");
		return "TSA/board/servicecenter";
	}
	@RequestMapping("/main/board/qna")
	public String list2() {
		System.out.println("servicecenter");
		return "TSA/board/qna";
	}

	@RequestMapping("/main/board/shopmanage")
	public String list3() {
		System.out.println("shopmanage");
		return "TSA/board/shopmanage";
	}

	@RequestMapping("/main/board/usermanage")
	public String list4() {
		System.out.println("usermanage");
		return "TSA/board/usermanage";
	}

	@RequestMapping("/main/board/writeform/notice")
	public String writeform(HttpSession session) {
		// list에서 글쓰기 버튼 클릭시 writeform으로 연결
		return "TSA/board/writeform";
	}

	@RequestMapping(value = "/main/board/write/notice", method = RequestMethod.POST)
	public String write(@PathVariable int boardlist_no, @ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("write 등록버튼 클릭");
		System.out.println("모델 객체 테스트" + boardVo);

		// 새 글 등록하기
		TSA_BoardService.NewWrite(boardVo);

		return "redirect:TSA/main/board/" + boardlist_no;
	}

	@RequestMapping("/main/board/replyform/{boardlist_no}")
	public String replyform(HttpSession session, @PathVariable int boardlist_no) {
		// view에서 답글버튼 클릭시
		return "TSA/board/replyform";

	}

	@RequestMapping(value = "/main/board/reply/{board_no}", method = RequestMethod.POST)
	public String reply(@PathVariable int board_no, @ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("답글 모델 객체 테스트" + boardVo);

		// 답글 등록하기
		TSA_BoardService.ReplyWrite(boardVo);

		return "redirect:TSA/main/board/" + boardVo.getBoardlist_no();
	}

}