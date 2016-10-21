package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.BasketDao;
import kr.ac.sungkyul.MDS.dao.OrderinfoDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.BasketListVo;
import kr.ac.sungkyul.MDS.vo.BasketVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPF_OrderService {

	@Autowired
	private BasketDao basketDao;

	public List<BasketListVo> insertOrder(List<Map<String, Object>> resultMap, int mall_no) {
		List<BasketListVo> orderList = new ArrayList<BasketListVo>();
		for (Map<String, Object> map : resultMap) {
			BasketListVo basketListVo = new BasketListVo();
			basketListVo.setBasket_count(Integer.parseInt(String.valueOf(map.get("productoption_stock"))));
			basketListVo.setProduct_no(Integer.parseInt(String.valueOf(map.get("product_no"))));
			basketListVo.setProduct_name(String.valueOf(map.get("product_name")));
			basketListVo.setProduct_price(Integer.parseInt(String.valueOf(map.get("product_price"))));
			basketListVo.setTotal(Integer.parseInt(String.valueOf(map.get("orderinfo_price"))));
			basketListVo.setProductoption_color(String.valueOf(map.get("productoption_color")));
			basketListVo.setProductoption_size(String.valueOf(map.get("productoption_size")));
			basketListVo.setProductimg_image(String.valueOf(map.get("productimg_image")));
			basketListVo.setProductoprion_no( Integer.parseInt(String.valueOf(map.get("productoption_no"))));
			basketListVo.setMember_no( Integer.parseInt(String.valueOf(map.get("member_no"))));
			basketListVo.setMall_no(mall_no);
			orderList.add(basketListVo);
		}
		return orderList;
		
	}

	// (int) map.get("productoption_stock");
	// (int) map.get("orderinfo_price");
	// (int) map.get("product_no");
	// (int) map.get("productoption_no");
	// (int) map.get("member_no");

	
//	  System.out.println("수량: " + map.get("productoption_stock") + "  " +
//	  "주문가격: " + map.get("orderinfo_price") + "  " + "상품번호: " +
//	  map.get("product_no") + "  " + "상품옵션번호: " + map.get("productoption_no") +
//	  "  " + "회원번호: " + map.get("member_no"));

}
