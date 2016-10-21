package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.BasketListVo;
import kr.ac.sungkyul.MDS.vo.BasketVo;
import kr.ac.sungkyul.MDS.vo.MallVo;

@Repository
public class BasketDao {
	
	@Autowired
	private SqlSession sqlSession;

	public void insertBasket(List<BasketVo> basketList) {
		for(int i=0; i<basketList.size(); i++){
			BasketVo basketVo = basketList.get(i);
			sqlSession.insert("SPF_basket.insertbasket", basketVo);
		}
	}
	
	public List<BasketListVo> selectBasket(MallVo mallVo){
		return sqlSession.selectList("SPF_basket.selectbasket", mallVo);
	}
	
	public void deleteBasket(List<BasketListVo> basketList) {
		for(int i=0; i<basketList.size(); i++){
			BasketListVo basketListVo = basketList.get(i);
			sqlSession.delete("SPF_basket.deletebasket", basketListVo);
		}
	}

}
