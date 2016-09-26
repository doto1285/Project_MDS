package kr.ac.sungkyul.MDS.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.sungkyul.MDS.service.MemberService;
import kr.ac.sungkyul.MDS.service.SPA_CategoryListService;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Controller
@RequestMapping("/SPA")
public class SPA_MainController {
   
   @Autowired
   MemberService memberService;
   
   @Autowired
   SPA_CategoryListService categoryListService;
   
   
   @RequestMapping(value = "{domain}/main", method = RequestMethod.GET)
   public String index(@PathVariable String domain, HttpSession session) {
      //세션 값이랑 userid랑 일치하는지 확인
//      if(!isUserCheck(userid, session)) {
//         return "redirect:/main";   
//      }
      
      return "SPA/main/index";
   }
   
   @RequestMapping(value = "{domain}/category", method = RequestMethod.GET)
   public String categorylist(@PathVariable String domain, HttpSession session, Model model) {
      //세션 값이랑 userid랑 일치하는지 확인
//      if(!isUserCheck(userid, session)) {
//         return "redirect:/main";   
//      }
      
      List<CategoryListVo> categoryListVo = categoryListService.getCategoryList(domain);
      model.addAttribute("categoryListVo", categoryListVo);
      return "SPA/category/categorylist";
   }
   
   public boolean isUserCheck(String domain, HttpSession session) {
      MemberVo memberVo = (MemberVo) session.getAttribute("member");
      if( memberVo == null || memberVo.getMember_id() != domain) {
         return false;   
      }
      return true;      
   }
}