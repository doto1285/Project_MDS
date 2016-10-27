package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Controller
public class TSF_MainController {

	@Autowired
	TSF_MainService TSF_MainService;
	
	@Autowired
	BoardService BoardService;

	@RequestMapping("/{userid}")
	public String index( @PathVariable String userid, HttpSession session, Model model) {

		System.out.println("userid : " + userid);

		// 랜덤 쇼핑몰 목록 가져오기
		List<MallVo> Random_MallList = TSF_MainService.GetRandomMallList();
		
		//게시판 목록 가져오기
		List<BoardListVo> GetBoardList = BoardService.GetBoardList(userid);
		
		
		model.addAttribute("Random_MallList", Random_MallList);
		session.setAttribute("GetBoardList", GetBoardList);

		String url = "TSF/" + userid + "/index";
		return url;
	}
	
	@RequestMapping("main/join_mallform")
	public String join_mallform() {
		// 쇼핑몰 만들기 화면으로 연결
		
		return "TSF/main/join_mall";
	}

	@RequestMapping("main/insert_mall")
	public String insert_mall(@ModelAttribute MallVo mallVo) {
		// 쇼핑몰 생성하기
		TSF_MainService.insert_mall(mallVo);
		
		return "redirect:/main";
	}
	
	@RequestMapping("main/search_mall")
	public String search_mall(@ModelAttribute MallVo mallVo, Model model,
			String keyword
			) {
		// 검색어로쇼핑몰 검색하기

		// 랜덤 쇼핑몰 목록 가져오기
		List<MallVo> Random_MallList = TSF_MainService.GetRandomMallList();
		model.addAttribute("Random_MallList", Random_MallList);

		//검색어로 검색한 쇼핑몰 목록 가져오기
		System.out.println("검색어: " + keyword);
		List<MallVo> Search_mall = TSF_MainService.search_mall(keyword.trim());
		
		model.addAttribute("Search_mall", Search_mall);
		
		return "TSF/main/search_mall";
	}
	
	@RequestMapping("main/choose_mall")
	public String choose_mall(@ModelAttribute MallVo mallVo, Model model,
			@RequestParam(value = "mall_type", required = false, defaultValue = "0") String mall_type
			) {
		// 검색어로쇼핑몰 검색하기
		System.out.println("선택된 탭: "+ mall_type);
		
		// 랜덤 쇼핑몰 목록 가져오기
		List<MallVo> Random_MallList = TSF_MainService.GetRandomMallList();
		model.addAttribute("Random_MallList", Random_MallList);
		
		
		//탭에서 선택한 쇼핑몰 목록 가져오기
		List<MallVo> Search_mall = TSF_MainService.choose_mall(mall_type);
		
		model.addAttribute("Search_mall", Search_mall);
		
		return "TSF/main/search_mall";
	}
	
	@RequestMapping("main/orderdelivery")
	public String orderDelivery(@ModelAttribute MallVo mallVo, Model model) {
		
		return "TSF/main/orderDelivery";
	}

}