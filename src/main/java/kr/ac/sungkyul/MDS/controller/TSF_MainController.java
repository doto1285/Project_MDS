package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public String index( @PathVariable String userid, HttpSession session) {

		System.out.println("userid : " + userid);

		// 랜덤 쇼핑몰 목록 가져오기
		List<MallVo> Random_MallList = TSF_MainService.GetRandomMallList();
		List<BoardListVo> GetBoardList = BoardService.GetBoardList(userid);

		session.setAttribute("Random_MallList", Random_MallList);
		session.setAttribute("GetBoardList", GetBoardList);

		String url = "TSF/" + userid + "/index";
		return url;
	}


}