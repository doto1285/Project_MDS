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
	@Override
	public String toString() {
		return "OrderinfoVo [orderinfo_no=" + orderinfo_no + ", orderinfo_count=" + orderinfo_count
				+ ", orderinfo_price=" + orderinfo_price + ", orderinfo_address=" + orderinfo_address
				+ ", orderinfo_date=" + orderinfo_date + ", orderinfo_state=" + orderinfo_state + ", product_no="
				+ product_no + ", member_no=" + member_no + ", productoption_no=" + productoption_no + ", mall_no="
				+ mall_no + "]";
	}

	

}
