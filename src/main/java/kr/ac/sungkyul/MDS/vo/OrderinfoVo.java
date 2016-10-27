package kr.ac.sungkyul.MDS.vo;

public class OrderinfoVo {
	private int orderinfo_no;
	private int orderinfo_count;
	private int orderinfo_price;
	private String orderinfo_address;
	private String orderinfo_date;
	private int orderinfo_state;
	private int product_no;
	private int member_no;
	private int productoption_no;
	private int mall_no;
	private String productoption_color;
	private String productoption_size;
	private String product_name;
	private String productimg_image;
	private Integer pageNo;
	private String mall_name;
	
	public int getOrderinfo_no() {
		return orderinfo_no;
	}
	public void setOrderinfo_no(int orderinfo_no) {
		this.orderinfo_no = orderinfo_no;
	}
	public int getOrderinfo_count() {
		return orderinfo_count;
	}
	public void setOrderinfo_count(int orderinfo_count) {
		this.orderinfo_count = orderinfo_count;
	}
	public int getOrderinfo_price() {
		return orderinfo_price;
	}
	public void setOrderinfo_price(int orderinfo_price) {
		this.orderinfo_price = orderinfo_price;
	}
	public String getOrderinfo_address() {
		return orderinfo_address;
	}
	public void setOrderinfo_address(String orderinfo_address) {
		this.orderinfo_address = orderinfo_address;
	}
	public String getOrderinfo_date() {
		return orderinfo_date;
	}
	public void setOrderinfo_date(String orderinfo_date) {
		this.orderinfo_date = orderinfo_date;
	}
	public int getOrderinfo_state() {
		return orderinfo_state;
	}
	public void setOrderinfo_state(int orderinfo_state) {
		this.orderinfo_state = orderinfo_state;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	public int getMember_no() {
		return member_no;
	}
	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}
	public int getProductoption_no() {
		return productoption_no;
	}
	public void setProductoption_no(int productoption_no) {
		this.productoption_no = productoption_no;
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
	public String getProductimg_image() {
		return productimg_image;
	}
	public void setProductimg_image(String productimg_image) {
		this.productimg_image = productimg_image;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	
	public String getMall_name() {
		return mall_name;
	}
	public void setMall_name(String mall_name) {
		this.mall_name = mall_name;
	}
	@Override
	public String toString() {
		return "OrderinfoVo [orderinfo_no=" + orderinfo_no + ", orderinfo_count=" + orderinfo_count
				+ ", orderinfo_price=" + orderinfo_price + ", orderinfo_address=" + orderinfo_address
				+ ", orderinfo_date=" + orderinfo_date + ", orderinfo_state=" + orderinfo_state + ", product_no="
				+ product_no + ", member_no=" + member_no + ", productoption_no=" + productoption_no + ", mall_no="
				+ mall_no + ", productoption_color=" + productoption_color + ", productoption_size="
				+ productoption_size + ", product_name=" + product_name + ", productimg_image=" + productimg_image
				+ ", pageNo=" + pageNo + ", mall_name=" + mall_name + "]";
	}
	
}
