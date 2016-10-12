package kr.ac.sungkyul.MDS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.MallimgVo;

@Repository
public class MallImgDao {
	@Autowired
	private SqlSession sqlSession;

	// 로고 첨부파일 등록
	public void insertMallimg(MallimgVo mallimgVo) {
		sqlSession.insert("SPA_mallimg.insertmallimg", mallimgVo);
	}
	
	public MallimgVo getmallimg(MallimgVo mallimgVo) {
		return sqlSession.selectOne("SPA_mallimg.getmallimg", mallimgVo);
	}

}
