package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.place.model.PlaceDao;
import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

@Service
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	SqlSessionFactory sqlSessionFactory;


	@Override
	public List<PlaceVo> list() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.selectAll();
			}
	}

	@Override
	public PlaceVo One(int param, boolean addViewCnt) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				if(addViewCnt) placeDao.updateViewCnt(param);
				
				return placeDao.selectOne(param);
		}
	}

	@Override
	public boolean add(PlaceVo bean) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				placeDao.insertOne(bean);
				return true;
		}
	}

	@Override
	public boolean edit(PlaceVo bean) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				placeDao.updateOne(bean);
				return true;
		}
	}

	@Override
	public boolean remove(int param) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				placeDao.deleteOne(param);
				return true;
		}
	}

	@Override
	public List<ReviewVo> reviewList() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.selectReviewAll();
			}
	}

	@Override
	public boolean addReveiw(ReviewVo bean) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				placeDao.insertReview(bean);
				return true;
		}
	}

	@Override
	public List<HashMap> OneIncludeReview(int param, boolean addViewCnt) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				if(addViewCnt) placeDao.updateViewCnt(param);	
				
				HashMap<Integer, PlaceVo> placeVo = new HashMap<>();
				HashMap<Integer, List<ReviewVo>> listReviewVo = new HashMap<>();
				List<HashMap> list = new ArrayList<>();
				
				placeVo.put(param, placeDao.selectOne(param));
				list.add(placeVo);
				
				listReviewVo.put(param, placeDao.selectReviewbyPlace(param));	
				list.add(listReviewVo);
				
				return list;
		}
	}





}
