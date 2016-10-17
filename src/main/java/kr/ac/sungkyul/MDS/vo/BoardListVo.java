package kr.ac.sungkyul.MDS.vo;

public class BoardListVo {

	private int boardlist_no;
	private String boardlist_name;
	private int boardlist_state;
	private int mall_no;
	private int boardlist_write_accessright;
	private int boardlist_read_accessright;
	private String userid;
	private int board_orderno;

	public int getMall_no() {
		return mall_no;
	}

	public void setMall_no(int mall_no) {
		this.mall_no = mall_no;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getBoardlist_no() {
		return boardlist_no;
	}

	public void setBoardlist_no(int boardlist_no) {
		this.boardlist_no = boardlist_no;
	}

	public String getBoardlist_name() {
		return boardlist_name;
	}

	public void setBoardlist_name(String boardlist_name) {
		this.boardlist_name = boardlist_name;
	}

	public int getBoardlist_state() {
		return boardlist_state;
	}

	public void setBoardlist_state(int boardlist_state) {
		this.boardlist_state = boardlist_state;
	}

	public int getBoardlist_write_accessright() {
		return boardlist_write_accessright;
	}

	public void setBoardlist_write_accessright(int boardlist_write_accessright) {
		this.boardlist_write_accessright = boardlist_write_accessright;
	}

	public int getBoardlist_read_accessright() {
		return boardlist_read_accessright;
	}

	public void setBoardlist_read_accessright(int boardlist_read_accessright) {
		this.boardlist_read_accessright = boardlist_read_accessright;
	}

	public int getBoard_orderno() {
		return board_orderno;
	}

	public void setBoard_orderno(int board_orderno) {
		this.board_orderno = board_orderno;
	}

	@Override
	public String toString() {
		return "BoardListVo [boardlist_no=" + boardlist_no + ", boardlist_name=" + boardlist_name + ", boardlist_state="
				+ boardlist_state + ", mall_no=" + mall_no + ", boardlist_write_accessright="
				+ boardlist_write_accessright + ", boardlist_read_accessright=" + boardlist_read_accessright
				+ ", userid=" + userid + ", board_orderno=" + board_orderno + "]";
	}

	
	
	

}
