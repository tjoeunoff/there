package kr.co.there.mzbbs.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.model.entity.MzlikesStatVo;


public interface MzbbsDao {
	// admin, home 페이지 공용
	List<MzbbsVo> selectAll() throws SQLException; // 매거진 전체 리스트 조회용
	MzbbsVo selectOne(int magazine_idx) throws SQLException; // detail페이지에 상세조회용
	int numLikes(int magazine_idx) throws SQLException; // 좋아요 수를 헤아려서 반환하는 메서드
	List<MzlikesStatVo> numLikesList() throws SQLException; // 전 매거진의 좋아요 수를 헤아려서 반환하는 메서드
	int insertOne(MzbbsVo mzbean) throws SQLException; // 매거진 등록시
	int updateViewcnt(int magazine_idx) throws SQLException; // 조회수 올려주는 메서드
	
	//admin 페이지
	int updateOne(MzbbsVo mzbean) throws SQLException; // 매거진 수정
	int updateOneWithoutThumb(MzbbsVo mzbean) throws SQLException; //매거진 수정시 썸네일 변경
	int deleteOne(int magazine_idx) throws SQLException; // 매거진 삭제
	
	//home 페이지
	List<Integer> selectIdx() throws SQLException; //이전글, 다음글 버튼 구현용
	int hasLiked(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 여부를 확인하는 메서드 (좋아요를 했으면 1, 좋아요를 하지 않았으면 0 반환)
	int likeAdd(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 수를 증가시키는 메서드
	int likeSub(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 수를 감소시키는 메서드
}
