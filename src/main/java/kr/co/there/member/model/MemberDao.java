package kr.co.there.member.model;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.member.model.entity.MemberVo;

public interface MemberDao {
	List<MemberVo> selectAll() throws SQLException;
	MemberVo selectOne(int member_idx) throws SQLException;
	int insertOne(MemberVo mbrbean) throws SQLException;
	int updateOne(MemberVo mbrbean) throws SQLException;
	int deleteOne(int member_idx) throws SQLException;
}
