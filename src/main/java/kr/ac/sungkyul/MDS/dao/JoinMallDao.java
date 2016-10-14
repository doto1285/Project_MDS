package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.JoinMallVo;

@Repository
public class JoinMallDao {

	@Autowired
	private SqlSession sqlSession;

	/**
	 * 쇼핑몰 넘버에 맞는 joinmall 리스트를 가져온다.
	 * 
	 * @param mallNo
	 * @return
	 */
	public List<JoinMallVo> get_joinmall(int mallNo) {
		List<JoinMallVo> list = sqlSession.selectList("TSF_joinmall.get_joinmall_list", mallNo);
		return list;
	}
}
