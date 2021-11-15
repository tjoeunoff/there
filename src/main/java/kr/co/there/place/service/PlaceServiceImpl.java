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
	public HashMap<String, Object> One(int param, boolean addViewCnt, boolean showReview) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				if(addViewCnt) placeDao.updateViewCnt(param);
	
				HashMap<String, Object> map = new HashMap<>();
				map.put("likeCnt", placeDao.countLike(param));
				map.put("reviewCnt", placeDao.countReview(param));
				map.put("placeInfo", placeDao.selectOne(param));
				
				double scoreAvg = placeDao.avgScore(param);
				scoreAvg = Math.round(scoreAvg*10) / 10.0;
				map.put("scoreAvg", scoreAvg);
				
				if(showReview) map.put("reviewList", placeDao.selectReviewbyPlace(param));
				
				return map;
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


	public HashMap<String, Object> OneIncludeReview(int param, boolean addViewCnt) throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				if(addViewCnt) placeDao.updateViewCnt(param);
				
				HashMap<String, Object> map = new HashMap<>();
				map.put("likeCnt", placeDao.countLike(param));
				map.put("reviewCnt", placeDao.countReview(param));
				map.put("placeInfo", placeDao.selectOne(param));
				map.put("reviewList", placeDao.selectReviewbyPlace(param));
				map.put("scoreAvg", placeDao.avgScore(param));
				
				return map;
		}
	}


	@Override
	public List<PlaceVo> listHome() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.selectAllHome();
			}
	}

	@Override
	public List<PlaceVo> listOrderBylikes() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.orderBylikes();
			}
	}





}
