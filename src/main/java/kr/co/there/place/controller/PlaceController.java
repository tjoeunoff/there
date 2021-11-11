package kr.co.there.place.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.place.service.PlaceService;
import kr.co.there.review.model.entity.ReviewVo;

@Controller
//@RequestMapping("/admin/place")
public class PlaceController {

	@Autowired
	PlaceService placeService;

	
	// ===== admin page =====
	@GetMapping("/admin/place")
	public String list(Model model) throws Exception {
		model.addAttribute("list", placeService.list());
		return "/admin/place/admin_place_list";
	}

	@GetMapping("/admin/place/{place_idx}")
	public String detail(@PathVariable("place_idx") int place_idx, Model model) throws SQLException {
		model.addAttribute("plbean", placeService.One(place_idx, false));
		return "/admin/place/admin_place_detail";
	}
	
	@GetMapping("/admin/place/form")
	public String moveAddPage() {
		return "/admin/place/admin_place_add";
	}
	
	@PostMapping("/admin/place")
	public String add(Model model, PlaceVo bean) throws SQLException {
		model.addAttribute("plbean", placeService.add(bean));
		return "redirect:/admin/place";
	}
	
	@GetMapping("/admin/place/form/{place_idx}")
	public String moveEditPage(@PathVariable("place_idx") int place_idx, Model model) throws SQLException {
		model.addAttribute("plbean", placeService.One(place_idx, false));
		return "/admin/place/admin_place_edit";
	}
	
	@PutMapping("/admin/place/{place_idx}")
	public String edit(@PathVariable("place_idx") int place_idx, PlaceVo bean, Model model) throws SQLException {
		model.addAttribute("plbean", placeService.edit(bean));
		return "redirect:/admin/place/{place_idx}";
	}
	
	@DeleteMapping("/admin/place/{place_idx}")
	public String remove(@PathVariable("place_idx") int param) throws SQLException {
		placeService.remove(param);
		return "redirect:/admin/place";
	}
	
	@GetMapping("/admin/place/review")
	public String ReviewList(Model model) throws SQLException {
		model.addAttribute("list", placeService.reviewList());
		return "/admin/place/admin_place_review";
	}

	
	
	// ===== home page =====
	@GetMapping("/categroy")
	public String showCategoryPage(Model model) throws SQLException {
		model.addAttribute("list",placeService.list());
		return "/home/place/place-by-category";
	}
	
	@GetMapping("/location")
	public String moveLocationPage() {
		return "/home/place/place-by-location";
	}
	
	@GetMapping("/place/{place_idx}")
	public String showPlaceDetailPage(@PathVariable("place_idx") int place_idx, Model model) throws SQLException {
		List<HashMap> list = new ArrayList<>();
		list = placeService.OneIncludeReview(place_idx, true);
		
		model.addAttribute("plbean", list.get(0).get(place_idx));
		model.addAttribute("rvlist", list.get(1).get(place_idx));		

		return "/home/place/place-detail";
	}
	
	@PostMapping("/place/{place_idx}")
	public String addReview(ReviewVo bean, Model model) throws SQLException {
		model.addAttribute("rvbean", placeService.addReveiw(bean));
		return "redirect:/place/{place_idx}";
	}
	
	
	

}
