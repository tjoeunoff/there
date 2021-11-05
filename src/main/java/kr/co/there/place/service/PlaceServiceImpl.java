package kr.co.there.place.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.there.place.model.PlaceDao;
import kr.co.there.place.model.entity.PlaceVo;

@Service
public class PlaceServiceImpl implements PlaceService {
	@Autowired
	SqlSessionFactory sqlSessionFactory;

	@Override
	public List<PlaceVo> list() throws SQLException {
		try(
			SqlSession sqlSession = sqlSessionFactory.openSession();
				){
			PlaceDao placeDao = sqlSession.getMapper(PlaceDao.class);
			return placeDao.selectAll();	
		}
	}

	@Override
	public PlaceVo One(int param) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean add(PlaceVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean edit(PlaceVo bean) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean remove(int param) throws SQLException {
		// TODO Auto-generated method stub
		return false;
	}

}
