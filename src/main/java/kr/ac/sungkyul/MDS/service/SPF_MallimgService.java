package kr.ac.sungkyul.MDS.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.MallImgDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;

@Service
public class SPF_MallimgService {

	@Autowired
	private MallImgDao mallimgDao;

	public MallimgVo get_selectMallimg_logo(MallVo mallVo) {

		return mallimgDao.get_selectMallimg_logo(mallVo);
	}

	public MallimgVo get_selectMallimg_gate(MallVo mallVo) {

		return mallimgDao.get_selectMallimg_gate(mallVo);
	}

}
