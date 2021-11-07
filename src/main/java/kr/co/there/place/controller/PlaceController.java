package kr.co.there.place.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.place.service.PlaceService;

@Controller
@RequestMapping("/admin/place")
public class PlaceController {
	
	@Autowired
	PlaceService placeservice;
	
	
	@GetMapping("/")
	public String list(Model model) throws Exception {
		model.addAttribute("list",placeservice.list());
		return "/admin/place/admin_place_list";	
	}
	
	@GetMapping("/{place_idx}")
	public String detail(@PathVariable("place_idx") int place_idx, Model model) {
		try {
			model.addAttribute("plbean",placeservice.One(place_idx, false));
		} catch (SQLException e) {
			e.printStackTrace();
		}
//		try {
//			placeservice.objMapping(model, place_idx);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return "/admin/place/admin_place_detail";
	}	
	
	
	

	
}
