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

}