package kr.ac.sungkyul.MDS.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;


@Service
public class TSF_BoardService {

	@Autowired
	private MemberDao memberDao;


	@Autowired
	private MallDao mallDao;




	
}
