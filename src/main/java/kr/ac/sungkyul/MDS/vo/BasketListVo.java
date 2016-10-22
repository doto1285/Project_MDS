package kr.ac.sungkyul.MDS.vo;

public class BasketListVo {
	private int basket_no;
	private int basket_count;
	private int product_no;
	private int productoption_no;
	private int member_no;
	private int mall_no;
	private String productoption_color;
	private String productoption_size;
	private String product_name;
	private int product_price;
	private String productimg_image;
	private int total;
	private Integer pageNo;
	private String address;
	
	public int getBasket_no() {
		return basket_no;
	}
	public void setBasket_no(int basket_no) {
		this.basket_no = basket_no;
	}
	public int getBasket_count() {
		return basket_count;
	}
	public void setBasket_count(int basket_count) {
		this.basket_count = basket_count;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getProductoption_no() {
		return productoption_no;
	}
	public void setProductoption_no(int productoption_no) {
		this.productoption_no = productoption_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getMall_no() {
		return mall_no;
	}
	public void setMall_no(int mall_no) {
		this.mall_no = mall_no;
	}
	public String getProductoption_color() {
		return productoption_color;
	}
	public void setProductoption_color(String productoption_color) {
		this.productoption_color = productoption_color;
	}
	public String getProductoption_size() {
		return productoption_size;
	}
	public void setProductoption_size(String productoption_size) {
		this.productoption_size = productoption_size;
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
	public String getProductimg_image() {
		return productimg_image;
	}
	public void setProductimg_image(String productimg_image) {
		this.productimg_image = productimg_image;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	@Override
	public String toString() {
		return "BasketListVo [basket_no=" + basket_no + ", basket_count=" + basket_count + ", product_no=" + product_no
				+ ", productoption_no=" + productoption_no + ", member_no=" + member_no + ", mall_no=" + mall_no
				+ ", productoption_color=" + productoption_color + ", productoption_size=" + productoption_size
				+ ", product_name=" + product_name + ", product_price=" + product_price + ", productimg_image="
				+ productimg_image + ", total=" + total + ", pageNo=" + pageNo + ", address=" + address + "]";
	}
}
