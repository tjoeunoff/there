package kr.co.there.member.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;

public interface MemberDao {
	List<MemberVo> selectAll() throws SQLException;
	MemberVo selectOne(String member_id) throws SQLException;
	int insertOne(MemberVo mbrbean) throws SQLException;
	int updateOne(MemberVo mbrbean) throws SQLException;
	int deleteOne(String member_id) throws SQLException;
	List<MzbbsVo> myMzList(String member_id) throws SQLException;
	
	//회원가입 시 중복 체크에 사용할 메서드들
	int isIdDuplicate(String member_id) throws SQLException; //겹쳐지지 않은 아이디일 경우 0 반환
	int isEmailDuplicate(String member_tel) throws SQLException; //겹쳐지지 않은 전화번호일 경우 0 반환
	int isTelDuplicate(String member_email) throws SQLException; //겹쳐지지 않은 이메일일 경우 0 반환
	
	//아이디 찾기에 사용할 메서드
	String getId(@Param("member_name") String member_name,@Param("member_tel")String member_tel) throws SQLException; //아이디 반환
	//비밀번호 찾기에 사용할 메서드
	String getPwans(@Param("member_id") String member_id, @Param("member_tel")String member_tel) throws SQLException; //대체 비밀번호 반환
	
}