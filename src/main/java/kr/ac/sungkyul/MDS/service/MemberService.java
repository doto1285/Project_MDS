package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.vo.MemberVo;


@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;

	public void join(MemberVo vo) {
		memberDao.insert(vo);
	}

	public MemberVo login(String id, String password) {
		System.out.println("service - " + id + " " + password);
		MemberVo authUser = memberDao.get(id, password);
		return authUser;
	}

	
	
}
