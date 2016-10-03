package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.TSA_BoardService;
import kr.ac.sungkyul.MDS.service.TSA_MainService;
import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/TSA")
public class TSA_MainController {
	
	@Autowired
	MemberService memberService;
	@Autowired
	BoardService boardService;
	

	@RequestMapping("/admin/main")
	public String index(HttpSession httpSession) {
//		httpSession.getAttribute(arg0);
//		
//		if() {
//			return "admin_loginform";
//		}

		return "member/admin_loginform";
	}

	@RequestMapping("main/login")
	public String login(
			// 개인, 기업회원 로그인
			HttpSession session, @RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "member_distinction", required = false, defaultValue = "") int member_distinction

	) {
		if(member_distinction != 9) {
			return "TSA/admin/main";
		}
		System.out.println("controller - " + id + "  " + password + member_distinction);
		MemberVo authUser = memberService.login(id, password, member_distinction);

		if (authUser == null) {
			System.out.println("로그인 실패");
			return "//";
		}

		// 인증 성공
		System.out.println("로그인 성공");
		session.setAttribute("authUser", authUser);

		return "TSA/main/index";
	}
	@RequestMapping("/main/logout")
	// 로그아웃
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("authUser");
		session.invalidate();
		return "member/admin_loginform";
	}
	
	
	@RequestMapping("/main/notice")
	public String list(HttpSession session) {
		//해당 게시판에 게시글 가져오기
				List<BoardVo> GetBoardContentsList= boardService.GetBoardContentsList(1);
				session.setAttribute("GetBoardContentsList", GetBoardContentsList);
		System.out.println("notice");
		return "TSA/board/notice";
	}
	@RequestMapping("/main/servicecenter")
	public String list1() {
		System.out.println("servicecenter");
		return "TSA/board/servicecenter";
	}
	@RequestMapping("/main/shopmanage")
	public String list2() {
		System.out.println("shopmanage");
		return "TSA/board/shopmanage";
	}
	@RequestMapping("/main/usermanage")
	public String list3() {
		System.out.println("usermanage");
		return "TSA/board/usermanage";
	}

}
