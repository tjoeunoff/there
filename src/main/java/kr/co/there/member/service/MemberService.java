package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;

public interface MemberService {
	List<MemberVo> list() throws SQLException;
	MemberVo One(String param) throws SQLException;
	boolean add(MemberVo bean) throws SQLException;
	boolean edit(MemberVo bean) throws SQLException;
	boolean remove(String param) throws SQLException;
	List<MzbbsVo> myMzList(String member_id) throws SQLException;
	
	//로그인
	boolean isLogin(String member_id, String member_pw) throws SQLException;
	
	//회원가입 시 중복 체크에 호출할 메서드들
	boolean isIdUnique(String member_id) throws SQLException; //겹쳐지지 않은 아이디일 경우 true 반환
	boolean isEmailUnique(String member_email) throws SQLException; //겹쳐지지 않은 전화번호일 경우 true 반환
	boolean isTelUnique(String member_tel) throws SQLException; //겹쳐지지 않은 이메일일 경우 true 반환
}