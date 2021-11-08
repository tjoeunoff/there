package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.member.model.entity.MemberVo;

public interface MemberService {
	List<MemberVo> list() throws SQLException;
	MemberVo One(int param) throws SQLException;
	boolean add(MemberVo bean) throws SQLException;
	boolean edit(MemberVo bean) throws SQLException;
	boolean remove(int param) throws SQLException;	
}
