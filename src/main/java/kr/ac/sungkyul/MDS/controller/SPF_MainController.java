package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class SPF_MainController {

	@Autowired
	SPF_MainService mainService;

	@Autowired
	MemberService memberService;

	@Autowired
	SPF_MallService mallService;

	/**
	 * 쇼핑몰 프론트 메인화면
	 * 
	 * @param domain
	 * @param model
	 * @return
	 */
	@RequestMapping("{mall_domain}/main")
	public String index(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			System.out.println("로그인 세션 확인");
			// 로그인 안한 회원일 경우 실행되는 코드
			// 쇼핑몰 footer 뿌려줌
			mallVo = mainService.get_Footer(mallVo.getMall_no());
			model.addAttribute("mallVo", mallVo);
			// 헤더, 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌
			return "SPF/main/index";
		}

		// 로그인 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		model.addAttribute("memberVo", memberVo);
		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
		JoinMallVo joinmallVo = new JoinMallVo();
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
		if (memberService.SPFWhatUser(joinmallVo) == false) {
			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			// 쇼핑몰 footer 뿌려줌
			mallVo = mainService.get_Footer(mallVo.getMall_no());
			model.addAttribute("mallVo", mallVo);
			// 헤더, 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌
			return "SPF/main/index";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUser", joinmallVo);
		// 쇼핑몰 footer 뿌려줌
		mallVo = mainService.get_Footer(mallVo.getMall_no());
		model.addAttribute("mallVo", mallVo);
		// 헤더, 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌

		return "SPF/main/index";
	}

	@RequestMapping("{mall_domain}/join")
	public String join(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
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
		mallVo = mainService.get_Footer(mallVo.getMall_no());
		model.addAttribute("mallVo", mallVo);
		// 헤더, 카테고리리스트

		return "SPF/member/join";
	}

	@RequestMapping("{mall_domain}/joinComplete")
	public String joinComplete(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
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

		return "SPF/main/index";
	}

	@RequestMapping("{mall_domain}/login")
	public String login(@PathVariable String mall_domain, Model model) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		return "SPF/member/login";
	}

	@RequestMapping(value = "{mall_domain}/loginCheck", method = RequestMethod.POST)
	public String loginCheck(@PathVariable String mall_domain, HttpSession session, Model model,
			@RequestParam(value = "id", required = false, defaultValue = "") String id,
			@RequestParam(value = "password", required = false, defaultValue = "") String password) {

		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
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

		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
		if (memberService.SPFWhatUser(joinmallVo) == false) {
			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			// 쇼핑몰 footer 뿌려줌
			mallVo = mainService.get_Footer(mallVo.getMall_no());
			model.addAttribute("mallVo", mallVo);
			// 헤더, 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌
			return "SPF/member/join";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUser", joinmallVo);
		// 쇼핑몰 footer 뿌려줌
		mallVo = mainService.get_Footer(mallVo.getMall_no());
		model.addAttribute("mallVo", mallVo);
		// 헤더, 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌

		return "SPF/main/index";
	}

	@RequestMapping("{mall_domain}/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("SPFauthUser");
		session.invalidate();

		return "SPF/main/index";
	}

	@RequestMapping("{mall_domain}/list")
	public String list(@PathVariable String mall_domain, Model model) {

		return "SPF/product/list";
	}

	@RequestMapping("{mall_domain}/list/detail")
	public String listDetail(@PathVariable String mall_domain, Model model) {

		return "SPF/product/listDetail";
	}

	@RequestMapping("{mall_domain}/order")
	public String order(@PathVariable String mall_domain, Model model) {

		return "SPF/order/order";
	}

	@RequestMapping("{mall_domain}/shoppingbasket")
	public String shoppingBasket(@PathVariable String mall_domain, Model model) {

		return "SPF/subMenu/shoppingBasket";
	}

	@RequestMapping("{mall_domain}/orderdelivery")
	public String orderDelivery(@PathVariable String mall_domain, Model model) {

		return "SPF/subMenu/orderDelivery";
	}

}
