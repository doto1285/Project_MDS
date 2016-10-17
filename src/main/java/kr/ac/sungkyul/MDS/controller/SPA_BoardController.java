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
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;



@Controller
@RequestMapping("/SPA")
public class SPA_BoardController {
	
	
	@Autowired
	BoardService boardService;
	@Autowired
	SPF_MallService SPF_MallService;
	
	@RequestMapping(value = "{domain}/makeboard", method = RequestMethod.GET)
	public String makeboardform(@PathVariable String domain, HttpSession session, Model model) {

		List<BoardListVo> boardListVo= boardService.getBoardListInfo(domain);		//해당 도메인에 개설된 게시판 정보를 가져온다

		for (BoardListVo vo : boardListVo) {
			System.out.println("개설된 게시판 리스트 " + vo);
		}
		System.out.println("============================================");
		
		model.addAttribute("BoardListvo", boardListVo);		
		
		return "SPA/member/makeboard";
	}
	
	@RequestMapping(value = "{domain}/insertBoardList", method = RequestMethod.GET)
	public String insertBoardList(@PathVariable String domain, HttpSession session, Model model,
			@RequestParam(value = "count_order") int count_order,
			@RequestParam(value = "newBoardList") String newBoardList,
			@RequestParam(value = "write_accessright") int write_accessright,
			@RequestParam(value = "read_accessright") int read_accessright
			) {
		
		System.out.println("삽입: "+ newBoardList +"번호"+ count_order + " 쓰기" +  write_accessright  + " 읽기" +read_accessright);
		

		int mall_no =  (SPF_MallService.domainCheck(domain)).getMall_no();
		
		System.out.println("가져온 mall_no " + mall_no);
		BoardListVo vo = new BoardListVo();
		
		vo.setBoardlist_name(newBoardList);
		vo.setMall_no(mall_no);
		vo.setBoardlist_write_accessright(write_accessright);
		vo.setBoardlist_read_accessright(read_accessright);
		vo.setBoard_orderno(count_order);
		
		
		System.out.println("삽입된 게시판 " + vo);
		boardService.insertBoardList(vo);
		
		return "redirect:/SPA/"+domain+"/makeboard";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "{domain}/boardlistmodify", method = RequestMethod.POST)
	public String boardListModify(@PathVariable String domain, HttpSession session, Model model
			,int boardlistno,String boardlistname,int writeaccessright, int readaccessright
			) {
		//게시판 정보 수정
		
		BoardListVo vo = new BoardListVo();
		
		vo.setBoardlist_no(boardlistno);
		vo.setBoardlist_name(boardlistname);
		vo.setBoardlist_write_accessright(writeaccessright);
		vo.setBoardlist_read_accessright(readaccessright);
		
		System.out.println("수정된 게시판 " + vo);
		boardService.boardListModify(vo);
		
		return "http://localhost:8088/Project_MDS/SPA/"+domain+"/makeboard";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "{domain}/boardlistUp", method = RequestMethod.POST)
	public String boardlistUp(@PathVariable String domain, HttpSession session, Model model,int boardlistno
			) {
		//게시판 순서 위로 가기
		 boardService.boardListUp(boardlistno);
		
		return "http://localhost:8088/Project_MDS/SPA/"+domain+"/makeboard";
	}
	
	@ResponseBody
	@RequestMapping(value = "{domain}/boardlistDown", method = RequestMethod.POST)
	public String boardlistDown(@PathVariable String domain, HttpSession session, Model model,int boardlistno
			) {
		//게시판 순서 아래로 가기
		boardService.boardListDown(boardlistno);
		
		return "http://localhost:8088/Project_MDS/SPA/"+domain+"/makeboard";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "{domain}/boardlistdelete", method = RequestMethod.POST)
	public String boardlistdelete(@PathVariable String domain, HttpSession session, Model model,int boardlistno
			) {
		//게시판 삭제
		boardService.boardlistdelete(boardlistno);
		
		return "http://localhost:8088/Project_MDS/SPA/"+domain+"/makeboard";
	}
	
	
	
	

}
