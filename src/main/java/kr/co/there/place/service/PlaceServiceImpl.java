package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.mzbbs.model.MzbbsDao;
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

	@Override
	public int selectMaxIdx() throws SQLException {
		try(
				SqlSession sqlSession = sqlSessionFactory.openSession();
			){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.selectMaxIdx();
		}
	}
	

	@Override
	public boolean hasLiked(String member_id, int place_idx) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.hasLiked(member_id, place_idx) != 0;
		}
	}

	@Override
	public boolean clickLike(String member_id, int place_idx) throws SQLException {
		boolean hasLiked=hasLiked(member_id,place_idx); //지금 좋아요를 누른 상태인지 점검
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				if(hasLiked) {
					placeDao.likeSub(member_id, place_idx);
					return false; //좋아요를 취소하는 경우 false 반환
				}
				else {
					placeDao.likeAdd(member_id, place_idx);
					return true; //좋아요를 추가하는 경우 true 반환
				}	
		}
	}

	@Override
	public boolean hasReview(String member_id, int place_idx) throws SQLException {
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				return placeDao.hasReview(member_id, place_idx) != 0;
		}
	}

	@Override
	public HashMap<String, Integer> selectIdx(int param) throws SQLException {
		List<Integer> idxList;
		HashMap<String, Integer> map = new HashMap<>();
		
		try(
				SqlSession sqlSession=sqlSessionFactory.openSession();
				){
				PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
				idxList = placeDao.selectIdx();
				
				int num = idxList.indexOf(param);				// 내가 list에서 몇번째 글인지 순서
				int firstIdx = idxList.get(0);					// 맨앞글의 글번호
				int lastIdx = idxList.get(idxList.size()-1);	// 맨뒤글의 글번호
				
				if(num == 0) {map.put("prevIdx", lastIdx);} 				// 맨 처음 글일때 이전글 설정
				else {map.put("prevIdx", idxList.get(num-1));}
				
				if(num == idxList.size()-1) {map.put("nextIdx", firstIdx);} // 맨 마지막 글일때 다음글 설정
				else {map.put("nextIdx", idxList.get(num+1));}
				
				return map;
		}
	}


}
