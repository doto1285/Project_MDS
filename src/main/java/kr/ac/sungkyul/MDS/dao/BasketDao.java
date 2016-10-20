package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BasketVo;

@Repository
public class BasketDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void insertBasket(List<BasketVo> basketList) {
		System.out.println(basketList.size());
		for(int i=0; i<basketList.size(); i++){
			BasketVo basketVo = basketList.get(i);
			sqlSession.insert("SPF_basket.insertbasket", basketVo);
		}
	}
}
