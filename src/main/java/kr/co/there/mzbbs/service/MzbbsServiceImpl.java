package kr.co.there.mzbbs.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.mzbbs.model.MzbbsDao;
import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.place.model.PlaceDao;

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
	public boolean add(MzbbsVo mzbean) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.insertOne(mzbean)>0;
		}
	}

	@Override
	public boolean edit(MzbbsVo mzbean) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.updateOne(mzbean)>0 ? true:false;
		}
	}

	@Override
	public boolean remove(int param) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				MzbbsDao mzbbsDao=sqlSession.getMapper(MzbbsDao.class);
				return mzbbsDao.deleteOne(param)>0 ? true:false;
		}
	}

}
