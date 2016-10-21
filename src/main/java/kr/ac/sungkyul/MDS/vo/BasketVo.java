package kr.ac.sungkyul.MDS.vo;

public class BasketVo {

	private int basket_no;
	private int basket_count;
	private int product_no;
	private int productoprion_no;
	private int member_no;
	private int mall_no;
	
	
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
	public int getProductoprion_no() {
		return productoprion_no;
	}
	public void setProductoprion_no(int productoprion_no) {
		this.productoprion_no = productoprion_no;
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
	@Override
	public String toString() {
		return "BasketVo [basket_no=" + basket_no + ", basket_count=" + basket_count + ", product_no=" + product_no
				+ ", productoprion_no=" + productoprion_no + ", member_no=" + member_no + ", mall_no=" + mall_no + "]";
	}
	
	
}
