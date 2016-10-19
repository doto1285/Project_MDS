package kr.ac.sungkyul.MDS.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.MDS.dao.CategoryListDao;
import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.vo.CategoryListVo;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.MallimgVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;

@Service
public class SPA_ProductService {
	@Autowired
	ProductDao productDao;
	@Autowired
	MallDao mallDao;
	@Autowired
	private CategoryListDao categoryListDao;
	
	/**
	 * 상품리스트를 가져온다
	 * 
	 * @param domain
	 * @return
	 */
	public List<ProductListVo> getProductInfo(String domain) {
		MallVo mallVo = mallDao.domainCheck(domain);
		List<ProductListVo> productlist = productDao.get_Product_Content(mallVo);
		for(int i=0; i<productlist.size(); i++) {
			productlist.get(i).setProduct_no(productDao.getProductNo(productlist.get(i).getProduct_name()));
		}

		return productlist;
	}

	/**
	 * 상품번호에 맞는 상품을 삭제한다.
	 * @param productNo
	 */
	public void deleteProduct(int productNo) {
		productDao.deleteProduct(productNo);
	}
	
	/**
	 * 상품 이미지 삽입
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
		//mallImgDao.insertMallimg(mallimgVo);

		// 9. 파일 복사 및 이동
		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
	}

}
