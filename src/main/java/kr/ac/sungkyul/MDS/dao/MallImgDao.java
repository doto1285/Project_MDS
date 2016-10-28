package kr.ac.sungkyul.MDS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.MallVo;
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

	public MallimgVo get_selectMallimg_logo(MallVo mallVo) {
		return sqlSession.selectOne("SPF_mallimg.selectMallimg_logo", mallVo);

	}

	public MallimgVo get_selectMallimg_gate(MallVo mallVo) {
		return sqlSession.selectOne("SPF_mallimg.selectMallimg_gate", mallVo);
	}
	
	public void deleteMallimg(MallimgVo mallimgVo) {
		sqlSession.delete("SPA_mallimg.deletemallimg", mallimgVo);
	}

}
