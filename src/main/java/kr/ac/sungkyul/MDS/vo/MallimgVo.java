package kr.ac.sungkyul.MDS.vo;

public class MallimgVo {
	
	private int mallimg_no;
	private int mallimg_flag;
	private String mallimg_filename;
	private String mallimg_savename;
	private String mallimg_path;
	private long fileSize;
	private int mall_no;
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
	public long getFileSize() {
		return fileSize;
	}
	public void setFileSize(long fileSize) {
		this.fileSize = fileSize;
	}
	public int getMall_no() {
		return mall_no;
	}
	public void setMall_no(int mall_no) {
		this.mall_no = mall_no;
	}
	@Override
	public String toString() {
		return "MallimgVo [mallimg_no=" + mallimg_no + ", mallimg_flag=" + mallimg_flag + ", mallimg_filename="
				+ mallimg_filename + ", mallimg_savename=" + mallimg_savename + ", mallimg_path=" + mallimg_path
				+ ", fileSize=" + fileSize + ", mall_no=" + mall_no + "]";
	}
}
