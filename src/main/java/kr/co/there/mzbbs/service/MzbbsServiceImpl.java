package kr.co.there.mzbbs.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.mzbbs.model.MzbbsDao;
import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.model.entity.MzlikesStatVo;

@Service
public class MzbbsServiceImpl implements MzbbsService {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	@Override
	public List<MzbbsVo> list() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
					){
				MzbbsDao mzbbsDao = sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.selectAll();
			}
	}

	@Override
	public MzbbsVo one(int param, boolean addViewCnt) throws SQLException {
		if(addViewCnt) {
			try(
					SqlSession sqlSession=sqlSessionFactory.openSession();
					){
					MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
					mzbbsDao.updateViewcnt(param);
					return mzbbsDao.selectOne(param);
			}
		} //조회수를 1 증가시키고 반환
		else {
			try(
					SqlSession sqlSession=sqlSessionFactory.openSession();
					){
					MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
					//mzbbsDao.updateViewcnt(param);
					return mzbbsDao.selectOne(param);
			}
		} //조회수를 증가시키지 않고 반환
	}
	
	@Override
	public int numLikes(int param) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.numLikes(param);
		}
	}
	
	@Override
	public Map<Integer,Integer> numLikesMap() throws SQLException{ //전 메거진의 좋아요 수를 헤아려서 반환하는 메서드
		List<MzlikesStatVo> list;
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				list=mzbbsDao.numLikesList();
		}
		Map<Integer,Integer> map=new HashMap<>();
		for(int i=0;i<list.size();i++)
			map.put(list.get(i).getMagazine_idx(), list.get(i).getNumlikes());
		return map;
	}
	
	@Override
	public int prevIdx(int param) throws SQLException {
		List<Integer> idxList;
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				idxList=mzbbsDao.selectIdx();
		}
		int position=idxList.indexOf(param);
		if(position==-1) return -1; //if there is no "param" in the idxList
		if(position==0) return -1; //if the "param" is the very first element in the idxList
		return idxList.get(position-1);
	}
	
	@Override
	public int nextIdx(int param) throws SQLException {
		List<Integer> idxList;
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				idxList=mzbbsDao.selectIdx();
		}
		int position=idxList.indexOf(param);
		if(position==-1) return -1; //if there is no "param" in the idxList
		if(position==idxList.size()-1) return -1; //if the "param" is the very last element in the idxList
		return idxList.get(position+1);
	}
	
	@Override
	public int oldestIdx(int param) throws SQLException {
		List<Integer> idxList;
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				idxList=mzbbsDao.selectIdx();
		}
		return idxList.get(idxList.size()-1);
	}
	
	@Override
	public int newestIdx(int param) throws SQLException {
		List<Integer> idxList;
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				idxList=mzbbsDao.selectIdx();
		}
		return idxList.get(0);
	}
	
	@Override
	public boolean hasLiked(String member_id, int magazine_idx) throws SQLException { //해당 회원이 해당 매거진에 좋아요를 눌렀는지 확인하는 메서드
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.hasLiked(member_id, magazine_idx)!=0;
		}
	}
	
	@Override
	public boolean clickLike(String member_id, int magazine_idx) throws SQLException {
		boolean hasLiked=hasLiked(member_id,magazine_idx); //지금 좋아요를 누른 상태인지 점검
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				if(hasLiked) {
					mzbbsDao.likeSub(member_id, magazine_idx);
					return false; //좋아요를 취소하는 경우 false 반환
				}
				else {
					mzbbsDao.likeAdd(member_id, magazine_idx);
					return true; //좋아요를 추가하는 경우 true 반환
				}	
		}
	}

	@Override
	public boolean add(MzbbsVo mzbean) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.insertOne(mzbean)>0;
		}
	}

	@Override
	public boolean edit(MzbbsVo mzbean,boolean doesThumbChange) throws SQLException {
		if(doesThumbChange) {
			try(
					SqlSession sqlSession=sqlSessionFactory.openSession();
					){
					MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
					return mzbbsDao.updateOne(mzbean)>0;
			}
		} //섬네일이 변경되는 경우
		else {
			try(
					SqlSession sqlSession=sqlSessionFactory.openSession();
					){
					MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
					return mzbbsDao.updateOneWithoutThumb(mzbean)>0;
			}
		} //섬네일이 유지되는 경우
	}

	@Override
	public boolean remove(int param) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.deleteOne(param)>0;
		}
	}

}
