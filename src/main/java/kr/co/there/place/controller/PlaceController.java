package kr.co.there.place.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.place.service.PlaceService;
import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/admin/place")
public class PlaceController {
	Logger log = LoggerFactory.getLogger(PlaceController.class);
	
	@Autowired
	PlaceService placeservice;
	
	@GetMapping("/")
	public List<PlaceVo> list() throws SQLException {
		return placeservice.list();	
	}
	

	
	
	
}
