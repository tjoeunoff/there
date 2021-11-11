package kr.co.there.place.model;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceDao {

	List<PlaceVo> selectAll() throws SQLException;
	PlaceVo selectOne(int place_idx) throws SQLException;
	int insertOne(PlaceVo bean) throws SQLException;
	int updateOne(PlaceVo bean) throws SQLException;
	int updateViewCnt(int place_idx) throws SQLException;
	int deleteOne(int place_idx) throws SQLException;
	
	List<ReviewVo> selectReviewAll() throws SQLException;
	ReviewVo selectReviewbyPlace(int place_idx) throws SQLException;

}
