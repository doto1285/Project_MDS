package kr.ac.sungkyul.MDS.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.service.SPF_OrderDeliveryService;
import kr.ac.sungkyul.MDS.service.SPF_OrderService;
import kr.ac.sungkyul.MDS.vo.BasketListVo;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import net.sf.json.JSONArray;

@Controller
public class SPF_OrderDeliveryController {

	// @Autowired
	// SPF_OrderDeliveryService SPF_orderDeliveryService;

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

	@Autowired
	SPF_OrderDeliveryService SPF_orderDeliveryService;

	@RequestMapping("{mall_domain}/orderdelivery")
	public String orderDelivery(@PathVariable String mall_domain, Model model, HttpSession session) {

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

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			// 로그인 안한 회원일 경우 실행되는 코드
			return "404 error";
		}

		// 로그인 세션을 memberVo에 넣음
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		model.addAttribute("memberVo", memberVo);

		// 페이징
		/*basketListVo.setMember_no(memberVo.getMember_no());
		basketListVo.setMall_no(mallVo.getMall_no());
		List<BasketListVo> basketList = SPF_shoppingBasketService.selectBasket(basketListVo);
		if (basketListVo.getPageNo() == null) {
			basketListVo.setPageNo(1);
		}
		int currentPage = basketListVo.getPageNo();
		int pageLength = 4;
		int beginPage;

		List<BasketListVo> listSplit = SPF_shoppingBasketService.basketPaging(basketListVo);
		model.addAttribute("basketListSplit", listSplit);

		int currentBlock = (int) Math.ceil((double) basketListVo.getPageNo() / 5);

		beginPage = (currentBlock - 1) * 5 + 1;

		int total = (int) Math.ceil((double) basketList.size() / pageLength);
		int endPage = currentBlock * 5;
		if (endPage > total) {
			endPage = total;
		}

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);*/

		// 현재 도메인과 로그인 정보(mallVo, memberVo)를 joinmallVo에 넣음(SPF가입여부 체크용)
		JoinMallVo joinmallVo = new JoinMallVo();
		joinmallVo.setMember_no(String.valueOf(memberVo.getMember_no()));
		joinmallVo.setMall_no(String.valueOf(mallVo.getMall_no()));

		// 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
		if (memberService.SPFWhatUser(joinmallVo) == false) {
			// 로그인 세션이 있는 회원이 현재 쇼핑몰에 가입되지 않은 경우 실행되는 코드
			joinmallVo.setMember_no(null);
			return "SPF/subMenu/shoppingBasket";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUserSession", joinmallVo);
		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
		model.addAttribute("SPFauthUser", SPFauthUser);
		System.out.println(SPFauthUser);

		return "SPF/subMenu/orderDelivery";
	}

	@ResponseBody
	@RequestMapping("{mall_domain}/orderdeliveryinsert")
	public String orderDeliveryInsert(@PathVariable String mall_domain, Model model, HttpSession session,
			@RequestBody String paramData) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		SPF_orderDeliveryService.orderInfoInsert(resultMap, mallVo.getMall_no());

		return "http://localhost:8088/Project_MDS/" + mall_domain + "/orderdelivery";
	}

	@ResponseBody
	@RequestMapping("{mall_domain}/basketdeleteoforder")
	public String basketDeleteOfOrder(@PathVariable String mall_domain, Model model, HttpSession session,
			@RequestBody String paramData) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "404 error";
		}

		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(paramData);
		SPF_orderDeliveryService.deleteBasket(resultMap);

		return "http://localhost:8088/Project_MDS/" + mall_domain + "/orderdelivery";
	}

}
