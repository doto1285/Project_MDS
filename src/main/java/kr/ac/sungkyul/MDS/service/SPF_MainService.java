package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Service
public class SPF_MainService {
	
	@Autowired
	MallDao mallDao;
	
	public MallVo get_Footer(int mall_no) {
		MallVo mallVo = mallDao.get_Footer(mall_no);
		return mallVo;
	}


}
