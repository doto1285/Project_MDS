package kr.ac.sungkyul.MDS.vo;

public class ProductOptionVo {

	private int productoption_no;
	private String productoption_color;
	private String productoption_size;
	private int productoption_stock;
	private int product_no;
	public int getProductoption_no() {
		return productoption_no;
	}
	public void setProductoption_no(int productoption_no) {
		this.productoption_no = productoption_no;
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
	public int getProductoption_stock() {
		return productoption_stock;
	}
	public void setProductoption_stock(int productoption_stock) {
		this.productoption_stock = productoption_stock;
	}
	public int getProduct_no() {
		return product_no;
	}
	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}
	@Override
	public String toString() {
		return "ProductOptionVo [productoption_no=" + productoption_no + ", productoption_color=" + productoption_color
				+ ", productoption_size=" + productoption_size + ", productoption_stock=" + productoption_stock
				+ ", product_no=" + product_no + "]";
	}
	
}
