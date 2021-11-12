package kr.co.there.mzbbs.model;

import java.sql.SQLException;
import java.util.List;

import kr.co.there.mzbbs.model.entity.MzbbsVo;


public interface MzbbsDao {
	List<MzbbsVo> selectAll() throws SQLException;
	MzbbsVo selectOne(int magazine_idx) throws SQLException;
	int numLikes(int magazine_idx) throws SQLException; //좋아요 수를 헤아려서 반환하는 메서드
	int insertOne(MzbbsVo mzbean) throws SQLException;
	int updateOne(MzbbsVo mzbean) throws SQLException;
	int updateOneWithoutThumb(MzbbsVo mzbean) throws SQLException;
	int updateViewcnt(int magazine_idx) throws SQLException;
	int deleteOne(int magazine_idx) throws SQLException;
}
