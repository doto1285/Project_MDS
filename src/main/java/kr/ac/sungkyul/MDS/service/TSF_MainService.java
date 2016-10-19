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

	public List<MallVo> GetRandomMallList() {

		List<MallVo> RandomMallList = mallDao.get_Random_Mall_List();
		return RandomMallList;
	}

	@Transactional
	public void insert_mall(MallVo mallVo) {
		// TODO Auto-generated method stub
		// 쇼핑몰 생성하기
		int mall_no = mallDao.insert_mall(mallVo); // mall테이블에 쇼핑몰 정보 입력

		// selectKey를 사용하여 생성된 쇼핑몰 번호를 vo객체에 저장한다.
		mallVo.setMall_no(mall_no);

		// joinmall테이블에 가입한 쇼핑몰 정보 입력 (쇼핑몰 가입하기)
		mallDao.insert_joinmall(mallVo);

	}

	public List<MallVo> search_mall(String keyword) {
		// TODO Auto-generated method stub
		//검색어로 검색한 쇼핑몰 목록 가져오기
		
		
		return mallDao.search_mall(keyword);
	}

	public List<MallVo> choose_mall(String mall_type) {
		// TODO Auto-generated method stub
		//탭에서 선택한 쇼핑몰 목록 가져오기
		
		return  mallDao.choose_mall(mall_type);
	}

}
