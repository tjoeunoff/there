package kr.co.there.mzbbs.controller;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.there.mzbbs.service.MzbbsService;

@Controller
@RequestMapping("/magazine")
public class MzbbsHomeController {
	@Autowired
	MzbbsService mzbbsService;
	
	@GetMapping("")
	public String list(Model model) throws SQLException{
		model.addAttribute("mzList",mzbbsService.list());
		model.addAttribute("mzNumlikesMap",mzbbsService.numLikesMap());
		return "/home/magazine/magazineList";
	}
	
	@GetMapping("/{magazine_idx}")
	public String detail(@PathVariable int magazine_idx, Model model) throws SQLException{
		model.addAttribute("mzbean",mzbbsService.one(magazine_idx, true));
		model.addAttribute("mzNumlikes",mzbbsService.numLikes(magazine_idx));
		model.addAttribute("mzPrevidx",mzbbsService.prevIdx(magazine_idx));
		model.addAttribute("mzNextidx",mzbbsService.nextIdx(magazine_idx));
		model.addAttribute("mzOldestidx",mzbbsService.oldestIdx(magazine_idx));
		model.addAttribute("mzNewestidx",mzbbsService.newestIdx(magazine_idx));
		model.addAttribute("mzHasliked",mzbbsService.hasLiked("user01", magazine_idx));
		return "/home/magazine/magazineDetail";
	}
	
	@ResponseBody
	@PostMapping("/likes/{magazine_idx}")
	public boolean like(@PathVariable int magazine_idx, String member_id) throws SQLException{
		return mzbbsService.clickLike(member_id, magazine_idx);
	}
	
}
