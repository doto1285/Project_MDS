package kr.ac.sungkyul.MDS.vo;

public class MallimgVo {
	
	private int mallimg_no;
	private String mallimg_filename;
	private String mallimg_savename;
	private int mallimg_flag;
	private int mall_no;
	private String mallimg_path;
	private long mallimg_fileSize;
	private String mallimg_image;
	
	
	public int getMallimg_no() {
		return mallimg_no;
	}
	public void setMallimg_no(int mallimg_no) {
		this.mallimg_no = mallimg_no;
	}
	public int getMallimg_flag() {
		return mallimg_flag;
	}
	public void setMallimg_flag(int mallimg_flag) {
		this.mallimg_flag = mallimg_flag;
	}
	public String getMallimg_filename() {
		return mallimg_filename;
	}
	public void setMallimg_filename(String mallimg_filename) {
		this.mallimg_filename = mallimg_filename;
	}
	public String getMallimg_savename() {
		return mallimg_savename;
	}
	public void setMallimg_savename(String mallimg_savename) {
		this.mallimg_savename = mallimg_savename;
	}
	public String getMallimg_path() {
		return mallimg_path;
	}
	public void setMallimg_path(String mallimg_path) {
		this.mallimg_path = mallimg_path;
	}
	public int getMall_no() {
		return mall_no;
	}
	public void setMall_no(int mall_no) {
		this.mall_no = mall_no;
	}
	public long getMallimg_fileSize() {
		return mallimg_fileSize;
	}
	public void setMallimg_fileSize(long mallimg_fileSize) {
		this.mallimg_fileSize = mallimg_fileSize;
	}
	public String getMallimg_image() {
		return mallimg_image;
	}
	public void setMallimg_image(String mallimg_image) {
		this.mallimg_image = mallimg_image;
	}
	@Override
	public String toString() {
		return "MallimgVo [mallimg_no=" + mallimg_no + ", mallimg_filename=" + mallimg_filename + ", mallimg_savename="
				+ mallimg_savename + ", mallimg_flag=" + mallimg_flag + ", mall_no=" + mall_no + ", mallimg_path="
				+ mallimg_path + ", mallimg_fileSize=" + mallimg_fileSize + ", mallimg_image=" + mallimg_image + "]";
	}
	
	
}
