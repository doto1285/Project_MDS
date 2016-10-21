package kr.ac.sungkyul.MDS.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.ProductimgVo;


@Repository
public class ProductImgDao {
	@Autowired
	private SqlSession sqlSession;
	
	public void insertProductimg(ProductimgVo productimgVo) {
		sqlSession.insert("SPA_productimg.insertproductimg", productimgVo);
	}

}
