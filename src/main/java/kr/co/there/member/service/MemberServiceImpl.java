package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.member.model.MemberDao;
import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.entity.MzbbsVo;


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
	public MemberVo One(String param) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.selectOne(param);
		}
	}

	@Override
	public boolean add(MemberVo bean) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				char[] available = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
						'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
						'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
						'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#', '$', '%', '^', '&', '*', '-', '_' };
				String pass = "";
				for (int i = 0; i < 12; i++) {
					pass += available[(int) (Math.random() * available.length)];
				}
				bean.setMember_pwans(pass);
				return memberDao.insertOne(bean)>0;
		}
	}

	@Override
	public boolean edit(MemberVo bean) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.updateOne(bean)>0;
		}
	}

	@Override
	public boolean remove(String param) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.deleteOne(param)>0;
		}
	}

	@Override
	public List<MzbbsVo> myMzList(String member_id) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.myMzList(member_id);
		}
	}

}