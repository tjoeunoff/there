package kr.co.there.mzbbs.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.place.model.entity.PlaceVo;

public interface MzbbsService {
	List<MzbbsVo> list() throws SQLException;
	MzbbsVo one(int param, boolean addViewCnt) throws SQLException;
	boolean add(MzbbsVo mzbean) throws SQLException;
	boolean edit(MzbbsVo mzbean) throws SQLException;
	boolean remove(int param) throws SQLException;
}
