package kr.co.there.member.model.entity;

import java.util.Date;
import java.util.Objects;

public class MemberVo {
	private String member_id;
	private String member_pw;
	private String member_name;
	private int member_authid;
	private String member_pwans; //대체 비밀번호
	private String member_tel;
	private String member_email;
	private Date member_registdate;
	private int member_state; //회원 상태(0:정상, 1:탈퇴)
	private int member_idx;
	
	public MemberVo() {}

	public MemberVo(String member_id, String member_pw, String member_name, int member_authid, String member_pwans,
			String member_tel, String member_email, Date member_registdate, int member_state, int member_idx) {
		super();
		this.member_id = member_id;
		this.member_pw = member_pw;
		this.member_name = member_name;
		this.member_authid = member_authid;
		this.member_pwans = member_pwans;
		this.member_tel = member_tel;
		this.member_email = member_email;
		this.member_registdate = member_registdate;
		this.member_state = member_state;
		this.member_idx = member_idx;
	}

	public String getMember_id() {
		return member_id;
	}

	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_name() {
		return member_name;
	}

	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}

	public int getMember_authid() {
		return member_authid;
	}

	public void setMember_authid(int member_authid) {
		this.member_authid = member_authid;
	}

	public String getMember_pwans() {
		return member_pwans;
	}

	public void setMember_pwans(String member_pwans) {
		this.member_pwans = member_pwans;
	}

	public String getMember_tel() {
		return member_tel;
	}

	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public Date getMember_registdate() {
		return member_registdate;
	}

	public void setMember_registdate(Date member_registdate) {
		this.member_registdate = member_registdate;
	}

	public int getMember_state() {
		return member_state;
	}

	public void setMember_state(int member_state) {
		this.member_state = member_state;
	}

	public int getMember_idx() {
		return member_idx;
	}

	public void setMember_idx(int member_idx) {
		this.member_idx = member_idx;
	}

	@Override
	public String toString() {
		return "MemberVo [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_authid=" + member_authid + ", member_pwans=" + member_pwans + ", member_tel=" + member_tel
				+ ", member_email=" + member_email + ", member_registdate=" + member_registdate + ", member_state="
				+ member_state + ", member_idx=" + member_idx + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(member_authid, member_email, member_id, member_idx, member_name, member_pw, member_pwans,
				member_registdate, member_state, member_tel);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVo other = (MemberVo) obj;
		return member_authid == other.member_authid && Objects.equals(member_email, other.member_email)
				&& Objects.equals(member_id, other.member_id) && member_idx == other.member_idx
				&& Objects.equals(member_name, other.member_name) && Objects.equals(member_pw, other.member_pw)
				&& Objects.equals(member_pwans, other.member_pwans)
				&& Objects.equals(member_registdate, other.member_registdate) && member_state == other.member_state
				&& Objects.equals(member_tel, other.member_tel);
	}
	
	
}

