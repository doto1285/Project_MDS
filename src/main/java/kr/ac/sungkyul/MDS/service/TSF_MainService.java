package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.MallVo;


@Service
public class TSF_MainService {

	@Autowired
	private MallDao mallDao;



	public List<MallVo> GetJoinMall(int member_no, String member_id, int member_state) {
		System.out.println("TSF_MainService");
		
		List<MallVo> auth_MallList = mallDao.get_joinmall_list(member_no, member_id, member_state);
		
		return auth_MallList;
	}
	
	public List<MallVo> GetRandomMallList(){
		
		List<MallVo> RandomMallList = mallDao.get_Random_Mall_List();
		return RandomMallList;
	}

	@Transactional
	public void insert_mall(MallVo mallVo) {
		// TODO Auto-generated method stub
		// 쇼핑몰 생성하기
		int mall_no = mallDao.insert_mall(mallVo);		//mall테이블에 쇼핑몰 정보 입력
		mallVo.setMall_no(mall_no);
		mallDao.insert_joinmall(mallVo);	//joinmall테이블에 가입한 쇼핑몰 정보 입력 (쇼핑몰 가입하기)
		
	}


	
}
