package kr.co.there.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.there.member.model.entity.MemberVo;
import kr.co.there.member.service.MemberService;

@Controller
//@RequestMapping("/admin")
public class MemberController {
	@Autowired
	MemberService memberService;

	//------ admin --------
	@GetMapping(value = "/admin/member")
	public String list(Model model) throws Exception {
		model.addAttribute("mbrList", memberService.list());
		return "/admin/member/memberList";
	}
	
	//------ home --------
	@GetMapping("/member/join")
	public String join() {
		
		return "/home/member/join";
	}
	
	@PostMapping("/member/join")
	public String join(MemberVo bean) throws Exception {
		memberService.add(bean);
		return "/home/index";
	}
	
	@GetMapping("/member/login")
	public String loginPage() throws Exception {
		return "/home/member/login";
	}
	
	@GetMapping("/member/findId")
	public String findIdPage() throws Exception {
		return "/home/member/findId";
	}
	
	@GetMapping("/member/findPw")
	public String findPwPage() throws Exception {
		return "/home/member/findPw";
	}
	
	
	
	
	
	
	//------ AJAX --------
	@ResponseBody
	@PostMapping("/member/checkid")
	public boolean checkId(String member_id) throws Exception {
		return memberService.isIdUnique(member_id);
	}
	
	@ResponseBody
	@PostMapping("member/checkemail")
	public boolean checkEmail(String member_email) throws Exception {
		return memberService.isEmailUnique(member_email);
	}
	
	@ResponseBody
	@PostMapping("member/checktel")
	public boolean checkTel(String member_tel) throws Exception {
		return memberService.isTelUnique(member_tel);
	}
	
	
	
}