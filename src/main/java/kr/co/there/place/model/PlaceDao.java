package kr.co.there.place.model;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceDao {
	
	//admin, home 공용
	List<PlaceVo> selectAll() throws SQLException; // 장소게시글 전체 조회용
	PlaceVo selectOne(int place_idx) throws SQLException; // 각각의 장소게시글 조회용 
	int updateViewCnt(int place_idx) throws SQLException; // 조회수 증가시키는 메서드
	List<ReviewVo> selectReviewAll() throws SQLException; // 전체 리뷰 목록 조회
	int countLike(int place_idx) throws SQLException; // 좋아요 수를 헤아려서 반환하는 메서드
	int hasReview(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //리뷰작성 여부를 확인하는 메서드 (작성했으면 1, 작성하지 않았으면 0 반환)
	int countReview(int place_idx) throws SQLException; //각 게시글당 리뷰갯수 
	double avgScore(int place_idx) throws SQLException; //리뷰 평점 평균
	
	//admin 관련
	int insertOne(PlaceVo bean) throws SQLException; // 게시물 등록
	int updateOne(PlaceVo bean) throws SQLException; // 게시물 수정
	int deleteOne(int place_idx) throws SQLException; // 게시물 삭제
	
	//home 관련
	List<PlaceVo> selectAllHome() throws SQLException; // 홈페이지에 장소리스트 페이지
	List<PlaceVo> orderBylikes() throws SQLException; // 좋아요순으로 나열된 목록
	int selectMaxIdx() throws SQLException; // 
	List<Integer> selectIdx() throws SQLException; //이전글, 다음글 버튼 구현용
	int insertReview(ReviewVo bean) throws SQLException; //리뷰 등록
	int updateReview(ReviewVo bean) throws SQLException; //리뷰 수정
	int deleteReview(ReviewVo bean) throws SQLException; //리뷰 삭제
	int hasLiked(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 여부를 확인하는 메서드 (좋아요를 했으면 1, 좋아요를 하지 않았으면 0 반환)
	int likeAdd(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 수를 증가시키는 메서드
	int likeSub(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; //좋아요 수를 감소시키는 메서드
	ReviewVo selectReviewOne(@Param("member_id") String member_id, @Param("place_idx") int place_idx) throws SQLException; // 리뷰 수정시 해당회원의 리뷰 호출
	List<ReviewVo> selectReviewbyPlace(int place_idx) throws SQLException; // 장소 detail 페이지 리뷰목록
	

}
