package kr.ac.sungkyul.MDS.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		// 현재 접속한 SPF 쇼핑몰 도메인을 mallVo에 넣음
		MallVo mallVo = mallService.domainCheck(mall_domain);

		// 도메인 체크
		if ((mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		// TSF에서 로그인한 회원인지 판단
		if (memberService.isUserCheck(session) == false) {
			// TSF에서 로그인 안한 회원일 경우 실행되는 코드
			// 쇼핑몰 footer 뿌려줌
			mallVo = mainService.get_Footer(mallVo.getMall_no());
			model.addAttribute("mallVo", mallVo);
			// 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌
			return "SPF/main/index";
		}

		// TSF에서 로그인한 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		model.addAttribute("memberVo", memberVo);

		// TSF에서 로그인한 유저가 SPF 접속시 현재 쇼핑몰에 가입된 회원인지 체크
		if (memberService.isSPFUserCheck(memberVo, mallVo) == false) {
			// TSF에서 로그인한 유저이지만, 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			// 쇼핑몰 footer 뿌려줌
			mallVo = mainService.get_Footer(mallVo.getMall_no());
			model.addAttribute("mallVo", mallVo);
			// 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌
			return "SPF/main/index";
		}

		// SPF에 가입된 정보(joinmall 테이블)를 joinmallVo에 넣음
		JoinMallVo joinmallVo = null;
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));
		memberService.SPFWhatUser(joinmallVo);
		
		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		// 쇼핑몰 footer 뿌려줌
		mallVo = mainService.get_Footer(mallVo.getMall_no());
		model.addAttribute("mallVo", mallVo);
		// 쇼핑몰 로고이미지, 대문이미지, 카테고리리스트, 게시판리스트, 상품리스트 뿌려줌

		return "SPF/main/index";
	}

	@RequestMapping("{domain}/join")
	public String join(@PathVariable String domain, Model model) {

		return "SPF/member/join";
	}

	@RequestMapping("{domain}/login")
	public String login(@PathVariable String domain, Model model) {

		return "SPF/member/login";
	}

	@RequestMapping("{domain}/list")
	public String list(@PathVariable String domain, Model model) {

		return "SPF/product/list";
	}

	@RequestMapping("{domain}/list/detail")
	public String listDetail(@PathVariable String domain, Model model) {

		return "SPF/product/listDetail";
	}

	@RequestMapping("{domain}/order")
	public String order(@PathVariable String domain, Model model) {

		return "SPF/order/order";
	}

	@RequestMapping("{domain}/shoppingbasket")
	public String shoppingBasket(@PathVariable String domain, Model model) {

		return "SPF/subMenu/shoppingBasket";
	}

	@RequestMapping("{domain}/orderdelivery")
	public String orderDelivery(@PathVariable String domain, Model model) {

		return "SPF/subMenu/orderDelivery";
	}

}
