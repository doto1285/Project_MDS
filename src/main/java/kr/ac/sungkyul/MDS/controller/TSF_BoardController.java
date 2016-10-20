package kr.ac.sungkyul.MDS.controller;

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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;

@Controller
public class TSF_BoardController {

	@Autowired
	BoardService BoardService;

	@RequestMapping("/{userid}/board/{boardlist_no}")
	public String notice(Model model, HttpSession session, @PathVariable String userid, @PathVariable int boardlist_no,
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
		BoardListVo GetBoard = BoardService.GetBoard(userid, boardlist_no);
		session.setAttribute("GetBoard", GetBoard);

		int pagesize = 5;

		// 해당 게시판에 게시글 가져오기
		Map<String, Object> map = BoardService.GetBoardContentsList(boardlist_no, page, keyword);
		model.addAttribute("map", map);
		return "TSF/board/list";
	}

	@RequestMapping("main/board/view")
	public String view(HttpSession session, @RequestParam(value = "no") int board_no) {
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
		return "TSF/board/writeform";
	}

	@RequestMapping(value = "main/board/write/{boardlist_no}", method = RequestMethod.POST)
	public String write(@PathVariable int boardlist_no, @ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("write 등록버튼 클릭");
		System.out.println("모델 객체 테스트" + boardVo);

		// 새 글 등록하기
		BoardService.NewWrite(boardVo);

		return "redirect:/main/board/" + boardlist_no;
	}

	@RequestMapping("main/board/replyform/{boardlist_no}")
	public String replyform(HttpSession session, @PathVariable int boardlist_no) {
		// view에서 답글버튼 클릭시
		return "TSF/board/replyform";
	}

	@RequestMapping(value = "main/board/reply/{board_no}", method = RequestMethod.POST)
	public String reply(@PathVariable int board_no, @ModelAttribute BoardVo boardVo, HttpSession session) {
		System.out.println("답글 모델 객체 테스트" + boardVo);

		// 답글 등록하기
		BoardService.ReplyWrite(boardVo);

		return "redirect:/main/board/" + boardVo.getBoardlist_no();
	}
	
	
	@ResponseBody
	@RequestMapping("main/board/checkpw")
	//비밀번호 확인
	public String checkpw(
			Model model, 
			int board_no,
			String pw,
			@ModelAttribute BoardVo boardVo) {
		
		System.out.println("글번호, 비번: " + board_no + "  " + pw);
		
		boardVo.setBoard_no(board_no);
		boardVo.setBoard_password(pw);
		
		System.out.println("비번확인 " + boardVo);
		
		boolean boo = BoardService.checkPw(boardVo);
		System.out.println("컨트롤러 값 확인 : " + boo);
		
		
		if(boo){
			return "true";
		}
		else{
			return "f";
		}
		
	}
	
	
	
	
	@RequestMapping("main/board/modify")
	public String modify(Model model, 
			int board_no,
			@ModelAttribute BoardVo boardVo) {
		boardVo.setBoard_no(board_no);
		BoardService.BoardModify(boardVo);
		
		return "redirect:/main/board/view?no=" + board_no;
	}
	
	
	@RequestMapping("main/board/modifyform")
	public String modifyform(Model model,
			@RequestParam(value = "board_no") int board_no,
			String pw
			) {
		// list에서 글 제목 선택시 view로 연결

		System.out.println("게시글번호, 비번 : "+board_no + "  " + pw);
		
		// 게시글 수정하기
		// 선택한 게시글 내용 가져오기
		BoardVo GetBoardContent = BoardService.GetBoardContent(board_no);
		model.addAttribute("GetBoardContent", GetBoardContent);

		return "TSF/board/modifyform";
	}
	
	
	
	
	

	@RequestMapping("main/board/delete")
	public String delete(Model model, @RequestParam(value = "no") int board_no) {

		// 선택한 게시글 내용 가져오기
		BoardVo boardVo = BoardService.GetBoardContent(board_no);

		// 게시글 삭제하기 (state = 0으로 변경)
		// BoardService.delete(boardVo);
		
		System.out.println("삭제할 게시글: " + boardVo);

		return "redirect:/main/board/" + boardVo.getBoardlist_no();
	}
}