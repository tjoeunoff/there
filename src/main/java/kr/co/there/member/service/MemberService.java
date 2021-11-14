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
}
