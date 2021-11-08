package kr.co.there.place.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.place.service.PlaceService;

@Controller
@RequestMapping("/admin/place")
public class PlaceController {

	@Autowired
	PlaceService placeService;

	@GetMapping("")
	public String list(Model model) throws Exception {
		model.addAttribute("list",placeService.list());
		return "/admin/place/admin_place_list";
	}

	@GetMapping("/{place_idx}")
	public String detail(@PathVariable("place_idx") int place_idx, Model model) throws SQLException {
			model.addAttribute("plbean",placeService.One(place_idx, false));
		return "/admin/place/admin_place_detail";
	}
	
	@GetMapping("/form")
	public String moveAddPage() {
		return "/admin/place/admin_place_add";
	}
	
	@PostMapping("")
	public String add(Model model, PlaceVo bean) throws SQLException {
			model.addAttribute("plbean", placeService.add(bean));
		return "redirect:/admin/place";
	}






}
