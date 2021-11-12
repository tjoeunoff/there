package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceService {

	List<PlaceVo> list() throws SQLException;
	HashMap<String, Object> One(int param, boolean addViewCnt, boolean showReview) throws SQLException;
	boolean add(PlaceVo bean) throws SQLException;
	boolean edit(PlaceVo bean) throws SQLException;
	boolean remove(int param) throws SQLException;

	List<ReviewVo> reviewList() throws SQLException;
	boolean addReveiw(ReviewVo bean) throws SQLException;
	
	List<PlaceVo> listHome() throws SQLException;
	
}

