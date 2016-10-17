package kr.ac.sungkyul.MDS.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.ac.sungkyul.MDS.service.TSA_BoardService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/TSA")
public class TSA_BoardController {

	@Autowired
	TSA_BoardService TSA_boardService;

	
	
	
	@RequestMapping("/main/board/notice")
	public String GetNotice(Model model){
		List<BoardVo> GetNotice = TSA_boardService.GetNotice(); // 서비스(객체).메소드/필드
		model.addAttribute("GetNotice", GetNotice);
		
		return "TSA/board/notice";
	}
	
	
	
	@RequestMapping("/main/board/usermanage")
	public String GetUserManageList(Model model){
		List<MemberVo> GetUserManageList = TSA_boardService.GetUserManageList(); // 서비스(객체).메소드/필드
		model.addAttribute("GetUserManageList", GetUserManageList);
		
		return "TSA/board/usermanage";
	}
	
	
	@RequestMapping("/main/board/shopmanage")
	public String GetShopManage(Model model){
		List<MallVo> GetShopManage = TSA_boardService.GetShopManage(); // 서비스(객체).메소드/필드
		model.addAttribute("GetShopManage", GetShopManage);
		
		return "TSA/board/shopmanage";
	}
	
}