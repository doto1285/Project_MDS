package kr.ac.sungkyul.MDS.controller;

import java.util.List;

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
import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;

	@Autowired
	TSF_MainService TSF_MainService;

	@Autowired
	SPF_MainService SPF_mainService;

	@Autowired
	SPF_MallService SPF_mallService;

	@Autowired
	SPF_MallimgService SPF_mallimgService;
	
	@Autowired
	BoardService boardService;

	@RequestMapping("/main/joinform_choose")
	public String Joinform_choose() {
		// 회원가입시 회원 종류 선택 화면
		System.out.println("가입 종류 선택");

		return "member/Joinform_choose";
	}

	@RequestMapping("/main/Joinform_personal")
	public String joinform_Personal() {
		// 개인회원 회원가입
		System.out.println("개인 회원 가입");

		return "member/Joinform_personal";
	}

	@RequestMapping("/main/Join")
	public String Join(@ModelAttribute MemberVo memberVo) {
		// 일반, 기업 회원 가입
		System.out.println("가입할 member " + memberVo);

		memberService.join(memberVo);

		return "redirect:/main";
	}

	@RequestMapping("/main/Joinform_company")
	public String Joinform_company() {
		// 기업회원 회원가입
		System.out.println("기업 회원 가입");

		return "member/Joinform_company";
	}

	@RequestMapping("/main/loginfrom")
	public String index() {
		// 개인회원, 기업회원 로그인
		System.out.println("로그인 화면");

		return "member/loginform";
	}

	
	@RequestMapping(value = "/main/login", method = RequestMethod.POST)
	public String login(
			// 개인, 기업회원 로그인
			HttpSession session, @RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password,
			@RequestParam(value = "member_distinction", required = false, defaultValue = "") int member_distinction) {
		
		System.out.println("controller - " + id + "  " + password + member_distinction);
		MemberVo authUser = memberService.login(id, password, member_distinction);

		if (authUser == null) {
			System.out.println("로그인 실패");
			return "redirect:/main/loginfrom";
		}

		// 인증 성공
		System.out.println("로그인 성공");
		session.setAttribute("authUser", authUser);

		// 로그인한 사용자가 가입한 쇼핑몰 가져오기
		List<MallVo> auth_MallList = TSF_MainService.GetJoinMall(authUser.getMember_no(), authUser.getMember_id(),
				authUser.getMember_state());

		session.setAttribute("auth_MallList", auth_MallList);

		return "redirect:/main";
	}

	@RequestMapping(value = "/main/logout", method = RequestMethod.GET)
	// 로그아웃
	public String logout(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/main";
	}

	/**
	 * SPF 회원가입 화면 만든이 : 이민우
	 * 
	 * @param mall_domain
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("{mall_domain}/join")
	public String join(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			// 로그인 안한 회원일 경우 실행되는 코드
			return "redirect:/main/joinform_choose";
		}

		// 로그인 세션이 있는 경우 실행되는 코드
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

		return "SPF/member/join";
	}

	/**
	 * SPF 회원가입 완료 만든이 : 이민우
	 * 
	 * @param mall_domain
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("{mall_domain}/joinComplete")
	public String joinComplete(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			// 로그인 안한 회원일 경우 실행되는 코드
			return "redirect:/main/joinform_choose";
		}

		// 로그인 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		model.addAttribute("memberVo", memberVo);

		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
		JoinMallVo joinmallVo = new JoinMallVo();
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

		memberService.SPFJoin(joinmallVo);

		return "redirect:/" + mall_domain + "/main";
	}

	/**
	 * SPF 로그인 화면 만든이 : 이민우
	 * 
	 * @param mall_domain
	 * @param model
	 * @return
	 */
	@RequestMapping("{mall_domain}/login")
	public String login(@PathVariable String mall_domain, Model model) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}
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

		return "SPF/member/login";
	}

	/**
	 * SPF 로그인 완료 만든이 : 이민우
	 * 
	 * @param mall_domain
	 * @param session
	 * @param model
	 * @param id
	 * @param password
	 * @return
	 */
	@RequestMapping(value = "{mall_domain}/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@PathVariable String mall_domain, HttpSession session, Model model,
			@RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password) {

		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		// 입력한 id, password를 받아와서 DB에서 체크
		MemberVo authUser = memberService.loginCheck(id, password);
		// 인증 성공
		session.setAttribute("authUser", authUser);

		// authUser가 없으면 회원가입 안한 회원이므로 통합사이트 회원가입으로 보냄
		if (authUser == null) {
			return "redirect:/main/joinform_choose";
		}

		// 로그인 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		System.out.println(memberVo);
		model.addAttribute("memberVo", memberVo);

		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
		JoinMallVo joinmallVo = new JoinMallVo();
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

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

		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
		if (memberService.SPFWhatUser(joinmallVo) == false) {
			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			return "SPF/member/join";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUser", joinmallVo);

		return "redirect:/" + mall_domain + "/main";
	}

	/**
	 * SPF 로그아웃 만든이 : 이민우
	 * 
	 * @param session
	 * @param mall_domain
	 * @return
	 */
	@RequestMapping("{mall_domain}/logout")
	public String logout(HttpSession session, @PathVariable String mall_domain) {
		session.removeAttribute("SPFauthUser");
		session.invalidate();

		return "redirect:/" + mall_domain + "/main";
	}

	@RequestMapping(value = "/TSA/main/logout", method = RequestMethod.GET)
	// 로그아웃
	public String TSAlogout(HttpSession session) {
		System.out.println("로그아웃");
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/TSA/admin/main";
	}

	
	
	
}
