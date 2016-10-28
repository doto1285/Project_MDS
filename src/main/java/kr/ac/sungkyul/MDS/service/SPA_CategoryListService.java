package kr.ac.sungkyul.MDS.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;;

@Service
public class SPA_CategoryListService {

	@Autowired
	private CategoryListDao categoryListDao;
	
	@Autowired
	private MallDao mallDao;

	public List<CategoryListVo> getCategoryList(String domain) {
		// TODO Auto-generated method stub
		// 해당 쇼핑몰의 카테고리 리스트를 불러온다 sky

		return categoryListDao.getCategoryList(domain);
	}
	
	public List<CategoryListVo> getCategoryList2nd(String domain, int groupNo) {
		//쇼핑몰과 그룹번호에 맞는 2차 카테고리를 가져온다
		MallVo mallVo = mallDao.domainCheck(domain);
		CategoryListVo vo = new CategoryListVo();
		vo.setMall_no(mallVo.getMall_no());
		vo.setCategorylist_group(groupNo);
		return categoryListDao.getCategoryList2nd(vo);
	}
	
	public void ModifyName(CategoryListVo vo) {
		// TODO Auto-generated method stub
		// 카테고리 이름을 수정한다 sky
		categoryListDao.ModifyName(vo);
	}

	public void InsertCategory(CategoryListVo vo) {
		// TODO Auto-generated method stub
		//새로운 1차 카테고리 추가
		
		categoryListDao.InsertCategory(vo);
		
	}
	
	@Transactional
	public void DeleteCategory(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 카테고리 삭제 sky
		CategoryListVo vo  = categoryListDao.getMyVo(msgchangecateNo); //자신의 카테고리 정보를 가져온다
		categoryListDao.DeleteCategory(msgchangecateNo);	//카테고리를 삭제(state = 0으로 변경)
		categoryListDao.DeleteCategory_OrderNoDown(vo);		//카테고리 삭제시 자신보다 orderNo가 큰 카테고리들의 orderNo를 1씩 감소시킨다
	
	}

	@Transactional
	public void categoryUp(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 카테고리 up sky
		
		CategoryListVo vo  = categoryListDao.getMyVo(msgchangecateNo); // 순서를 위로 올릴 카테고리(자기자신) 정보를 가져온다
//		System.out.println("내 카테고리 " + vo);
	
		CategoryListVo vo2 =categoryListDao.getBelowOrderNo(vo);//자신보다 orderNo가 1낮은 카테고리 정보를 가져온다
//		System.out.println("위에 카테고리" + vo2);
		
		int temp = vo.getCategorylist_orderno();
//		System.out.println("temp" + temp);
		
		vo.setCategorylist_orderno(vo2.getCategorylist_orderno());
		vo2.setCategorylist_orderno(temp);
//		
//		System.out.println("변경후 내꺼 " + vo);
//		System.out.println("변경후 위에꺼 " + vo2);
		
		categoryListDao.updateOrderno(vo);	//변경된 orderno를 데이터베이스에 저장한다
		categoryListDao.updateOrderno(vo2);	//변경된 orderno를 데이터베이스에 저장한다
	}
	
	@Transactional
	public void categoryDown(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 카테고리 Down sky
		
		
		CategoryListVo vo  = categoryListDao.getMyVo(msgchangecateNo); // 순서를 내릴 카테고리(자기자신) 정보를 가져온다
//		System.out.println("내 카테고리 " + vo);
	
		CategoryListVo vo2 =categoryListDao.getAboveOrderNo(vo);//자신보다 orderNo가 1높은 카테고리 정보를 가져온다
//		System.out.println("위에 카테고리" + vo2);
		
		int temp = vo.getCategorylist_orderno();
//		System.out.println("temp" + temp);
		
		vo.setCategorylist_orderno(vo2.getCategorylist_orderno());
		vo2.setCategorylist_orderno(temp);
//		
//		System.out.println("변경후 내꺼 " + vo);
//		System.out.println("변경후 위에꺼 " + vo2);
		
		categoryListDao.updateOrderno(vo);	//변경된 orderno를 데이터베이스에 저장한다
		categoryListDao.updateOrderno(vo2);	//변경된 orderno를 데이터베이스에 저장한다
		
	}
	public CategoryListVo getMyVo(int msgchangecateNo) {
		// TODO Auto-generated method stub
		// 카테고리 자신의 객체 정보를 가져온다.
		CategoryListVo vo  = categoryListDao.getMyVo(msgchangecateNo);
		return vo;
		
	}
	
	public CategoryListVo getCategory1nd(int categorylist_no) {
		CategoryListVo vo = categoryListDao.getCategory1nd(categorylist_no);
		return vo;
	}


}
