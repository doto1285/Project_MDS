package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.sungkyul.MDS.dao.BoardDao;
import kr.ac.sungkyul.MDS.dao.BoardListDao;
import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.dao.TSA_BoardDao;
import kr.ac.sungkyul.MDS.dao.TSA_BoardListDao;
import kr.ac.sungkyul.MDS.vo.BoardListVo;
import kr.ac.sungkyul.MDS.vo.BoardVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Service
public class TSA_BoardService {

	@Autowired
	TSA_BoardDao TSA_boardDao;
	
	@Autowired
	MemberDao memberDao;
	
	public List<MemberVo>/* 리턴할 데이터 타입 없으면 void */ GetUserManageList(/* 파라미터 int a*/){ 
		
		return TSA_boardDao.GetUserManageList(); 
		// TSA_boardDao 라는 객체의 메소드를 실행  객체.메소드or필드
		
	}
	
	public List<BoardVo> GetNotice(/* 파라미터 int a*/){ 
		
		return TSA_boardDao.GetNotice(); 
		// TSA_boardDao 라는 객체의 메소드를 실행  객체.메소드or필드
		
	}
	
	
	public List<MallVo> GetShopManage(/* 파라미터 int a*/){ 
		//mall 객체 
		List<MallVo> mallVolist = TSA_boardDao.GetShopManage(); 
		List<MemberVo> memberVolist = new ArrayList<MemberVo>();
		for(int i=0; i<mallVolist.size(); i++) {
			memberVolist.add(memberDao.get(mallVolist.get(i).getMember_no()));
		}
		
		return null;
		// TSA_boardDao 라는 객체의 메소드를 실행  객체.메소드or필드
		
	}
	
	
	
}
