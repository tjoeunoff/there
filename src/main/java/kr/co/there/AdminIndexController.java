package kr.co.there;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.member.service.MemberService;
import kr.co.there.mzbbs.service.MzbbsService;
import kr.co.there.place.service.PlaceService;

@Controller
public class AdminIndexController {
	@Autowired
	PlaceService placeService;
	@Autowired
	MemberService memberService;
	@Autowired
	MzbbsService mzbbsService;

	@RequestMapping(value = "/admin")
	public String index(Model model,HttpServletRequest req) throws SQLException {
		if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
			return "redirect:/";
		}
		ClassPathResource resource = new ClassPathResource("");
		System.out.println(resource.getPath());
		model.addAttribute("mbrList", memberService.list());
		model.addAttribute("mzList", mzbbsService.list());
		model.addAttribute("plList", placeService.list());
		return "admin/index";
	}


}
