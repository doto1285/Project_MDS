package kr.ac.sungkyul.MDS.vo;

public class JoinMallVo {
	private String member_no;
	private String mall_no;

	public String getMember_no() {
		return member_no;
	}

	public void setMember_no(String member_no) {
		this.member_no = member_no;
	}

	public String getMall_no() {
		return mall_no;
	}

	public void setMall_no(String mall_no) {
		this.mall_no = mall_no;
	}

	@Override
	public String toString() {
		return "joinmall [member_no=" + member_no + ", mall_no=" + mall_no + "]";
	}

}
