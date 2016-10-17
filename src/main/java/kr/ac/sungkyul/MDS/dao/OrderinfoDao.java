package kr.ac.sungkyul.MDS.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.ac.sungkyul.MDS.vo.OrderinfoVo;


@Repository
public class OrderinfoDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	public List<OrderinfoVo> get_Orderinfo_List(int no) {
		//추천 쇼핑몰 목록에 가져온 쇼핑몰 리스트를 랜덤으로 생성한다
		List<OrderinfoVo> listvo = sqlSession.selectList("SPA_orderinfo.get_Orderinfo_List", no);
		return listvo;
	}
	
	public void updateOrderState(OrderinfoVo vo) {
		sqlSession.update("SPA_orderinfo.updateOrderState", vo);
		
	}
}
