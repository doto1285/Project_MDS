package kr.ac.sungkyul.MDS.service;

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

	
	
}
