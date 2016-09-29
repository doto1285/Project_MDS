package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Service
public class SPA_MallService {
	
	@Autowired
	private MallDao mallDao;

	public MallVo getSelectMall(String domain){
		MallVo mallVo = mallDao.get_select_Mall(domain);
		return mallVo;
	}
	
	public boolean modifyMall(MallVo mallVo) {
		return mallDao.updateMall(mallVo);
	}

}
