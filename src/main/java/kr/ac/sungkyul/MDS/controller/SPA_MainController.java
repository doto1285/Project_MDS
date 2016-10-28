package kr.ac.sungkyul.MDS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPA_CategoryListService;
import kr.ac.sungkyul.MDS.service.SPA_MainService;
import kr.ac.sungkyul.MDS.service.SPA_ProductService;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;

@Controller
@RequestMapping("/SPA")
public class SPA_MainController {

	@Autowired
	MemberService memberService;

	@Autowired
	SPA_MainService SPA_mainservice;

	@Autowired
	SPA_CategoryListService SPA_categoryListService;

	@Autowired
	SPA_ProductService SPA_productService;

	/**
	 * 메인화면 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/main", method = RequestMethod.GET)
	public String index(@PathVariable String domain, HttpSession session) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom/loginfrom";
		}
		return "SPA/main/index";
	}

	/**
	 * 로그아웃
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/logout", method = RequestMethod.GET)
	public String logout(@PathVariable String domain, HttpSession session) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		session.removeAttribute("authUser");
		session.invalidate();
		return "redirect:/main";
	}

	/**
	 * 쇼핑몰정보관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/mall", method = RequestMethod.GET)
	public String mall(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		MallVo mallVo = SPA_mainservice.getSelectMall(domain);
		model.addAttribute("mallVo", mallVo);
		return "SPA/mall/mall";
	}

	/**
	 * 쇼핑몰 로고이미지 관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/malllogo", method = RequestMethod.GET)
	public String mallLogoImg(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		String url = SPA_mainservice.getMallImg(domain, 0);
		model.addAttribute("url", url);
		return "SPA/mall/malllogoimg";
	}

	/**
	 * 쇼핑몰 로고 이미지 수정
	 * 
	 * @param domain
	 * @param session
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "{domain}/malllogomodify", method = RequestMethod.POST)
	public String mallLogoImgModify(@PathVariable String domain, HttpSession session, MultipartFile file)
			throws Exception {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		if (file.isEmpty()) {
			return "redirect:/SPA/" + domain + "/malllogo";
		}
		SPA_mainservice.deleteMallImg(domain, 0);
		SPA_mainservice.insertMallImg(domain, file, 0);
		return "redirect:/SPA/" + domain + "/malllogo";
	}

	/**
	 * 쇼핑몰 로고 이미지 기본값 복원
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/malllogodelete", method = RequestMethod.POST)
	public String mallLogoImgDelete(@PathVariable String domain, HttpSession session) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		SPA_mainservice.deleteMallImg(domain, 0);
		return "redirect:/SPA/" + domain + "/malllogo";
	}

	/**
	 * 쇼핑몰 메인이미지 관리 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/mallmain", method = RequestMethod.GET)
	public String mallMainImg(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		String url = SPA_mainservice.getMallImg(domain, 1);
		model.addAttribute("url", url);
		return "SPA/mall/mallmainimg";
	}

	/**
	 * 쇼핑몰 메인 이미지 수정
	 * 
	 * @param domain
	 * @param session
	 * @param file
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "{domain}/mallmainmodify", method = RequestMethod.POST)
	public String mallMainImgModify(@PathVariable String domain, HttpSession session, MultipartFile file)
			throws Exception {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		if (file.isEmpty()) {
			return "redirect:/SPA/" + domain + "/mallmain";
		}
		SPA_mainservice.deleteMallImg(domain, 1);
		SPA_mainservice.insertMallImg(domain, file, 1);
		return "redirect:/SPA/" + domain + "/mallmain";
	}

	/**
	 * 쇼핑몰 메인 이미지 기본값 복원
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "{domain}/mallmaindelete", method = RequestMethod.POST)
	public String mallMainImgDelete(@PathVariable String domain, HttpSession session) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		SPA_mainservice.deleteMallImg(domain, 1);
		return "redirect:/SPA/" + domain + "/mallmain";
	}

	/**
	 * 쇼핑몰 정보수정 컨트롤러
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @param mallVo
	 * @return
	 */
	@RequestMapping(value = "{domain}/mallmodify", method = RequestMethod.POST)
	public String mallModify(@PathVariable String domain, HttpSession session, MallVo mallVo) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		SPA_mainservice.modifyMall(mallVo);
		return "redirect:/SPA/" + domain + "/mall";
	}

	/**
	 * 상품 리스트 화면
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/product", method = RequestMethod.GET)
	public String productList(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		List<ProductListVo> productlist = SPA_productService.getProductInfo(domain);
		System.out.println(productlist);
		model.addAttribute("list", productlist);
		return "SPA/product/productlist";
	}

	@RequestMapping(value = "{domain}/productinsertform", method = RequestMethod.GET)
	public String productInsertform(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		List<CategoryListVo> categorylist = SPA_categoryListService.getCategoryList(domain);
		model.addAttribute("categorylist", categorylist);

		return "SPA/product/productinsertform";
	}

	@ResponseBody // ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/productinsert", method = RequestMethod.POST)
	public int productInsert(@PathVariable String domain, HttpSession session, Model model,
			@RequestBody ProductVo productVo) {
		if (SPA_productService.isProductDistinct(domain, productVo.getProduct_name())) {
			return -1;
		} else {
			int productno = SPA_productService.insertProduct(productVo);
			return productno;
		}
	}

	@RequestMapping(value = "{domain}/productinsertcontent", method = RequestMethod.POST)
	public String productInsertContent(@PathVariable String domain, HttpSession session, Model model,
			ProductOptionVo productOptionVo, MultipartFile file1, MultipartFile file2, MultipartFile file3,
			String productno) throws Exception {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}

		productOptionVo.setProduct_no(Integer.parseInt(productno));
		SPA_productService.insertProductOption(productOptionVo);
		SPA_productService.insertProductImg(Integer.parseInt(productno), file1, 0);
		SPA_productService.insertProductImg(Integer.parseInt(productno), file2, 1);
		SPA_productService.insertProductImg(Integer.parseInt(productno), file3, 2);

		return "redirect:/SPA/" + domain + "/product";
	}

	@ResponseBody // ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/productcategorySelect", method = RequestMethod.POST)
	// 상품삭제
	public List<CategoryListVo> productcategorySelect(@PathVariable String domain, HttpSession session, Model model,
			@RequestBody CategoryListVo categoryListVo) {
		int categroupNo = categoryListVo.getCategorylist_group();

		List<CategoryListVo> sizeList = SPA_categoryListService.getCategoryList2nd(domain, categroupNo);
		System.out.println(sizeList);

		return sizeList;
	}

	@RequestMapping(value = "{domain}/productmodifyform", method = RequestMethod.GET)
	public String productModifyForm(@PathVariable String domain, HttpSession session, Model model, int product_no) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		List<CategoryListVo> categorylist = SPA_categoryListService.getCategoryList(domain);
		model.addAttribute("categorylist", categorylist);
		
		ProductVo productVo = SPA_productService.getProduct(product_no);
		model.addAttribute("productVo", productVo);
		
		List<ProductOptionVo> productOptionlist = SPA_productService.getProductOptionList(product_no);
		model.addAttribute("productOptionlist", productOptionlist);
		
		String url1 = SPA_productService.getProductImg(product_no, 0);
		String url2 = SPA_productService.getProductImg(product_no, 1);
		String url3 = SPA_productService.getProductImg(product_no, 2);
		model.addAttribute("url1", url1);
		model.addAttribute("url2", url2);
		model.addAttribute("url3", url3);
		
		return "SPA/product/productmodifyform";
	}

	@ResponseBody // ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/productmodify", method = RequestMethod.POST)
	public void productModify(@PathVariable String domain, HttpSession session, Model model,
			@RequestBody ProductVo productVo) {
		System.out.println(productVo);
		SPA_productService.modifyProduct(productVo);

	}

	@RequestMapping(value = "{domain}/productmodifycontent", method = RequestMethod.POST)
	public String productModifyContent(@PathVariable String domain, HttpSession session, Model model,
			ProductOptionVo productOptionVo, MultipartFile file1, MultipartFile file2, MultipartFile file3,
			String productno) throws Exception {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		
		System.out.println(productno);
		
		if (!file1.isEmpty()) {
			SPA_productService.deleteProductImg(Integer.parseInt(productno), 0);
			SPA_productService.insertProductImg(Integer.parseInt(productno), file1, 0);
		}
		if (!file2.isEmpty()) {
			SPA_productService.deleteProductImg(Integer.parseInt(productno), 1);
			SPA_productService.insertProductImg(Integer.parseInt(productno), file2, 1);
		}
		if (!file3.isEmpty()) {
			SPA_productService.deleteProductImg(Integer.parseInt(productno), 2);
			SPA_productService.insertProductImg(Integer.parseInt(productno), file3, 2);
		}
		return "redirect:/SPA/" + domain + "/product";
	}

	@ResponseBody // ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/productdelete", method = RequestMethod.POST)
	// 상품삭제
	public String productdelete(@PathVariable String domain, HttpSession session, Model model, int productNo) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "javascript:window.location.reload(false)";
		}
		System.out.println("삭제할 상품 " + productNo);

		SPA_productService.deleteProduct(productNo);

		return "javascript:window.location.reload(true)";
	}
	
	@ResponseBody
	@RequestMapping(value = "{domain}/productoptionmodify", method = RequestMethod.POST)
	public String productOptionModify(@PathVariable String domain, HttpSession session, String cateco, int cateno, String catesi, int catest, int cateno2) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}

		ProductOptionVo vo = new ProductOptionVo();
		vo.setProductoption_no(cateno);
		vo.setProduct_no(cateno2);
		vo.setProductoption_color(cateco);
		vo.setProductoption_size(catesi);
		vo.setProductoption_stock(catest);


		System.out.println("수정할 객체" + vo);

		SPA_productService.modifyProductOption(vo);

		return "javascript:window.location.reload(true)";
	}
	
	@ResponseBody
	@RequestMapping(value = "{domain}/productoptioninsert", method = RequestMethod.POST)
	public String productOptionInsert(@PathVariable String domain, HttpSession session, String cateco, String catesi, int catest, int cateno2) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}

		ProductOptionVo vo = new ProductOptionVo();
		vo.setProduct_no(cateno2);
		vo.setProductoption_color(cateco);
		vo.setProductoption_size(catesi);
		vo.setProductoption_stock(catest);


		System.out.println("추가할 객체" + vo);

		SPA_productService.insertProductOption(vo);

		return "javascript:window.location.reload(true)";
	}

	/**
	 * 주문목록 화면
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/order", method = RequestMethod.GET)
	public String orderList(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		Map<String, Object> map = SPA_mainservice.getOrderInfo(domain);
		model.addAttribute("map", map);
		return "SPA/order/orderlist";
	}

	/**
	 * 배송관리
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody // ajax일때 return을 form의 위치를 찾는게 아니라 값을 넘겨준다
	@RequestMapping(value = "{domain}/orderinfoModify", method = RequestMethod.POST)
	public String orderinfoModify(@PathVariable String domain, HttpSession session, Model model, int orderinfoNo,
			int orderinfoState) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "javascript:window.location.reload(false)";
		}

		SPA_mainservice.updateOrderState(orderinfoNo, orderinfoState);

		return "javascript:window.location.reload(true)";
	}

	/**
	 * 고객목록 화면
	 * 
	 * @param domain
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "{domain}/member", method = RequestMethod.GET)
	public String memberList(@PathVariable String domain, HttpSession session, Model model) {
		// 쇼핑몰 관리자 세션확인
		if (!SPA_mainservice.isUserCheck(domain, session)) {
			return "redirect:/main/loginfrom";
		}
		List<MemberVo> list = SPA_mainservice.getMemberInfo(domain);
		model.addAttribute("list", list);
		return "SPA/member/memberlist";
	}

}