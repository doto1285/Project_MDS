package kr.ac.sungkyul.MDS.vo;

//2개의 테이블 (product + productimg) VO
public class CategoryProductListVo {

	private int product_no;
	private String product_name;
	private int product_price;
	private String product_content;
	private String product_maker;
	private String product_makedate;
	private int product_state;
	private int member_no;
	private int categorylist_no;
	private int productimg_no;
	private String productimg_filename;
	private String productimg_savename;
	private int product_no_1;
	private String productimg_path;
	private int productimg_filesize;
	private String productimg_image;
	private int productimg_flag;
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public int getProduct_price() {
		return product_price;
	}
	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}
	public String getProduct_content() {
		return product_content;
	}
	public void setProduct_content(String product_content) {
		this.product_content = product_content;
	}
	public String getProduct_maker() {
		return product_maker;
	}
	public void setProduct_maker(String product_maker) {
		this.product_maker = product_maker;
	}
	public String getProduct_makedate() {
		return product_makedate;
	}
	public void setProduct_makedate(String product_makedate) {
		this.product_makedate = product_makedate;
	}
	public int getProduct_state() {
		return product_state;
	}
	public void setProduct_state(int product_state) {
		this.product_state = product_state;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getCategorylist_no() {
		return categorylist_no;
	}
	public void setCategorylist_no(int categorylist_no) {
		this.categorylist_no = categorylist_no;
	}
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
	public int getProduct_no_1() {
		return product_no_1;
	}
	public void setProduct_no_1(int product_no_1) {
		this.product_no_1 = product_no_1;
	}
	public String getProductimg_path() {
		return productimg_path;
	}
	public void setProductimg_path(String productimg_path) {
		this.productimg_path = productimg_path;
	}
	public int getProductimg_filesize() {
		return productimg_filesize;
	}
	public void setProductimg_filesize(int productimg_filesize) {
		this.productimg_filesize = productimg_filesize;
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
		return "CategoryProductimgVo [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_content=" + product_content + ", product_maker=" + product_maker
				+ ", product_makedate=" + product_makedate + ", product_state=" + product_state + ", member_no="
				+ member_no + ", categorylist_no=" + categorylist_no + ", productimg_no=" + productimg_no
				+ ", productimg_filename=" + productimg_filename + ", productimg_savename=" + productimg_savename
				+ ", product_no_1=" + product_no_1 + ", productimg_path=" + productimg_path + ", productimg_filesize="
				+ productimg_filesize + ", productimg_image=" + productimg_image + ", productimg_flag="
				+ productimg_flag + "]";
	}
	
	
	
}
