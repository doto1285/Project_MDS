package kr.ac.sungkyul.MDS.vo;

public class ProductimgVo {
	private int productimg_no;
	private String productimg_filename;
	private String productimg_savename;
	private int product_no;
	private String productimg_path;
	private long productimg_fileSize;
	private String productimg_image;
	private int productimg_flag;

	public int getProductimg_no() {
		return productimg_no;
	}

	public void setProductimg_no(int productimg_no) {
		this.productimg_no = productimg_no;
	}

	public String getProductimg_filename() {
		return productimg_filename;
	}

	public void setProductimg_filename(String productimg_filename) {
		this.productimg_filename = productimg_filename;
	}

	public String getProductimg_savename() {
		return productimg_savename;
	}

	public void setProductimg_savename(String productimg_savename) {
		this.productimg_savename = productimg_savename;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getProductimg_path() {
		return productimg_path;
	}

	public void setProductimg_path(String productimg_path) {
		this.productimg_path = productimg_path;
	}

	public long getProductimg_fileSize() {
		return productimg_fileSize;
	}

	public void setProductimg_fileSize(long productimg_fileSize) {
		this.productimg_fileSize = productimg_fileSize;
	}

	public String getProductimg_image() {
		return productimg_image;
	}

	public void setProductimg_image(String productimg_image) {
		this.productimg_image = productimg_image;
	}

	public int getProductimg_flag() {
		return productimg_flag;
	}

	public void setProductimg_flag(int productimg_flag) {
		this.productimg_flag = productimg_flag;
	}

	@Override
	public String toString() {
		return "ProductimgVo [productimg_no=" + productimg_no + ", productimg_filename=" + productimg_filename
				+ ", productimg_savename=" + productimg_savename + ", product_no=" + product_no + ", productimg_path="
				+ productimg_path + ", productimg_fileSize=" + productimg_fileSize + ", productimg_image="
				+ productimg_image + ", productimg_flag=" + productimg_flag + "]";
	}

}
