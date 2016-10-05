package kr.ac.sungkyul.MDS.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Service
public class SPA_MainService {
	
	@Autowired
	MallDao mallDao;
	
	/**
	 * 유저가 세션에 있고, 유효한 유저인지 확인
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	public boolean isUserCheck(String domain, HttpSession session) {

		// 사용법
		// if(!isUserCheck(domain, session)) {
		// return "redirect:/main";
		// }

		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		if (memberVo == null || mallDao.get_member_admin(memberVo) == null) {
			return false;
		}
		return true;
	}
}
