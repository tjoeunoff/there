package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface MemberService {
	//admin 페이지에 회원 리스트
	List<MemberVo> list() throws SQLException;
	
	//home 페이지
	MemberVo One(String param) throws SQLException; //마이페이지 개인정보 조회
	boolean add(MemberVo bean) throws SQLException; //회원가입
	boolean edit(MemberVo bean) throws SQLException; //마이페이지 개인정보 수정
	boolean remove(String param) throws SQLException; //마이페이지 회원 탈퇴
	
	List<MzbbsVo> myMzList(String member_id) throws SQLException; //마이페이지  매거진 좋아요 누른 리스트 
	List<PlaceVo> myPlList(String member_id) throws SQLException; //마이페이지  플레이스 좋아요 누른 리스트
	List<ReviewVo> myRvList(String member_id) throws SQLException; //마이페이지 작성한 리뷰 리스트
	
	//로그인
	int isLogin(String member_id, String member_pw) throws SQLException; //0: 로그인 실패, 1: 로그인 성공, 2: 탈퇴한 아이디의 로그인 시도
	
	//회원가입 시 중복 체크에 호출할 메서드들
	boolean isIdUnique(String member_id) throws SQLException; //겹쳐지지 않은 아이디일 경우 true 반환
	boolean isEmailUnique(String member_email) throws SQLException; //겹쳐지지 않은 전화번호일 경우 true 반환
	boolean isTelUnique(String member_tel) throws SQLException; //겹쳐지지 않은 이메일일 경우 true 반환
	
	//아이디 찾기에 사용할 메서드
	String getId(String member_name,String member_tel) throws SQLException;
	//비밀번호 찾기에 호출할 메서드
	String getPwans(String member_id,String member_tel) throws SQLException;
	
	//정보 수정 시 중복 체크에 호출할 메서드들
	boolean isNewEmailUnique(String member_id,String member_email) throws SQLException;
	boolean isNewTelUnique(String member_id,String member_email) throws SQLException;
	
	//대체 비밀번호 교체
	boolean updatePwans(String member_id) throws SQLException;
	
	//재가입
	boolean rejoin(String member_id,String member_pw) throws SQLException;
}