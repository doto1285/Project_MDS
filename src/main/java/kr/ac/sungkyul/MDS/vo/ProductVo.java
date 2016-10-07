package kr.ac.sungkyul.MDS.vo;

public class ProductVo {
	private int product_no;
	private String product_name;
	private int product_price;
	private String product_content;
	private String product_maker;
	private String product_makedate;
	private int product_state;
	private int member_no;
	private int categorylist_no;

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

	@Override
	public String toString() {
		return "ProductVo [product_no=" + product_no + ", product_name=" + product_name + ", product_price="
				+ product_price + ", product_content=" + product_content + ", product_maker=" + product_maker
				+ ", product_makedate=" + product_makedate + ", product_state=" + product_state + ", member_no="
				+ member_no + ", categorylist_no=" + categorylist_no + "]";
	}

}
