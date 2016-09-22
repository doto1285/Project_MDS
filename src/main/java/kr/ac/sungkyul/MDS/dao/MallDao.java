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
		// TODO Auto-generated method stub
		//일반회원, 기업회원, admin 로그인

		
		MemberVo memberVo = new MemberVo();

		memberVo.setMember_no(member_no);
		memberVo.setMember_id(member_id);
		memberVo.setMember_state(member_state);
		
		System.out.println("mallDao " + memberVo);
		
		List<MallVo> listvo = sqlSession.selectList( "TSF_mall.get_joinmall_list", memberVo );
		
		
		for(MallVo vo : listvo){

			System.out.println("가입한 쇼핑몰 리스트 " + vo);
		}
		
		return listvo;
		
	}


}
