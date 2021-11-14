package kr.co.there.mzbbs.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.co.there.mzbbs.model.entity.MzbbsVo;

public interface MzbbsService {
	List<MzbbsVo> list() throws SQLException;
	MzbbsVo one(int param, boolean addViewCnt) throws SQLException;
	int numLikes(int param) throws SQLException;
	Map<Integer,Integer> numLikesMap() throws SQLException; //전 메거진의 좋아요 수를 헤아려서 반환하는 메서드
	int prevIdx(int param) throws SQLException; //이전 게시물 번호를 반환하는 메서드
	int nextIdx(int param) throws SQLException; //이후 게시물 번호를 반환하는 메서드
	int oldestIdx(int param) throws SQLException; //가장 오래된 게시물 번호를 반환하는 메서드
	int newestIdx(int param) throws SQLException; //가장 새로운 게시물 번호를 반환하는 메서드
	boolean hasLiked(String member_id,int magazine_idx) throws SQLException; //해당 회원이 해당 매거진에 좋아요를 눌렀는지 확인하는 메서드
	boolean clickLike(String member_id,int magazine_idx) throws SQLException; //해당 회원이 해당 매거진에 좋아요를 누를 때 호출하는 메서드
	boolean add(MzbbsVo mzbean) throws SQLException;
	boolean edit(MzbbsVo mzbean,boolean doesThumbChange) throws SQLException;
	boolean remove(int param) throws SQLException;
}
