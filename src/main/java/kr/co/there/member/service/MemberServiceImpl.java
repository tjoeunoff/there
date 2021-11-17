package kr.co.there.member.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.member.model.MemberDao;
import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.mzbbs.model.MzbbsDao;
import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.place.model.PlaceDao;
import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;


@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	SqlSessionFactory sqlSessionFactory;
	
	private static String randomString() {
		char[] available = new char[] { 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n',
				'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z', 'A', 'B', 'C', 'D', 'E', 'F', 'G',
				'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z',
				'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '!', '#', '$', '%', '^', '&', '*', '-', '_' };
		String result = "";
		for (int i = 0; i < 12; i++) {
			result += available[(int) (Math.random() * available.length)];
		}
		return result;
	}

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
				bean.setMember_pwans(randomString());
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
		List<MzbbsVo> mzList=new ArrayList<>();
		List<Integer> mzIdxList=new ArrayList<>();
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				mzIdxList=memberDao.myMzIdxList(member_id);
		}
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao = sqlSession.getMapper(MzbbsDao.class);
				for(int i=0;i<mzIdxList.size();i++) {
					mzList.add(mzbbsDao.selectOne(mzIdxList.get(i)));
				}
		}
		return mzList;
	}
	
	@Override
	public List<PlaceVo> myPlList(String member_id) throws SQLException {
		List<PlaceVo> plList=new ArrayList<>();
		List<Integer> plIdxList=new ArrayList<>();
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				plIdxList=memberDao.myPlIdxList(member_id);
		}
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				for(int i=0;i<plIdxList.size();i++) {
					plList.add(placeDao.selectOne(plIdxList.get(i)));
				}
		}
		return plList;
	}
	
	@Override
	public List<ReviewVo> myRvList(String member_id) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.myRvList(member_id);
		}
	}
	
	@Override
	public boolean isIdUnique(String member_id) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.isIdDuplicate(member_id)==0;
		}
	}
	
	@Override
	public boolean isEmailUnique(String member_email) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.isEmailDuplicate(member_email)==0;
		}
	}
	
	@Override
	public boolean isTelUnique(String member_tel) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.isTelDuplicate(member_tel)==0;
		}
	}

	@Override
	public int isLogin(String member_id, String member_pw) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				MemberVo bean = memberDao.selectOne(member_id);
				if(bean == null) { //없는 아이디
					return 0;
				}
				else {
					if(member_pw.equals(bean.getMember_pw())) {
						return bean.getMember_state()==0?1:2; //정상 상태이면 정상 로그인, 탈퇴 상태이면 재가입 확인
					}
					else if(member_pw.equals(bean.getMember_pwans())) {
						this.updatePwans(member_id);
						return bean.getMember_state()==0?1:2; //정상 상태이면 정상 로그인, 탈퇴 상태이면 재가입 확인
					}
					else return 0; //일치하지 않는 비밀번호
				}
		}
	}
	
	@Override
	public String getId(String member_name, String member_tel) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.getId(member_name, member_tel);
		}
	}
	
	@Override
	public String getPwans(String member_id, String member_tel) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.getPwans(member_id, member_tel);
		}
	}
	
	@Override
	public boolean isNewEmailUnique(String member_id, String member_email) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.isNewEmailDuplicate(member_id, member_email)==0;
		}
	}
	
	@Override
	public boolean isNewTelUnique(String member_id, String member_email) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.isNewTelDuplicate(member_id, member_email)==0;
		}
	}
	
	@Override
	public boolean updatePwans(String member_id) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.updatePwans(member_id, randomString())>0;
		}
	}
	
	@Override
	public boolean rejoin(String member_id,String member_pw) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
				){
				MemberDao memberDao = sqlSession.getMapper(MemberDao.class);
				return memberDao.rejoin(member_id,member_pw)>0;
		}
	}

}