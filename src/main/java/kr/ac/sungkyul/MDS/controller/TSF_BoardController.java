package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class TSF_BoardController {

	@Autowired
	BoardService BoardService;

	@RequestMapping("/{userid}/board/{boardlist_no}")
	public String notice(@PathVariable String userid, @PathVariable int boardlist_no, HttpSession session) {
		/*
		 * // 게시판 System.out.println("게시판 번호" + boardlist_no);
		 * 
		 * // 일반, 기업, 관리자 권한을 사용하기 위해 로그인된 세션에서 유저의 정보를 가져온다 MemberVo memberVo;
		 * memberVo = (MemberVo) session.getAttribute("authUser"); //
		 * System.out.println("list session test " + memberVo);
		 * session.setAttribute("authUser", memberVo);
		 */
		// 게시판 정보 가져오기
		BoardListVo GetBoard = BoardService.GetBoard(userid, boardlist_no);
		session.setAttribute("GetBoard", GetBoard);

		// 해당 게시판에 게시글 가져오기
		List<BoardVo> GetBoardContentsList = BoardService.GetBoardContentsList(boardlist_no);
		session.setAttribute("GetBoardContentsList", GetBoardContentsList);

		return "TSF/board/list";
	}

	@RequestMapping("main/board/view")
	public String view(HttpSession session, @RequestParam(value = "no") int board_no ) {
		// list에서 글 제목 선택시 view로 연결
		

		// 선택한 게시글 내용 가져오기
		BoardVo GetBoardContent = BoardService.GetBoardContent(board_no);
		session.setAttribute("GetBoardContent", GetBoardContent);

		
		System.out.println("main/board/view");
		return "TSF/board/view";
	}
	
	@RequestMapping("main/board/writeform/{boardlist_no}")
	public String writeform(HttpSession session, @PathVariable int boardlist_no) {
		// list에서 글쓰기 버튼 클릭시 writeform으로 연결

		
		
		System.out.println("main/notice/writeform");
		return "TSF/board/writeform";
	}

	@RequestMapping(value = "main/board/write/{boardlist_no}", method = RequestMethod.POST)
	public String write(
			// 글쓰기창에서 등록버튼 눌렀을때 DB에 데이터 삽입후, list페이지로 복귀
			// HttpSession session, @RequestParam(value = "id", required =
			// false, defaultValue = "") String id,
			// @RequestParam(value = "password", required = false, defaultValue
			// = "") String password,
			// @RequestParam(value = "member_distinction", required = false,
			// defaultValue = "") int member_distinction
			@PathVariable int boardlist_no, @ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("write 등록버튼 클릭");
		
		System.out.println(boardlist_no + ", " + boardVo);

		
		// 새 글 등록하기
		BoardService.NewWrite(boardVo);

		return "redirect:/main/board/" + boardlist_no;
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