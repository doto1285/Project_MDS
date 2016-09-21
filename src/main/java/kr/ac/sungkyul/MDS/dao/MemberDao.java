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

	public MemberVo get(String member_id, String member_password) {
		// TODO Auto-generated method stub
		

		System.out.println("dao - " + member_id + "  " + member_password);
		
		MemberVo memberVo = new MemberVo();
//		userVo.set(email);
//		userVo.setPassword(password);

		memberVo.setMember_id(member_id);
		memberVo.setMember_password(member_password);
		
		System.out.println(memberVo);
		
		//만약에 파라미터로 넘겨야 할 매핑 클래스가 없는 경우
		/*
		Map<String, Object> map = new HashMap<String, Object>();
		map.put( "email", email );
		map.put( "password", password );
		UserVo vo = sqlSession.selectOne( 
				"user.getByEmailAndPassword", map );
		*/

		MemberVo vo = sqlSession.selectOne( "TSF_member.getByIdAndPassword", memberVo );
		return vo;
		
	}

}
