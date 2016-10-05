package kr.ac.sungkyul.MDS.vo;

public class BoardVo {

	private int board_no;
	private String board_title;
	private String board_password;
	private String board_content;
	private int board_hit;
	private int board_group;
	private int board_orderno;
	private int board_depth;
	private String board_date;
	private int board_state;
	private int boardlist_no;
	private int member_no;
	private String name;
	private String rnum;
	

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_password() {
		return board_password;
	}

	public void setBoard_password(String board_password) {
		this.board_password = board_password;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public int getBoard_hit() {
		return board_hit;
	}

	public void setBoard_hit(int board_hit) {
		this.board_hit = board_hit;
	}

	public int getBoard_group() {
		return board_group;
	}

	public void setBoard_group(int board_group) {
		this.board_group = board_group;
	}

	public int getBoard_orderno() {
		return board_orderno;
	}

	public void setBoard_orderno(int board_orderno) {
		this.board_orderno = board_orderno;
	}

	public int getBoard_depth() {
		return board_depth;
	}

	public void setBoard_depth(int board_depth) {
		this.board_depth = board_depth;
	}

	public String getBoard_date() {
		return board_date;
	}

	public void setBoard_date(String board_date) {
		this.board_date = board_date;
	}

	public int getBoard_state() {
		return board_state;
	}

	public void setBoard_state(int board_state) {
		this.board_state = board_state;
	}

	public int getBoardlist_no() {
		return boardlist_no;
	}

	public void setBoardlist_no(int boardlist_no) {
		this.boardlist_no = boardlist_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
	
	

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	@Override
	public String toString() {
		return "BoardVo [board_no=" + board_no + ", board_title=" + board_title + ", board_password=" + board_password
				+ ", board_content=" + board_content + ", board_hit=" + board_hit + ", board_group=" + board_group
				+ ", board_orderno=" + board_orderno + ", board_depth=" + board_depth + ", board_date=" + board_date
				+ ", board_state=" + board_state + ", boardlist_no=" + boardlist_no + ", member_no=" + member_no
				+ ", name=" + name + "]";
	}
}
