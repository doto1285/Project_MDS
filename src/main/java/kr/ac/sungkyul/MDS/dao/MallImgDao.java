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
	public void insertAttachPrFile(MallimgVo mallimgVo) {
		sqlSession.insert("product.insertAttachPrFile", mallimgVo);
	}
	
	public MallimgVo get_selectMallimg_logo(MallVo mallVo){
		System.out.println(mallVo.toString());
		return sqlSession.selectOne("SPF_mallimg.selectMallimg_logo", mallVo);
		
	}
	
public MallimgVo get_selectMallimg_gate(MallVo mallVo){
		
		return sqlSession.selectOne("SPF_mallimg.selectMallimg_gate", mallVo);
	}

}
