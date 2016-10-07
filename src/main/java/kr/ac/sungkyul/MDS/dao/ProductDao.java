package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.ProductVo;

@Repository
public class ProductDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public ProductVo get_Product_name(int no) {
		//추천 쇼핑몰 목록에 가져온 쇼핑몰 리스트를 랜덤으로 생성한다
		ProductVo vo = sqlSession.selectOne("SPA_product.get_produnt_name", no);
		return vo;
	}

}
