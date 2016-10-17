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
	 * 카테고리별 상품 리스트 화면 만든이 : 이민우
	 * 
	 * @param mall_domain
	 * @param model
	 * @param productListVo
	 * @return
	 */
	@RequestMapping(value = "{mall_domain}/list", method = RequestMethod.GET)
	public String list(@PathVariable String mall_domain, Model model, CategoryListVo categoryListVo,
			CategoryProductListVo categoryProductListVoPaging) {
		//GET 방식으로 링크 이동 시 데이터 넘길 때 필요한 변수들
		int categorylist_no = categoryListVo.getCategorylist_no();
		model.addAttribute("category_No", categorylist_no);
		int categorylist_groupNo = categoryListVo.getCategorylist_group();
		model.addAttribute("category_groupNo", categorylist_groupNo);
		List<CategoryListVo> categoryGroupList = SPF_listService.getCategoryGroupList(categorylist_groupNo);
		model.addAttribute("categoryGroupList", categoryGroupList);
		if (categoryListVo.getSorting() == null) {
			categoryListVo.setSorting("");  
		}
		String sorting = categoryListVo.getSorting();
		model.addAttribute("sorting", sorting);

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
		// 카테고리 넘버를 jsp에 넘겨줌
		model.addAttribute("categoryListVo", categoryListVo);

		// 페이징
		List<CategoryProductListVo> categoryProductListVo = SPF_listService.getProductList(categorylist_no);
		if (categoryProductListVoPaging.getPageNo() == null) {
			categoryProductListVoPaging.setPageNo(1);
		}
		int currentPage = categoryProductListVoPaging.getPageNo();
		int pageLength = 4;
		int beginPage;

		if(sorting.equals("lowprice")){
			List<CategoryProductListVo> listsplit = SPF_listService.getProductListLowPrice(categoryProductListVoPaging);
			model.addAttribute("categoryProductListVo", listsplit);
		}
		
		else if(sorting.equals("highprice")){
			List<CategoryProductListVo> listsplit = SPF_listService.getProductListHighPrice(categoryProductListVoPaging);
			model.addAttribute("categoryProductListVo", listsplit);
		}
		
		else {
			List<CategoryProductListVo> listsplit = SPF_listService.getProductListPaging(categoryProductListVoPaging);
			model.addAttribute("categoryProductListVo", listsplit);
		}
		
		
		int currentBlock = (int) Math.ceil((double) categoryProductListVoPaging.getPageNo() / 5);

		beginPage = (currentBlock - 1) * 5 + 1;

		int total = (int) Math.ceil((double) categoryProductListVo.size() / pageLength);
		int endPage = currentBlock * 5;
		if (endPage > total) {
			endPage = total;
		}

		model.addAttribute("beginPage", beginPage);
		model.addAttribute("currentPage", currentPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("total", total);

		return "SPF/product/list";
	}


}
