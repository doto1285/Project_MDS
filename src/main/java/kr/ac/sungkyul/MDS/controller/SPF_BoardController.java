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
	
		
		
		///////////////////////////////////////////////////////
		// 해당 쇼핑몰에 필요한 모델 객체들을 한번에 불러온다

		// 쇼핑몰정보, footer,, 카테고리, 로고이미지, 게시판 리스트
		// mall_domain, mallVo, categoryList1st, mallimgVoLogo, boardList
		Map<String, Object> makeModel = makeModel(domain, session);

		String[] keys = makeModel.keySet().toArray(new String[0]);
		for (int i = 0; i < keys.length; i++) {
			model.addAttribute(keys[i], makeModel.get(keys[i]));
		}
		///////////////////////////////////////////////////////

		
		
		
		
		// 도메인으로 mall_no 가져옴
		MallVo mallVo = SPF_mallService.domainCheck(domain);

		// // <a> 태그에 링크 이용 시 PathVariable에 들어가는 {domain} 설정
		// model.addAttribute("mall_domain", domain);

		// 화면에서 mall_no 체크시
		model.addAttribute("mall_no", mallVo.getMall_no());

		// 정상 개설된 쇼핑몰에 접속했는지 확인
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없거나, 삭제된 쇼핑몰 접속시 페이지를 찾을 수 없습니다. 화면
			return "redirect:/main/loginfrom";
		}

		// // footer
		// mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
		// model.addAttribute("mallVo", mallVo);
		//
		// // 카테고리 메뉴
		// List<CategoryListVo> categoryList =
		// SPF_mainService.get_CategoryList(mallVo);
		// model.addAttribute("categoryList1st", categoryList);
		// model.addAttribute("categoryList2nd", categoryList);
		//
		// // 로고이미지
		// MallimgVo mallimgVoLogo =
		// SPF_mallimgService.get_selectMallimg_logo(mallVo);
		// model.addAttribute("mallimgVoLogo", mallimgVoLogo);
		//
		// // 게시판 리스트
		// List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
		// model.addAttribute("boardList", boardList);

		// // 비회원인지 확인
		// if (memberService.isUserCheck(session) == false) {
		// // 비 회원일경우 아래코드 실행하고 컨트롤러 빠져나옴
		// return "SPF/board/list";
		// }
		//
		// // 통합회원일 때 아래 코드 실행
		// MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		// model.addAttribute("memberVo", memberVo);
		//
		// // 통합회원이 SPF회원인지 확인을 위한 사전작업
		// JoinMallVo joinmallVo = new JoinMallVo();
		// joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		// joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));
		//
		// // 통합회원이 SPF회원인지 확인
		// if (memberService.SPFWhatUser(joinmallVo) == false) {
		// // SPF회원이 아닐경우 아래 코드 실행
		// return "SPF/board/list";
		// }
		// // 현재 쇼핑몰에 가입된 경우 실행되는 코드
		// model.addAttribute("SPFauthUser", joinmallVo);
		////////////////////////////////////////////////////////////////////////////////////

		// 해당 게시판 정보 가져오기
		BoardListVo GetBoard = boardService.GetBoard(domain, boardlist_no);

		model.addAttribute("GetBoard", GetBoard);

		// 해당 게시판에 게시글 가져오기
		Map<String, Object> map = boardService.GetBoardContentsList(boardlist_no, page, keyword);
		model.addAttribute("map", map);

		return "SPF/board/list";
	}

	@RequestMapping("/{domain}/view")
	public String view(HttpSession session, @PathVariable String domain,
			@RequestParam(value = "board_no", required = false) int board_no,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no, Model model) {
		MallVo mallVo = SPF_mallService.domainCheck(domain);
		model.addAttribute("mall_domain", domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "redirect:/main/loginfrom";
		}
		///////////////////////////////////////////////////////
		// 해당 쇼핑몰에 필요한 모델 객체들을 한번에 불러온다
		Map<String, Object> makeModel = makeModel(domain, session);

		String[] keys = makeModel.keySet().toArray(new String[0]);
		for (int i = 0; i < keys.length; i++) {
			model.addAttribute(keys[i], makeModel.get(keys[i]));
		}
		///////////////////////////////////////////////////////

		// 선택한 게시글 내용 가져오기
		BoardVo GetBoardContent = boardService.GetBoardContent(board_no);
		System.out.println("글 정보: " + GetBoardContent);
		session.setAttribute("GetBoardContent", GetBoardContent);

		BoardListVo GetBoard = boardService.GetBoard(domain, boardlist_no);
		model.addAttribute("GetBoard", GetBoard);
		
		//게시글을 클릭하면 조회수가 1씩 증가한다.
		boardService.addHit(board_no);

//		// 로그인 세션 체크
//		if (memberService.isUserCheck(session) == false) {
//			// 로그인 안한 회원일 경우 실행되는 코드
//
//			return "SPF/board/boardview";
//		}
//
//		// 로그인 세션을 memberVo에 넣음
//		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
//		System.out.println("현재 로그인한 사용자: " + memberVo);
//
//		model.addAttribute("memberVo", memberVo);
//
//		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
//		JoinMallVo joinmallVo = new JoinMallVo();
//		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
//		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));
//
//		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
//		if (memberService.SPFWhatUser(joinmallVo) == false) {
//			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
//			joinmallVo.setMember_no(null);
//
//			session.setAttribute("SPFauthUserSession", joinmallVo);
//			JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//			model.addAttribute("SPFauthUser", SPFauthUser);
//
//			return "SPF/board/boardview";
//		}
//		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
//		session.setAttribute("SPFauthUserSession", joinmallVo);
//		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//		model.addAttribute("SPFauthUser", SPFauthUser);

		return "SPF/board/boardview";
	}

	@RequestMapping("/{domain}/writeform")
	public String writeform(HttpSession session, @PathVariable String domain,
			@RequestParam(value = "boardlist_no", required = false) int boardlist_no, Model model) {
		MallVo mallVo = SPF_mallService.domainCheck(domain);
		model.addAttribute("mall_domain", domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "redirect:/main/loginfrom";
		}
		///////////////////////////////////////////////////////
		// 해당 쇼핑몰에 필요한 모델 객체들을 한번에 불러온다

		// 쇼핑몰정보, footer,, 카테고리, 로고이미지, 게시판 리스트
		// mall_domain, mallVo, categoryList1st, mallimgVoLogo, boardList
		Map<String, Object> makeModel = makeModel(domain, session);

		String[] keys = makeModel.keySet().toArray(new String[0]);
		for (int i = 0; i < keys.length; i++) {
			model.addAttribute(keys[i], makeModel.get(keys[i]));
		}
		///////////////////////////////////////////////////////
//		// 쇼핑몰 footer 뿌려줌
//		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
//		model.addAttribute("mallVo", mallVo);
//		// 카테고리 메뉴 뿌려줌
//		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);
//		model.addAttribute("categoryList1st", categoryList);
//		model.addAttribute("categoryList2nd", categoryList);
//		// 헤더의 로고이미지 뿌려줌
//		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);
//		model.addAttribute("mallimgVoLogo", mallimgVoLogo);
//		// 헤더의 게시판 리스트 뿌려줌
//		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
//		model.addAttribute("boardList", boardList);

		// 글쓰기 버튼 클릭시, 글 작성 폼으로 연결
		session.setAttribute("boardlist_no", boardlist_no);

//		// 로그인 세션 체크
//		if (memberService.isUserCheck(session) == false) {
//			// 로그인 안한 회원일 경우 실행되는 코드
//
//			return "SPF/board/boardwriteform";
//		}
//
//		// 로그인 세션을 memberVo에 넣음
//		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
//		System.out.println("현재 로그인한 사용자: " + memberVo);
//
//		model.addAttribute("memberVo", memberVo);
//
//		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
//		JoinMallVo joinmallVo = new JoinMallVo();
//		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
//		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));
//
//		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
//		if (memberService.SPFWhatUser(joinmallVo) == false) {
//			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
//			joinmallVo.setMember_no(null);
//
//			session.setAttribute("SPFauthUserSession", joinmallVo);
//			JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//			model.addAttribute("SPFauthUser", SPFauthUser);
//
//			return "SPF/board/boardwriteform";
//		}
//		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
//		session.setAttribute("SPFauthUserSession", joinmallVo);
//		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//		model.addAttribute("SPFauthUser", SPFauthUser);

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
			@RequestParam(value = "board_no", required = false) int board_no, Model model, HttpSession session) {
		MallVo mallVo = SPF_mallService.domainCheck(domain);
		model.addAttribute("mall_domain", domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "redirect:/main/loginfrom";
		}
		///////////////////////////////////////////////////////
		// 해당 쇼핑몰에 필요한 모델 객체들을 한번에 불러온다

		// 쇼핑몰정보, footer,, 카테고리, 로고이미지, 게시판 리스트
		// mall_domain, mallVo, categoryList1st, mallimgVoLogo, boardList
		Map<String, Object> makeModel = makeModel(domain, session);

		String[] keys = makeModel.keySet().toArray(new String[0]);
		for (int i = 0; i < keys.length; i++) {
			model.addAttribute(keys[i], makeModel.get(keys[i]));
		}
		///////////////////////////////////////////////////////

//		// 쇼핑몰 footer 뿌려줌
//		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
//		model.addAttribute("mallVo", mallVo);
//		// 카테고리 메뉴 뿌려줌
//		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);
//		model.addAttribute("categoryList1st", categoryList);
//		model.addAttribute("categoryList2nd", categoryList);
//		// 헤더의 로고이미지 뿌려줌
//		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);
//		model.addAttribute("mallimgVoLogo", mallimgVoLogo);
//		// 헤더의 게시판 리스트 뿌려줌
//		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
//		model.addAttribute("boardList", boardList);


//		// 로그인 세션 체크
//		if (memberService.isUserCheck(session) == false) {
//			// 로그인 안한 회원일 경우 실행되는 코드
//
//			return "SPF/board/boardreplyform";
//		}
//
//		// 로그인 세션을 memberVo에 넣음
//		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
//		System.out.println("현재 로그인한 사용자: " + memberVo);
//
//		model.addAttribute("memberVo", memberVo);
//
//		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
//		JoinMallVo joinmallVo = new JoinMallVo();
//		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
//		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));
//
//		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
//		if (memberService.SPFWhatUser(joinmallVo) == false) {
//			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
//			joinmallVo.setMember_no(null);
//
//			session.setAttribute("SPFauthUserSession", joinmallVo);
//			JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//			model.addAttribute("SPFauthUser", SPFauthUser);
//
//			return "SPF/board/boardreplyform";
//		}
//		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
//		session.setAttribute("SPFauthUserSession", joinmallVo);
//		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
//		model.addAttribute("SPFauthUser", SPFauthUser);

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

	@RequestMapping("{domain}/board/modifyform")
	public String modifyform(HttpSession session, Model model, @PathVariable String domain,
			@RequestParam(value = "board_no") int board_no, @ModelAttribute BoardVo boardVo, String pw) {

		///////////////////////////////////////////////////////
		// 해당 쇼핑몰에 필요한 모델 객체들을 한번에 불러온다
		Map<String, Object> makeModel = makeModel(domain, session);

		String[] keys = makeModel.keySet().toArray(new String[0]);
		for (int i = 0; i < keys.length; i++) {
			model.addAttribute(keys[i], makeModel.get(keys[i]));
		}
		///////////////////////////////////////////////////////

		// 게시글 수정 화면
		System.out.println("게시글번호, 비번 : " + board_no + "  " + pw);
		
		// 선택한 게시글내용 가져오기
		BoardVo GetBoardContent = boardService.GetBoardContent(board_no);
		model.addAttribute("GetBoardContent", GetBoardContent);

		return "SPF/board/modifyform";
	}

	@RequestMapping("{domain}/board/modify")
	public String modify(Model model, @PathVariable String domain, @RequestParam(value = "board_no") int board_no,
			@RequestParam(value = "boardlist_no") int boardlist_no, @ModelAttribute BoardVo boardVo) {
		// 게시글 수정
		boardVo.setBoard_no(board_no);
		boardService.BoardModify(boardVo);

		return "redirect:/" + domain + "/view?board_no=" + board_no + "&boardlist_no=" + boardlist_no;
	}
	
	@RequestMapping("{domain}/board/delete")
	public String delete(Model model, @PathVariable String domain, @RequestParam(value = "board_no") int board_no) {

		// 선택한 게시글 내용 가져오기
		BoardVo boardVo = boardService.GetBoardContent(board_no);
		System.out.println("삭제할 게시글: " + boardVo);
		
		// 게시글 삭제하기 (state = 0으로 변경)
		 boardService.delete(boardVo);
		 
		return "redirect:/" + domain +  "/boardlist?boardlist_no="  + boardVo.getBoardlist_no();
	}

	private Map<String, Object> makeModel(String domain, HttpSession session) {
		// 쇼핑몰에서 필요한 모델 객체 한번에 불러오기

		// 접속한 도메인으로부터 해당 쇼핑몰의 정보를 가져온다
		MallVo mallVo = SPF_mallService.domainCheck(domain);

		// 쇼핑몰 footer 뿌려줌
		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());

		// 카테고리 메뉴 뿌려줌
		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);

		// 헤더의 로고이미지 뿌려줌
		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);

		// 헤더의 게시판 리스트 뿌려줌
		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);

		Map<String, Object> makeModel = new HashMap<String, Object>();

		// map에 객체 담기
		makeModel.put("mall_domain", domain);
		makeModel.put("mallVo", mallVo);
		makeModel.put("categoryList1st", categoryList);
		makeModel.put("categoryList2nd", categoryList);
		makeModel.put("mallimgVoLogo", mallimgVoLogo);
		makeModel.put("boardList", boardList);


		// 비회원인지 확인
		if (memberService.isUserCheck(session) == false) {
			// 비 회원일경우 아무작업 하지않음
		} else { 
			MemberVo memberVo = (MemberVo) session.getAttribute("authUser");

			// 통합회원이 SPF회원인지 확인을 위한 사전작업
			JoinMallVo joinmallVo = new JoinMallVo();
			joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
			joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

			// 통합회원이 SPF회원인지 확인
			if (memberService.SPFWhatUser(joinmallVo) == false) {
				// SPF회원이 아닐경우 회원 구분을 0으로 세팅
				memberVo.setMember_distinction(0);
			}
			
			makeModel.put("memberVo", memberVo);
//			makeModel.put("SPFauthUser", joinmallVo);

		}
		return makeModel;
	}

}
