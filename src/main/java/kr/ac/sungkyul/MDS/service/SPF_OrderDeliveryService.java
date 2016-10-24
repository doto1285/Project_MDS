package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.OrderinfoDao;
import kr.ac.sungkyul.MDS.vo.BasketListVo;
import kr.ac.sungkyul.MDS.vo.OrderinfoVo;

@Service
public class SPF_OrderDeliveryService {

	@Autowired
	private OrderinfoDao orderinfoDao;

	public void orderInfoInsert(List<Map<String, Object>> resultMap, int mall_no) {
		List<OrderinfoVo> orderList = new ArrayList<OrderinfoVo>();
		for (Map<String, Object> map : resultMap) {
			OrderinfoVo orderinfoVo = new OrderinfoVo();
			orderinfoVo.setOrderinfo_count(Integer.parseInt(String.valueOf(map.get("basket_count"))));
			orderinfoVo.setOrderinfo_price(Integer.parseInt(String.valueOf(map.get("orderinfo_price"))));
			orderinfoVo.setOrderinfo_address(String.valueOf(map.get("address")));
			orderinfoVo.setProduct_no(Integer.parseInt(String.valueOf(map.get("product_no"))));
			orderinfoVo.setProductoption_no(Integer.parseInt(String.valueOf(map.get("productoption_no"))));
			orderinfoVo.setMember_no(Integer.parseInt(String.valueOf(map.get("member_no"))));
			orderinfoVo.setMall_no(mall_no);
			orderList.add(orderinfoVo);
		}
		orderinfoDao.orderInfoInsert(orderList);
	}
	
	public void deleteBasket(List<Map<String, Object>> resultMap) {
		List<BasketListVo>  basketList = new ArrayList<BasketListVo>();
		for (Map<String, Object> map : resultMap) {
			BasketListVo basketListVo = new BasketListVo();
			basketListVo.setBasket_no(Integer.parseInt(String.valueOf(map.get("basket_no"))));
			basketList.add(basketListVo);
		}
		orderinfoDao.basketDelete(basketList);
	}
	
	public List<OrderinfoVo> orderInfoSelect(OrderinfoVo orderinfoVo){
		return orderinfoDao.orderInfoSelect(orderinfoVo);
	}
	
	public List<OrderinfoVo> orderInfoPaging(OrderinfoVo orderinfoVo){
		return orderinfoDao.orderInfoPaging(orderinfoVo);
	}
	
	public void orderDeliveryDelete(int orderinfo_no){
		orderinfoDao.orderDeliveryDelete(orderinfo_no);
	}
	

}
