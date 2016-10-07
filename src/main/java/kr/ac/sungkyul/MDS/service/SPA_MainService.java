package kr.ac.sungkyul.MDS.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.OrderinfoDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import kr.ac.sungkyul.MDS.vo.OrderinfoVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;

@Service
public class SPA_MainService {

	@Autowired
	MallDao mallDao;
	
	@Autowired
	OrderinfoDao orderinfoDao;
	
	@Autowired
	ProductDao productDao;

	/**
	 * 유저가 세션에 있고, 유효한 유저인지 확인
	 * 
	 * @param domain
	 * @param session
	 * @return
	 */
	public boolean isUserCheck(String domain, HttpSession session) {
		MemberVo memberVo = (MemberVo) session.getAttribute("authUser");
		if (memberVo == null) {
			return false;
		}
		memberVo.setMember_id(domain);
		if (mallDao.get_member_admin(memberVo) == null) {
			return false;
		}
		return true;
	}

	/**
	 * 쇼핑몰 정보를 가져온다.
	 * @param domain
	 * @return
	 */
	public MallVo getSelectMall(String domain) {
		MallVo mallVo = mallDao.get_select_Mall(domain);
		return mallVo;
	}

	/**
	 * 쇼핑몰 정보를 갱신한다.
	 * @param mallVo
	 * @return
	 */
	public boolean modifyMall(MallVo mallVo) {
		return mallDao.updateMall(mallVo);
	}

	
	public Map<String, Object> getOrderinfo(String domain){
		//도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);
		//쇼핑몰 번호로 주문에 테이블 참조해서 값을 알아냄
		List<OrderinfoVo> orderlist = orderinfoDao.get_Orderinfo_List(mallVo.getMall_no());
		//상품번호를 통하여 상품이름을 알아냄
		List<ProductVo> productlist = new ArrayList<ProductVo>();
		for(OrderinfoVo vo : orderlist){
			productlist.add(productDao.get_Product_name(vo.getProduct_no()));
		}
		//맵에는 몰vo, 주문vo, 상품vo가 들어감
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("mallVo", mallVo);
		map.put("orderlist", orderlist);
		map.put("productlist", productlist);
		return map;
		
	}
 }
