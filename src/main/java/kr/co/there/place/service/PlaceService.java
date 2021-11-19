package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.review.model.entity.ReviewVo;

public interface PlaceService {
	
	// admin, home 공용
	List<PlaceVo> list() throws SQLException; // 장소게시글 전체 조회용
	HashMap<String, Object> One(int param, boolean addViewCnt, boolean showReview, String member_id) throws SQLException; // 특정 장소 조회 
	
	// admin 관련
	boolean add(PlaceVo bean) throws SQLException; // 게시물 등록
	boolean edit(PlaceVo bean) throws SQLException; // 게시물 수정
	boolean remove(int param) throws SQLException; // 게시물 삭제
	List<ReviewVo> reviewList() throws SQLException; // 전체 리뷰 목록
	
	// home 관련
	List<PlaceVo> listOrderBylikes() throws SQLException; // 좋아요 갯수별 목록
	List<PlaceVo> listHome() throws SQLException; // 홈페이지에서 장소 리스트 조회
	HashMap<String, Integer> selectIdx(int param) throws SQLException; //이전글, 다음글 구현용 메서드
	boolean addReveiw(ReviewVo bean) throws SQLException; // 리뷰 등록
	boolean hasReview(String member_id,int place_idx) throws SQLException; //해당 회원이 해당 장소게시물에 리뷰를 달았는지 확인하는 메서드
	boolean updateReview(ReviewVo bean) throws SQLException; // 리뷰 수정
	boolean deleteReview(ReviewVo bean) throws SQLException; // 리뷰 삭제
	boolean hasLiked(String member_id,int place_idx) throws SQLException; //해당 회원이 해당 장소게시물에 좋아요를 눌렀는지 확인하는 메서드
	boolean clickLike(String member_id,int place_idx) throws SQLException; //해당 회원이 해당 장소게시물에 좋아요를 누를 때 호출하는 메서드
	
	int selectMaxIdx() throws SQLException;
	
	
	
}

