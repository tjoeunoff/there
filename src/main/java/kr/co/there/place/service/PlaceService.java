package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceService {

	List<PlaceVo> list() throws SQLException;
	HashMap<String, Object> One(int param, boolean addViewCnt, boolean showReview, String member_id) throws SQLException;
	boolean add(PlaceVo bean) throws SQLException;
	boolean edit(PlaceVo bean) throws SQLException;
	boolean remove(int param) throws SQLException;
	List<PlaceVo> listOrderBylikes() throws SQLException;
	int selectMaxIdx() throws SQLException;
	List<PlaceVo> listHome() throws SQLException;
	HashMap<String, Integer> selectIdx(int param) throws SQLException;
	
	List<ReviewVo> reviewList() throws SQLException;
	boolean addReveiw(ReviewVo bean) throws SQLException;
	boolean hasReview(String member_id,int place_idx) throws SQLException;
	boolean updateReview(ReviewVo bean) throws SQLException;
	boolean deleteReview(ReviewVo bean) throws SQLException;
	
	boolean hasLiked(String member_id,int place_idx) throws SQLException;
	boolean clickLike(String member_id,int place_idx) throws SQLException;
	
	
}

