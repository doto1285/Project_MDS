package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.TSF_MainService;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
public class TSF_MainController {

	@Autowired
	TSF_MainService TSF_MainService;

	@RequestMapping("/main")
	public String index(HttpSession session) {

		System.out.println("userid ");

		// 랜덤 쇼핑몰 목록 가져오기
		List<MallVo> Random_MallList = TSF_MainService.GetRandomMallList();

		session.setAttribute("Random_MallList", Random_MallList);

		return "TSF/main/index";
	}


}