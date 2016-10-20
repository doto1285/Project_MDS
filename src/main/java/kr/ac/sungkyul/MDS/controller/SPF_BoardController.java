package kr.ac.sungkyul.MDS.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
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

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class SPF_BoardController {

	@Autowired
	SPF_MallService SPF_mallService;
	@Autowired
	SPF_MainService SPF_mainService;
	@Autowired
	SPF_MallimgService SPF_mallimgService;
	@Autowired
	BoardService boardService;
	@Autowired
	MemberService memberService;

	@RequestMapping("/{domain}/boardlist")
	public String boardlist(@PathVariable String domain, HttpSession session,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no,
			@RequestParam(value = "p", required = true, defaultValue = "1") int page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword, Model model) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(domain);
		model.addAttribute("mall_domain", domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		/*
		 * Map<String, Object> makeModel = makeModel(mallVo);
		 * System.out.println(makeModel.toString());
		 * model.addAttribute("makeModel", makeModel);
		 */

		// Iterator<String> iterator = makeModel.keySet().iterator();
		// while (iterator.hasNext()) {
		// String key = (String) iterator.next();
		// System.out.print("key="+key);
		// System.out.println(" value="+makeModel.get(key));
		//
		// model.addAttribute("mallVo", key);
		// }

		// 쇼핑몰 footer 뿌려줌
		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
		model.addAttribute("mallVo", mallVo);
		// 카테고리 메뉴 뿌려줌
		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);
		model.addAttribute("categoryList1st", categoryList);
		model.addAttribute("categoryList2nd", categoryList);
		// 헤더의 로고이미지 뿌려줌
		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);
		model.addAttribute("mallimgVoLogo", mallimgVoLogo);
		// 헤더의 게시판 리스트 뿌려줌
		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
		model.addAttribute("boardList", boardList);

		// 해당 게시판 정보 가져오기
		// System.out.println("테스트1: " + domain +""+boardlist_no);
		BoardListVo GetBoard = boardService.GetBoard(domain, boardlist_no);

		model.addAttribute("GetBoard", GetBoard);
		// System.out.println("해당 게시판 정보: " + GetBoard);

		// 해당 게시판에 게시글 가져오기
		Map<String, Object> map = boardService.GetBoardContentsList(boardlist_no, page, keyword);
		model.addAttribute("map", map);

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			// 로그인 안한 회원일 경우 실행되는 코드

			return "SPF/board/list";
		}

		// 로그인 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		System.out.println("현재 로그인한 사용자: " + memberVo);

		model.addAttribute("memberVo", memberVo);

		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
		JoinMallVo joinmallVo = new JoinMallVo();
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
		if (memberService.SPFWhatUser(joinmallVo) == false) {
			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			joinmallVo.setMember_no(null);

			session.setAttribute("SPFauthUserSession", joinmallVo);
			JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
			model.addAttribute("SPFauthUser", SPFauthUser);

			return "SPF/board/list";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUserSession", joinmallVo);
		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
		model.addAttribute("SPFauthUser", SPFauthUser);

		return "SPF/board/list";
	}

	@RequestMapping("/{domain}/view")
	public String view(HttpSession session, @PathVariable String domain,
			@RequestParam(value = "board_no", required = false) int board_no,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no, Model model) {

		// 선택한 게시글 내용 가져오기
		BoardVo GetBoardContent = boardService.GetBoardContent(board_no);
		System.out.println("글 정보: " + GetBoardContent);
		session.setAttribute("GetBoardContent", GetBoardContent);

		BoardListVo GetBoard = boardService.GetBoard(domain, boardlist_no);
		model.addAttribute("GetBoard", GetBoard);

		return "SPF/board/boardview";
	}

	@RequestMapping("/{domain}/writeform")
	public String write(HttpSession session, @PathVariable String domain,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no) {
		// 글쓰기 버튼 클릭시, 글 작성 폼으로 연결
		session.setAttribute("boardlist_no", boardlist_no);
		return "SPF/board/boardwriteform";
	}

	@RequestMapping(value = "/{domain}/write", method = RequestMethod.POST)
	public String write(HttpSession session, @PathVariable String domain, @ModelAttribute BoardVo boardVo,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no) {
		System.out.println("write 등록버튼 클릭");
		System.out.println("모델 객체 테스트" + boardVo);

		// 새 글 등록하기
		boardService.NewWrite(boardVo);

		return "redirect:/{domain}/boardlist?boardlist_no=" + boardlist_no;
	}

	@RequestMapping("/{domain}/replyform")
	public String replyform(@PathVariable String domain,
			@RequestParam(value = "board_no", required = false) int board_no) {

		System.out.println("답글 달릴 원래글의 글번호: " + board_no);

		return "SPF/board/boardreplyform";
	}

	@RequestMapping("/{domain}/reply")
	public String reply(@PathVariable String domain, @ModelAttribute BoardVo boardVo,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no) {

		System.out.println("답글 달기 버튼 클릭" + boardVo);

		// 답글 등록하기
		boardService.ReplyWrite(boardVo);

		return "redirect:/{domain}/boardlist?boardlist_no=" + boardVo.getBoardlist_no();
	}

	private Map<String, Object> makeModel(MallVo mallVo) {
		// TODO Auto-generated method stub

		// 쇼핑몰 footer 뿌려줌
		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
		// model.addAttribute("mallVo", mallVo);
		// 카테고리 메뉴 뿌려줌
		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);
		// model.addAttribute("categoryList1st", categoryList);
		// model.addAttribute("categoryList2nd", categoryList);
		// 헤더의 로고이미지 뿌려줌
		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);
		// model.addAttribute("mallimgVoLogo", mallimgVoLogo);
		// 헤더의 게시판 리스트 뿌려줌
		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
		// model.addAttribute("boardList", boardList);

		Map<String, Object> makeModel = new HashMap<String, Object>();

		// 5. map에 객체 담기
		makeModel.put("mallVo", mallVo);
		makeModel.put("categoryList1st", categoryList);
		makeModel.put("categoryList2nd", categoryList);
		makeModel.put("mallimgVoLogo", mallimgVoLogo);
		makeModel.put("boardList", boardList);

		System.out.println(boardList.toString());
		return makeModel;
	}

}
