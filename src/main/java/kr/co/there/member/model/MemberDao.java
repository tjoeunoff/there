package kr.co.there.member.model;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;

public interface MemberDao {
	List<MemberVo> selectAll() throws SQLException;
	MemberVo selectOne(String member_id) throws SQLException;
	int insertOne(MemberVo mbrbean) throws SQLException;
	int updateOne(MemberVo mbrbean) throws SQLException;
	int deleteOne(String member_id) throws SQLException;
	List<MzbbsVo> myMzList(String member_id) throws SQLException;
}