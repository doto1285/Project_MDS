package kr.ac.sungkyul.MDS.vo;

public class MemberVo {

	private int member_no;
	private String member_id;
	private String member_password;
	private String member_name;
	private String member_email;
	private String member_birth ="";
	private String member_phone;
	private String member_address;
	private String member_joindate;
	private String member_licensee ="";
	private int member_distinction;
	private int member_state;
	private String rnum;
 

	
	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_password() {
		return member_password;
	}

	public void setMember_password(String member_password) {
		this.member_password = member_password;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_birth() {
		return member_birth;
	}

	public void setMember_birth(String member_birth) {
		this.member_birth = member_birth;
	}

	public String getMember_phone() {
		return member_phone;
	}

	public void setMember_phone(String member_phone) {
		this.member_phone = member_phone;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public String getMember_joindate() {
		return member_joindate;
	}

	public void setMember_joindate(String member_joindate) {
		this.member_joindate = member_joindate;
	}

	public String getMember_licensee() {
		return member_licensee;
	}

	public void setMember_licensee(String member_licensee) {
		this.member_licensee = member_licensee;
	}

	public int getMember_distinction() {
		return member_distinction;
	}

	public void setMember_distinction(int member_distinction) {
		this.member_distinction = member_distinction;
	}

	public int getMember_state() {
		return member_state;
	}

	public void setMember_state(int member_state) {
		this.member_state = member_state;
	}

	@Override
	public String toString() {
		return "MemberVo [member_no=" + member_no + ", member_id=" + member_id + ", member_password=" + member_password
				+ ", member_name=" + member_name + ", member_email=" + member_email + ", member_birth=" + member_birth
				+ ", member_phone=" + member_phone + ", member_address=" + member_address + ", member_joindate="
				+ member_joindate + ", member_licensee=" + member_licensee + ", member_distinction="
				+ member_distinction + ", member_state=" + member_state + ", rnum=" + rnum + "]";
	}


	

}
