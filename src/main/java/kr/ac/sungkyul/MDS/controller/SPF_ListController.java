package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPF_ListSrvice;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.CategoryProductListVo;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Controller
public class SPF_ListController {

	@Autowired
	MemberService memberService;

	@Autowired
	TSF_MainService TSF_MainService;

	@Autowired
	SPF_MainService SPF_mainService;

	@Autowired
	SPF_MallService SPF_mallService;

	@Autowired
	SPF_ListSrvice SPF_listService;

	@Autowired
	SPF_MallimgService SPF_mallimgService;

	/**
	 * 카테고리별 상품 리스트 화면 
	 * 만든이 : 이민우
	 * @param mall_domain
	 * @param model
	 * @param productListVo
	 * @return
	 */
	@RequestMapping(value = "{mall_domain}/list", method = RequestMethod.GET)
	public String list(@PathVariable String mall_domain, Model model, CategoryListVo categoryListVo) {
		int categorylist_no = categoryListVo.getCategorylist_no();
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);

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
		// 카테고리 넘버를 jsp에 넘겨줌
		model.addAttribute("categoryListVo", categoryListVo);

		List<CategoryProductListVo> categoryProductListVo = SPF_listService.getProductList(categorylist_no);
		model.addAttribute("categoryProductListVo", categoryProductListVo);
		return "SPF/product/list";
	}

	/**
	 * 카테고리별 상품 중 낮은 가격 정렬 리스트 화면
	 * 만든이 : 이민우 
	 * @param model
	 * @param categoryListVo
	 * @param mall_domain
	 * @return
	 */
	@RequestMapping(value = "{mall_domain}/lowprice", method = RequestMethod.GET)
	public String listLowPrice(Model model, CategoryListVo categoryListVo, @PathVariable String mall_domain) {
		int categorylist_no = categoryListVo.getCategorylist_no();
		List<CategoryProductListVo> categoryProductListVo = SPF_listService.getProductListLowPrice(categorylist_no);
		model.addAttribute("categoryProductListVo", categoryProductListVo);
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);

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
		// 카테고리 넘버를 jsp에 넘겨줌
		model.addAttribute("categoryListVo", categoryListVo);
		// return "redirect:/" + mall_domain + "/list?categorylist_no=" +
		// categorylist_no;
		return "SPF/product/list";
	}

	/**
	 * 카테고리별 상품 중 높은 가격 정렬 리스트 화면
	 * 만든이 : 이민우
	 * @param model
	 * @param categoryListVo
	 * @param mall_domain
	 * @return
	 */
	@RequestMapping(value = "{mall_domain}/highprice", method = RequestMethod.GET)
	public String listHighPrice(Model model, CategoryListVo categoryListVo, @PathVariable String mall_domain) {
		int categorylist_no = categoryListVo.getCategorylist_no();
		List<CategoryProductListVo> categoryProductListVo = SPF_listService.getProductListHighPrice(categorylist_no);
		model.addAttribute("categoryProductListVo", categoryProductListVo);
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(mall_domain);

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
		// 카테고리 넘버를 jsp에 넘겨줌
		model.addAttribute("categoryListVo", categoryListVo);
		// return "redirect:/" + mall_domain + "/list?categorylist_no=" +
		// categorylist_no;
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
