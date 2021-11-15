package kr.co.there;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.mzbbs.service.MzbbsService;
import kr.co.there.place.service.PlaceService;

@Controller
public class HomeIndexController {
	@Autowired
	PlaceService placeService;
	@Autowired
	MzbbsService mzbbsService;

	@RequestMapping("/")
	public String index(Model model) throws SQLException {
		model.addAttribute("mzList", mzbbsService.list());
		model.addAttribute("plList", placeService.list());
		model.addAttribute("plLikesList", placeService.listOrderBylikes());

		return "home/index";
	}

}
