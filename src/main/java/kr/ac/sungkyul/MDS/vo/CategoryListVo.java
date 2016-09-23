package kr.ac.sungkyul.MDS.vo;

public class CategoryListVo {
	private int categorylist_no;
	private String categorylist_name;
	private int categorylist_group;
	private int categorylist_orderno;
	private int categorylist_depth;
	private int categorylist_state;
	private int mall_no;
	
	public int getCategorylist_no() {
		return categorylist_no;
	}
	public void setCategorylist_no(int categorylist_no) {
		this.categorylist_no = categorylist_no;
	}
	public String getCategorylist_name() {
		return categorylist_name;
	}
	public void setCategorylist_name(String categorylist_name) {
		this.categorylist_name = categorylist_name;
	}
	public int getCategorylist_group() {
		return categorylist_group;
	}
	public void setCategorylist_group(int categorylist_group) {
		this.categorylist_group = categorylist_group;
	}
	public int getCategorylist_orderno() {
		return categorylist_orderno;
	}
	public void setCategorylist_orderno(int categorylist_orderno) {
		this.categorylist_orderno = categorylist_orderno;
	}
	public int getCategorylist_depth() {
		return categorylist_depth;
	}
	public void setCategorylist_depth(int categorylist_depth) {
		this.categorylist_depth = categorylist_depth;
	}
	public int getCategorylist_state() {
		return categorylist_state;
	}
	public void setCategorylist_state(int categorylist_state) {
		this.categorylist_state = categorylist_state;
	}
	public int getMall_no() {
		return mall_no;
	}
	public void setMall_no(int mall_no) {
		this.mall_no = mall_no;
	}
	@Override
	public String toString() {
		return "CategoryListVo [categorylist_no=" + categorylist_no + ", categorylist_name=" + categorylist_name
				+ ", categorylist_group=" + categorylist_group + ", categorylist_orderno=" + categorylist_orderno
				+ ", categorylist_depth=" + categorylist_depth + ", categorylist_state=" + categorylist_state
				+ ", mall_no=" + mall_no + "]";
	}
}
