package kr.ac.sungkyul.MDS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;

@Repository
public class MemberDao {

	@Autowired
	private SqlSession sqlSession;

	public void insert(MemberVo vo) {

		sqlSession.insert("TSF_member.insertMember", vo);
	}

	public MemberVo get(String member_id, String member_password, int member_distinction) {
		// 일반회원, 기업회원, admin 로그인

		System.out.println("dao - " + member_id + "  " + member_password);

		MemberVo memberVo = new MemberVo();

		memberVo.setMember_id(member_id);
		memberVo.setMember_password(member_password);
		memberVo.setMember_distinction(member_distinction);

		System.out.println(memberVo);

		MemberVo vo = sqlSession.selectOne("TSF_member.getByIdAndPassword", memberVo);
		return vo;

	}

	public MemberVo get(int member_no) {
		MemberVo vo = sqlSession.selectOne("TSF_member.selectOne", member_no);
		return vo;

	}

	/**
	 * 로그인 세션이 있는 회원이 현재 개인 쇼핑몰 회원인지 체크
	 * 
	 * @param joinmallVo
	 * @return
	 */
	public JoinMallVo get(JoinMallVo joinmallVo) {
		JoinMallVo joinmallVo2 = sqlSession.selectOne("SPF_member.get_By_SPF_Member_Check", joinmallVo);
		return joinmallVo2;
	}

	public void SPFJoin(JoinMallVo joinmallVo) {
		sqlSession.insert("SPF_member.insert_SPF_Member", joinmallVo);
	}

	public MemberVo SPFLoginCheck(String id, String password) {

		MemberVo memberVo = new MemberVo();
		memberVo.setMember_id(id);
		memberVo.setMember_password(password);
		memberVo = sqlSession.selectOne("SPF_member.get_By_SPF_IdAndPassword", memberVo);
		return memberVo;
	}

}
