package kr.ac.sungkyul.MDS.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.sungkyul.MDS.dao.MallDao;
import kr.ac.sungkyul.MDS.dao.ProductDao;
import kr.ac.sungkyul.MDS.dao.ProductImgDao;
import kr.ac.sungkyul.MDS.vo.MallVo;
import kr.ac.sungkyul.MDS.vo.ProductListVo;
import kr.ac.sungkyul.MDS.vo.ProductOptionVo;
import kr.ac.sungkyul.MDS.vo.ProductVo;
import kr.ac.sungkyul.MDS.vo.ProductimgVo;

@Service
public class SPA_ProductService {
	@Autowired
	ProductDao productDao;
	@Autowired
	MallDao mallDao;
	@Autowired
	ProductImgDao productImgDao;

	
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
	 * 상품번호를 이용하여 상품정보를 가져온다.
	 * @param product_no
	 * @return
	 */
	public ProductVo getProduct(int product_no) {
		return productDao.getProduct(product_no);
	}
	
	/**
	 * 상품번호를 이용하여 모든 상품옵션을 가져온다.
	 * @param product_no
	 * @return
	 */
	public List<ProductOptionVo> getProductOptionList(int product_no) {
		return productDao.getProductOptionList(product_no);
	}
	
	/**
	 * 상품번호에 맞는 상품을 삭제한다.
	 * @param productNo
	 */
	public void deleteProduct(int productNo) {
		productDao.deleteProduct(productNo);
	}
	
	/**
	 * 상품정보를 추가한다.
	 * @param productVo
	 */
	public int insertProduct(ProductVo productVo) {
		productVo.setProduct_content("a");
		return productDao.insertProduct(productVo);
	}
	
	/**
	 * 상품정보를 수정한다.
	 * @param productVo
	 */
	public void modifyProduct(ProductVo productVo) {
		productVo.setProduct_content("a");
		productDao.modifyProduct(productVo);
	}
	
	/**
	 * 상품을 추가하기전 이름이 같은 것이 있는지 중복검사
	 * @param product_name
	 * @return
	 */
	public boolean isProductDistinct(String domain, String product_name) {
		List<ProductListVo> list = getProductInfo(domain);
		for(int i=0; i<list.size(); i++) {
			System.out.println("1"+list.get(i).getProduct_name());
			System.out.println("2"+product_name);
			if(list.get(i).getProduct_name().equals(product_name)) {
				return true;
			}
		}
		return false;
	}
	
	/**
	 * 상품옵션을 추가한다.
	 * @param ProductOptionVo
	 */
	public void insertProductOption(ProductOptionVo productOptionVo) {
		productDao.insertProductOption(productOptionVo);
	}
	
	/**
	 * 상품옵션을 수정한다.
	 * @param ProductOptionVo
	 */
	public void modifyProductOption(ProductOptionVo productOptionVo) {
		productDao.modifyProductOption(productOptionVo);
	}
	
	/**
	 * 상품 이미지 삽입
	 * 
	 * @param domain
	 * @param file
	 * @throws IOException
	 */
	public void insertProductImg(int productNo, MultipartFile file, int flag) throws IOException {

		// 2. orgName
		String orgName = file.getOriginalFilename();

		// 3. fileSize
		long fileSize = file.getSize();

		// 4. saveName
		String saveName = orgName + productNo + flag;

		// 5. path 경로 정하기
		String path = "D:\\class\\java\\workspaec\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project_MDS\\assets\\image";

		// 6. imageurl 경로
		String imageurl = "/Project_MDS/assets/image/" + saveName;

		// 7. 첨부파일 객체에 담기
		ProductimgVo productimgVo = new ProductimgVo();

		productimgVo.setProduct_no(productNo);
		productimgVo.setProductimg_flag(flag);
		productimgVo.setProductimg_path(path);
		productimgVo.setProductimg_filename(orgName);
		productimgVo.setProductimg_savename(saveName);
		productimgVo.setProductimg_fileSize(fileSize);
		productimgVo.setProductimg_image(imageurl);

		// 8. 첨부파일 삽입
		productImgDao.insertProductimg(productimgVo);

		// 9. 파일 복사 및 이동
		File target = new File(path, saveName);
		FileCopyUtils.copy(file.getBytes(), target);
	}
	
	public String getProductImg(int product_no, int flag) {
		ProductimgVo vo = new ProductimgVo();
		vo.setProduct_no(product_no);
		vo.setProductimg_flag(flag);

		vo = productImgDao.getproductimg(vo);

		return vo.getProductimg_image();
	}
	
	public void deleteProductImg(int product_no, int flag) {

		ProductimgVo vo = new ProductimgVo();
		vo.setProduct_no(product_no);
		vo.setProductimg_flag(flag);
		
		vo = productImgDao.getproductimg(vo);
		if (vo == null) {
			return;
		}
		productImgDao.deleteProductimg(vo);
	}

}
