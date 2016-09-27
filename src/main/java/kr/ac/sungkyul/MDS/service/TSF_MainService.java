package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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


	
}
