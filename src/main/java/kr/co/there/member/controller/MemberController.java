package kr.co.there.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.there.member.service.MemberService;

@Controller
@RequestMapping("/admin/member")
public class MemberController {
	@Autowired
	MemberService memberService;
	
	@GetMapping(value = "")
	public String list(Model model) throws Exception {
		model.addAttribute("list", memberService.list());
		return "/admin/member/memberList";
	}
}
