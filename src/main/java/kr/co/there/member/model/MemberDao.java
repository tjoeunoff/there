package kr.co.there.member.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface MemberDao {
	//admin페이지 리스트
	List<MemberVo> selectAll() throws SQLException;
	
	//home페이지
	MemberVo selectOne(String member_id) throws SQLException; //마이페이지에 정보 조회/수정시
	int insertOne(MemberVo mbrbean) throws SQLException; //회원가입
	int updateOne(MemberVo mbrbean) throws SQLException; //마이페이지에 정보 수정(초기값 필요)
	int deleteOne(String member_id) throws SQLException; //마이페이지에 탈퇴
	
	List<Integer> myMzIdxList(String member_id) throws SQLException; //마이페이지에 매거진 좋아요 누른 리스트
	List<Integer> myPlIdxList(String member_id) throws SQLException; //마이페이지에 플레이스 좋아요 누른 리스트
	List<ReviewVo> myRvList(String member_id) throws SQLException; //마이페이지에 남긴 리뷰 리스트
	
	//회원가입 시 중복 체크에 사용할 메서드들
	int isIdDuplicate(String member_id) throws SQLException; //겹쳐지지 않은 아이디일 경우 0 반환
	int isEmailDuplicate(String member_email) throws SQLException; //겹쳐지지 않은 이메일일 경우 0 반환
	int isTelDuplicate(String member_tel) throws SQLException; //겹쳐지지 않은 전화번호일 경우 0 반환
	
	//아이디 찾기에 사용할 메서드
	String getId(@Param("member_name") String member_name,@Param("member_tel")String member_tel) throws SQLException; //아이디 반환
	//비밀번호 찾기에 사용할 메서드
	String getPwans(@Param("member_id") String member_id,@Param("member_tel")String member_tel) throws SQLException; //대체 비밀번호 반환
	
	//정보 수정 시 중복 체크에 사용할 메서드들
	int isNewEmailDuplicate(@Param("member_id") String member_id,@Param("member_email") String member_email) throws SQLException; // 모달 창에 입력한 이메일이 사용가능할 경우 0 반환
	int isNewTelDuplicate(@Param("member_id") String member_id,@Param("member_tel") String member_tel) throws SQLException; // 모달 창에 입력한 전화번호가 사용가능할 경우 0 반환
	
	//대체 비밀번호 교체
	int updatePwans(@Param("member_id") String member_id,@Param("member_pwans") String member_pwans) throws SQLException;
	
	//재가입
	int rejoin(@Param("member_id") String member_id,@Param("member_pw") String member_pw) throws SQLException;
}