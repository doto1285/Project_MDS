package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Repository
public class MallDao {

	@Autowired
	private SqlSession sqlSession;

	public List<MallVo> get_joinmall_list(int member_no, String member_id, int member_state) {
		// 일반회원, 기업회원, admin 로그인
		// 현재 자신이 가입한 쇼핑몰의 목록을 가져온다.

		MemberVo memberVo = new MemberVo();

		memberVo.setMember_no(member_no);
		memberVo.setMember_id(member_id);
		memberVo.setMember_state(member_state);

		System.out.println("mallDao " + memberVo);

		List<MallVo> listvo = sqlSession.selectList("TSF_mall.get_joinmall_list", memberVo);

		// for(MallVo vo : listvo){
		//
		// System.out.println("가입한 쇼핑몰 리스트 " + vo);
		// }

		return listvo;
	}

	public List<MallVo> get_Random_Mall_List() {
		// 추천 쇼핑몰 목록에 가져온 쇼핑몰 리스트를 랜덤으로 생성한다
		List<MallVo> listvo = sqlSession.selectList("TSF_mall.get_Random_Mall_List");
		return listvo;
	}

	public MallVo get_select_Mall(String mallName) {
		// 쇼핑몰 이름으로 쇼핑몰 정보를 가져온다
		MallVo mallVo = (MallVo) sqlSession.selectOne("TSF_mall.get_select_Mall", mallName);
		return mallVo;
	}

	public boolean updateMall(MallVo mallVo) {
		return sqlSession.update("mallupdate", mallVo) != 0;
	}

	public MallVo get_member_admin(MemberVo memberVo) {
		MallVo mallVo = (MallVo) sqlSession.selectOne("TSF_mall.get_member_admin", memberVo);
		return mallVo;
	}

	/**
	 * SPF 도메인 이름으로 mallVo 가져옴 만든이 : 이민우
	 * 
	 * @param domain
	 * @return
	 */
	public MallVo domainCheck(String mall_domain) {
		MallVo mallVo = (MallVo) sqlSession.selectOne("SPF_mall.domain_Name_Check", mall_domain);
		return mallVo;
	}

	/**
	 * SPF 쇼핑몰 넘버로 유효 도메인인지 체크 만든이 : 이민우
	 * 
	 * @param domain
	 * @return
	 */
	public MallVo domainCheck(int mall_no) {
		MallVo mallVo = (MallVo) sqlSession.selectOne("SPF_mall.domain_No_Check", mall_no);
		return mallVo;
	}

	/**
	 * SPF 쇼핑몰 넘버 기준 푸터 정보 가져오기 만든이 : 이민우
	 * 
	 * @param mall_no
	 * @return
	 */
	public MallVo get_Footer(int mall_no) {
		MallVo mallVo = (MallVo) sqlSession.selectOne("SPF_mall.get_Footer", mall_no);
		return mallVo;
	}

	public int insert_mall(MallVo mallVo) {
		// TODO Auto-generated method stub
		// 쇼핑몰 생성하기
		sqlSession.insert("TSF_mall.insert_mall", mallVo);
		System.out.println("생성될 쇼핑몰 " + mallVo);

		return mallVo.getMall_no();
	}

	public void insert_joinmall(MallVo mallVo) {
		// TODO Auto-generated method stub
		// 가입한 쇼핑몰 추가하기 (쇼핑몰 가입하기)
		sqlSession.insert("TSF_mall.insert_joinmall", mallVo);
	}

	public List<MallVo> search_mall(String keyword) {
		// TODO Auto-generated method stub
		// 검색어로 검색한 쇼핑몰 목록 가져오기

		return sqlSession.selectList("TSF_mall.search_mall", "%"+keyword+"%");

	}

}
