package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.member.model.MemberDao;
import kr.co.there.member.model.entity.MemberVo;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	@Override
	public List<MemberVo> list() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.selectAll();
		}
	}

	@Override
	public MemberVo One(int param) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(MemberVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean edit(MemberVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int param) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
