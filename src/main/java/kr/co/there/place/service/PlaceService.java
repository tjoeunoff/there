package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.ui.Model;

import kr.co.there.place.model.entity.PlaceVo;

public interface PlaceService {
	
	List<PlaceVo> list() throws SQLException;
	PlaceVo One(int param) throws SQLException;
	boolean add(PlaceVo bean) throws SQLException;
	boolean edit(PlaceVo bean) throws SQLException;
	boolean remove(int param) throws SQLException;	
	
}
