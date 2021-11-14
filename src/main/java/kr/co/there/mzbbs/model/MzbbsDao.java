package kr.co.there.mzbbs.model;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.model.entity.MzlikesStatVo;


public interface MzbbsDao {
	List<MzbbsVo> selectAll() throws SQLException;
	MzbbsVo selectOne(int magazine_idx) throws SQLException;
	int numLikes(int magazine_idx) throws SQLException; //좋아요 수를 헤아려서 반환하는 메서드
	List<MzlikesStatVo> numLikesList() throws SQLException; //전 메거진의 좋아요 수를 헤아려서 반환하는 메서드
	List<Integer> selectIdx() throws SQLException;
	int insertOne(MzbbsVo mzbean) throws SQLException;
	int hasLiked(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 여부를 확인하는 메서드 (좋아요를 했으면 1, 좋아요를 하지 않았으면 0 반환)
	int likeAdd(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 수를 증가시키는 메서드
	int likeSub(@Param("member_id") String member_id, @Param("magazine_idx") int magazine_idx) throws SQLException; //좋아요 수를 감소시키는 메서드
	int updateOne(MzbbsVo mzbean) throws SQLException;
	int updateOneWithoutThumb(MzbbsVo mzbean) throws SQLException;
	int updateViewcnt(int magazine_idx) throws SQLException;
	int deleteOne(int magazine_idx) throws SQLException;
}
