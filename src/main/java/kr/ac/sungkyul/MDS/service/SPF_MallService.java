package kr.ac.sungkyul.MDS.service;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Service
public class SPF_MallService {

	@Autowired
	private MallDao mallDao;

	public MallVo getSelectMall(String domain) {
		MallVo mallVo = mallDao.get_select_Mall(domain);
		return mallVo;
	}

	public boolean modifyMall(MallVo mallVo) {
		return mallDao.updateMall(mallVo);
	}

	/**
	 * SPF 접속 시 등록된 도메인인지 체크, mallVo 전달
	 * 만든이 : 이민우
	 * @param domain
	 * @return
	 */
	public MallVo domainCheck(String mall_domain) {
		MallVo mallVo = mallDao.domainCheck(mall_domain);
		return mallVo;
	}

	/**
	 * SPF 접속 시 등록된 도메인인지 체크, boolean값 전달
	 * 만든이 : 이민우
	 * @param domain
	 * @return
	 */
	public boolean isDomainCheck(int mall_no) {

		MallVo mallVo = mallDao.domainCheck(mall_no);
		if (mallVo.getMall_no() == mall_no) {
			return true;
		}

		return false;
	}

}
