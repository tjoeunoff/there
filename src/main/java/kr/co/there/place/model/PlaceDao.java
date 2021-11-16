package kr.co.there.place.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceDao {

	List<PlaceVo> selectAll() throws SQLException;
	PlaceVo selectOne(int place_idx) throws SQLException;
	int insertOne(PlaceVo bean) throws SQLException;
	int updateOne(PlaceVo bean) throws SQLException;
	int updateViewCnt(int place_idx) throws SQLException;
	int deleteOne(int place_idx) throws SQLException;
	List<PlaceVo> selectAllHome() throws SQLException;
	List<PlaceVo> orderBylikes() throws SQLException;
	int selectMaxIdx() throws SQLException;
	
	List<ReviewVo> selectReviewAll() throws SQLException;
	List<ReviewVo> selectReviewbyPlace(int place_idx) throws SQLException;
	int insertReview(ReviewVo bean) throws SQLException;
	int countReview(int place_idx) throws SQLException;
	double avgScore(int place_idx) throws SQLException;
	int hasReview(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException;
	
	int countLike(int place_idx) throws SQLException;
	int hasLiked(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 여부를 확인하는 메서드 (좋아요를 했으면 1, 좋아요를 하지 않았으면 0 반환)
	int likeAdd(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 수를 증가시키는 메서드
	int likeSub(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 수를 감소시키는 메서드

}
