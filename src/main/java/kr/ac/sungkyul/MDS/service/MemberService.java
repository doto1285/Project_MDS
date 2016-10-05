package kr.ac.sungkyul.MDS.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public void join(MemberVo vo) {
		memberDao.insert(vo);
		System.out.println("회원가입 완료");
	}

	public MemberVo login(String id, String password, int member_distinction) {
		System.out.println("service - " + id + " " + password);
		MemberVo authUser = memberDao.get(id, password, member_distinction);
		return authUser;
	}

	public MallVo GetJoinMall() {
		// TODO Auto-generated method stub
		return null;
	}

	/**
	 * SPF접속 시 TSF에서 로그인 했었는지 체크
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	public boolean isUserCheck(HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		if (memberVo == null) {
			return false;
		}
		return true;
	}

	/**
	 * TSF에서 로그인한 유저일 경우 SPF 접속시 현재 쇼핑몰에 가입된 회원인지 판단
	 * 
	 * @param memberVo
	 * @param mallVo
	 * @return
	 */
	public boolean isSPFUserCheck(MemberVo memberVo, MallVo mallVo) {
		if (memberVo == null || mallVo == null) {
			return false;
		}
		return true;
	}
	
	

}
