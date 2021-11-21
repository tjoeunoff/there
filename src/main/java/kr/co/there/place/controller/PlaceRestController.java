package kr.co.there.place.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.place.service.PlaceService;

@RestController
public class PlaceRestController {
	@Autowired
	PlaceService placeService;
	
	@RequestMapping("/place/json")
	public HashMap<String, Object> placeListForMap() throws SQLException {
		List<PlaceVo> list = placeService.list();
		
		HashMap<String, Object> map = new HashMap<>();
		HashMap<Integer, Object> placeList = new HashMap<>();
		
		for(int i=0; i<list.size(); i++) {
			HashMap<String, Object> placeOne = new HashMap<>();
			placeOne.put("name", list.get(i).getPlace_name());
			placeOne.put("tel", list.get(i).getPlace_tel());
			placeOne.put("addr", list.get(i).getPlace_addr());
			placeOne.put("lat", list.get(i).getPlace_latitude());
			placeOne.put("lng", list.get(i).getPlace_longitude());
			
			placeList.put(list.get(i).getPlace_idx(), placeOne);
		}
		
		map.put("positions", placeList);

		return map;
	}
	
}
