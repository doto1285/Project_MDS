package kr.ac.sungkyul.MDS.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
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
	 * 로그인 세션 체크
	 * 만든이 : 이민우
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
	 * 로그인 세션이 있는 회원이 현재 쇼핑몰 회원인지 체크
	 * 만든이 : 이민우
	 * @param joinmallVo
	 * @return
	 */
	public boolean SPFWhatUser(JoinMallVo joinmallVo) {
		JoinMallVo joinmallVo2 = memberDao.get(joinmallVo);
		if (joinmallVo2 == null) {
			return false;
		}
		return true;
	}

	/**
	 * 개인 쇼핑몰 회원가입
	 * 만든이 : 이민우
	 * @param joinmallVo
	 */
	public void SPFJoin(JoinMallVo joinmallVo) {
		memberDao.SPFJoin(joinmallVo);
	}

	/**
	 * 개인 쇼핑몰 로그인
	 * 만든이 : 이민우
	 * @param id
	 * @param paasword
	 * @return
	 */
	public MemberVo loginCheck(String id, String password) {
		MemberVo memberVo = memberDao.SPFLoginCheck(id, password);
		return memberVo;
	}

}
