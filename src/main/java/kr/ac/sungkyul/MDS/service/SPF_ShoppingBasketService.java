package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.BasketDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.BasketVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPF_ShoppingBasketService {

	@Autowired
	private BasketDao basketDao;

	public void insertBasket(List<Map<String, Object>> resultMap, int mall_no) {

		List<BasketVo> basketList = new ArrayList<BasketVo>();
		for (Map<String, Object> map : resultMap) {
			BasketVo basketVo = new BasketVo();
			basketVo.setBasket_count(Integer.parseInt(String.valueOf(map.get("productoption_stock"))));
			basketVo.setMember_no( Integer.parseInt(String.valueOf(map.get("member_no"))));
			basketVo.setProduct_no( Integer.parseInt(String.valueOf(map.get("product_no"))));
			basketVo.setProductoprion_no( Integer.parseInt(String.valueOf(map.get("productoption_no"))));
			basketVo.setMall_no(mall_no);
			basketList.add(basketVo);
		}
		basketDao.insertBasket(basketList);
	}

	// (int) map.get("productoption_stock");
	// (int) map.get("orderinfo_price");
	// (int) map.get("product_no");
	// (int) map.get("productoption_no");
	// (int) map.get("member_no");

	/*
	 * System.out.println("수량: " + map.get("productoption_stock") + "  " +
	 * "주문가격: " + map.get("orderinfo_price") + "  " + "상품번호: " +
	 * map.get("product_no") + "  " + "상품옵션번호: " + map.get("productoption_no") +
	 * "  " + "회원번호: " + map.get("member_no"));
	 */

}
