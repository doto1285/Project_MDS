package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.ac.sungkyul.MDS.service.BoardService;
import kr.ac.sungkyul.MDS.service.SPF_MainService;
import kr.ac.sungkyul.MDS.service.SPF_MallService;
import kr.ac.sungkyul.MDS.service.SPF_MallimgService;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;

@Controller
public class SPF_BoardController {

	@Autowired
	SPF_MallService SPF_mallService;
	@Autowired
	SPF_MainService SPF_mainService;
	@Autowired
	SPF_MallimgService SPF_mallimgService;
	@Autowired
	BoardService boardService;

	@RequestMapping("/{domain}/boardlist/{boardlist_no}")
	public String boardlist(@PathVariable String domain, @PathVariable int boardlist_no, Model model) {
		// 현재 접속한 SPF 쇼핑몰 도메인을 매개로 mall_domain, mall_no을 mallVo에 넣음
		MallVo mallVo = SPF_mallService.domainCheck(domain);

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
		// 헤더의 게시판 리스트 뿌려줌
		List<BoardListVo> boardList = boardService.SPF_GetBoardList(mallVo);
		model.addAttribute("boardList", boardList);
		return "SPF/board/list";
	}

	@RequestMapping("/{domain}/view/{boardlist_no}")
	public String view(@PathVariable String domain, @PathVariable int boardlist_no) {

		return "SPF/board/boardreplyform";
	}

	@RequestMapping("/{domain}/write/{boardlist_no}")
	public String write(@PathVariable String domain, @PathVariable int boardlist_no) {

		return "SPF/board/boardview";
	}

	@RequestMapping("/{domain}/reply/{boardlist_no}")
	public String reply(@PathVariable String domain, @PathVariable int boardlist_no) {

		return "SPF/board/boardwriteform";
	}

}
