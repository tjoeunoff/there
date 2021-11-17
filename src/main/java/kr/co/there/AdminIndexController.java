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
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
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
