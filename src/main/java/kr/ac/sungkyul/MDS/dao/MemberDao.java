package kr.ac.sungkyul.MDS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.MemberVo;

@Repository
public class MemberDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void insert(MemberVo vo) {
		// TODO Auto-generated method stub

		int count = sqlSession.insert( "user.insert", vo );
		System.out.println( count );
		
	}

	public MemberVo get(String member_id, String member_password, int member_distinction) {
		// TODO Auto-generated method stub
		//일반회원, 기업회원, admin 로그인

		System.out.println("dao - " + member_id + "  " + member_password);
		
		MemberVo memberVo = new MemberVo();

		memberVo.setMember_id(member_id);
		memberVo.setMember_password(member_password);
		memberVo.setMember_distinction(member_distinction);
		
		System.out.println(memberVo);
		
		MemberVo vo = sqlSession.selectOne( "TSF_member.getByIdAndPassword", memberVo );
		return vo;
		
	}


}
