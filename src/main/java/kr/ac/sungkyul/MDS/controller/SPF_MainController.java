package kr.ac.sungkyul.MDS.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.service.SPF_ProductService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Controller
public class SPF_MainController {

	@Autowired
	SPF_MainService SPF_mainService;

	@Autowired
	MemberService memberService;

	@Autowired
	SPF_MallService SPF_mallService;

	@Autowired
	SPF_MallimgService SPF_mallimgService;

	@Autowired
	SPF_ProductService SPF_productService;

	@Autowired
	BoardService boardService;

	/**
	 * 쇼핑몰 프론트 메인화면 만든이 : 이민우
	 * 
	 * @param domain
	 * @param model
	 * @return
	 */
	@RequestMapping("{mall_domain}/main")
	public String index(@PathVariable String mall_domain, Model model, HttpSession session) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);
		model.addAttribute("mall_domain", mall_domain);
		// 도메인 체크
		if ((SPF_mallService.isDomainCheck(mallVo.getMall_no())) == false) {
			// 없는 도메인일 경우 실행되는 코드
			return "redirect:/main/loginfrom";
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


		
		
		// 메인의 대문이미지 뿌려줌
		MallimgVo mallimgVoGate = SPF_mallimgService.get_selectMallimg_gate(mallVo);
		model.addAttribute("mallimgVoGate", mallimgVoGate);
		// 상품리스트 뿌려줌
		List<ProductListVo> productListVo = SPF_productService.get_Product_Content(mallVo);
		model.addAttribute("productListVo", productListVo);

		// 로그인 세션 체크
		if (memberService.isUserCheck(session) == false) {
			// 로그인 안한 회원일 경우 실행되는 코드
			
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
			joinmallVo.setMember_no(null);
			
			session.setAttribute("SPFauthUserSession", joinmallVo);
			JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
			model.addAttribute("SPFauthUser", SPFauthUser);

			
			return "SPF/main/index";
		}

		// 현재 쇼핑몰에 가입된 경우 실행되는 코드
		session.setAttribute("SPFauthUserSession", joinmallVo);
		JoinMallVo SPFauthUser = (JoinMallVo) session.getAttribute("SPFauthUserSession");
		model.addAttribute("SPFauthUser", SPFauthUser);
		
		

		return "SPF/main/index";
	}
	

	private Map<String, Object> makeModel(MallVo mallVo) {
		// TODO Auto-generated method stub
		
		/*  사용하는 방법
		Map<String, Object> makeModel = makeModel(mallVo);
		System.out.println(makeModel.toString());
		model.addAttribute("makeModel", makeModel); */

		// 쇼핑몰 footer 뿌려줌
		mallVo = SPF_mainService.get_Footer(mallVo.getMall_no());
		// 카테고리 메뉴 뿌려줌
		List<CategoryListVo> categoryList = SPF_mainService.get_CategoryList(mallVo);
		// 헤더의 로고이미지 뿌려줌
		MallimgVo mallimgVoLogo = SPF_mallimgService.get_selectMallimg_logo(mallVo);
		// 헤더의 게시판 리스트 뿌려줌
		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
		
		
		Map<String, Object> makeModel = new HashMap<String, Object>();

		// 5. map에 객체 담기
		makeModel.put("mallVo", mallVo);
		makeModel.put("categoryList1st", categoryList);
		makeModel.put("categoryList2nd", categoryList);
		makeModel.put("mallimgVoLogo", mallimgVoLogo);
		makeModel.put("boardList", boardList);
		
		return makeModel;
	}

}
