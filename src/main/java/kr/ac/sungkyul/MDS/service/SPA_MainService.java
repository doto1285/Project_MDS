package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Service
public class SPA_MainService {
	
	@Autowired
	MallDao mallDao;
	
	public boolean get_member_admin(String domain, MemberVo memberVo) {
		memberVo.setMember_id(domain);
		MallVo mallVo = mallDao.get_member_admin(memberVo);
		if (mallVo == null) {
			return false;
		}
		return true;
	}

}
