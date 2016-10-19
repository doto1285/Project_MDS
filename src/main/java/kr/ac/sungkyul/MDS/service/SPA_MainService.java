package kr.ac.sungkyul.MDS.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.sun.javafx.geom.Area;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.dao.JoinMallDao;
import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.MallImgDao;
import kr.ac.sungkyul.MDS.dao.MemberDao;
import kr.ac.sungkyul.MDS.dao.OrderinfoDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.JoinMallVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.MemberVo;
import kr.ac.sungkyul.MDS.vo.OrderinfoVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;

@Service
public class SPA_MainService {

	@Autowired
	MemberDao memberDao;

	@Autowired
	MallDao mallDao;

	@Autowired
	CategoryListDao categoryListDao;

	@Autowired
	OrderinfoDao orderinfoDao;

	@Autowired
	ProductDao productDao;

	@Autowired
	JoinMallDao joinMallDao;

	@Autowired
	MallImgDao mallImgDao;

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
	 * 
	 * @param domain
	 * @return
	 */
	public MallVo getSelectMall(String domain) {
		MallVo mallVo = mallDao.get_select_Mall(domain);
		return mallVo;
	}

	/**
	 * 쇼핑몰 정보를 갱신한다.
	 * 
	 * @param mallVo
	 * @return
	 */
	public boolean modifyMall(MallVo mallVo) {
		return mallDao.updateMall(mallVo);
	}

	/**
	 * 주문목록을 가져온다.
	 * 
	 * @param domain
	 * @return
	 */
	public Map<String, Object> getOrderInfo(String domain) {
		// 주문vo, 상품vo가 들어감
		Map<String, Object> map = new HashMap<String, Object>();

		// 도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);
		// 쇼핑몰 번호로 주문에 테이블 참조해서 값을 알아냄
		List<OrderinfoVo> orderlist = orderinfoDao.get_Orderinfo_List(mallVo.getMall_no());
		ProductOptionVo produntoption = new ProductOptionVo();
		// 상품번호를 통하여 상품이름을 알아낸 후 orderlist address에 넣어줌
		for (int i = 0; i < orderlist.size(); i++) {
			produntoption = productDao.getProductOption(orderlist.get(i).getProductoption_no());
			String temp = null;
			temp = (productDao.get_Product_name(orderlist.get(i).getProduct_no()).getProduct_name());
			temp = temp + "("+produntoption.getProductoption_color() +"/"+produntoption.getProductoption_size()+")";
			orderlist.get(i).setOrderinfo_address(temp);	
		}

		map.put("orderlist", orderlist);
		return map;

	}

	/**
	 * 고객목록을 가져온다.
	 * 
	 * @param domain
	 * @return
	 */
	public List<MemberVo> getMemberInfo(String domain) {
		List<MemberVo> memberlist = new ArrayList<MemberVo>();
		// 도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);
		// 쇼핑몰 번호를 이용하여 회원 번호를 받아옴
		List<JoinMallVo> joinmalllist = joinMallDao.get_joinmall(mallVo.getMall_no());
		// 회원번호에 맞는 회원정보를 저장
		for (int i = 0; i < joinmalllist.size(); i++) {
			memberlist.add(memberDao.get(Integer.parseInt(joinmalllist.get(i).getMember_no())));
		}
		return memberlist;
	}

	/**
	 * 쇼핑몰 이미지 삽입
	 * 
	 * @param domain
	 * @param file
	 * @throws IOException
	 */
	public void insertMallImg(String domain, MultipartFile file, int flag) throws IOException {
		// 도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);

		// 2. orgName
		String orgName = file.getOriginalFilename();

		// 3. fileSize
		long fileSize = file.getSize();

		// 4. saveName
		String saveName = orgName + domain;

		// 5. path 경로 정하기
		String path = "C:\\Users\\Jungminki\\Desktop\\skubit\\java\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project_MDS\\assets\\image";

		// 6. imageurl 경로
		String imageurl = "/Project_MDS/assets/image/" + saveName;

		// 7. 첨부파일 객체에 담기
		MallimgVo mallimgVo = new MallimgVo();

		mallimgVo.setMall_no(mallVo.getMall_no());
		mallimgVo.setMallimg_flag(flag);
		mallimgVo.setMallimg_path(path);
		mallimgVo.setMallimg_filename(orgName);
		mallimgVo.setMallimg_savename(saveName);
		mallimgVo.setMallimg_fileSize(fileSize);
		mallimgVo.setMallimg_image(imageurl);

		// 8. 첨부파일 삽입
		mallImgDao.insertMallimg(mallimgVo);

		// 9. 파일 복사 및 이동
		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
	}

	public String getMallImg(String domain, int flag) {
		// 도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);

		MallimgVo vo = new MallimgVo();
		vo.setMall_no(mallVo.getMall_no());
		vo.setMallimg_flag(flag);

		vo = mallImgDao.getmallimg(vo);

		if (vo == null && flag == 0) {
			return "/Project_MDS/assets/image/SPA_logo.png";
		} else if (vo == null && flag == 1) {
			return "/Project_MDS/assets/image/SPA_main.png";
		}

		return vo.getMallimg_image();
	}

	public void deleteMallImg(String domain, int flag) {
		// 도메인을 이용하여 쇼핑몰 번호, 이름을 알아냄
		MallVo mallVo = mallDao.domainCheck(domain);

		MallimgVo vo = new MallimgVo();
		vo.setMall_no(mallVo.getMall_no());
		vo.setMallimg_flag(flag);

		vo = mallImgDao.getmallimg(vo);
		if (vo == null) {
			return;
		}
		mallImgDao.deleteMallimg(vo);
	}

	public void updateOrderState(int orderinfoNo, int orderinfoState) {
		OrderinfoVo vo = new OrderinfoVo();
		vo.setOrderinfo_no(orderinfoNo);
		vo.setOrderinfo_state( (orderinfoState +1) );
		orderinfoDao.updateOrderState(vo);
	}
}
