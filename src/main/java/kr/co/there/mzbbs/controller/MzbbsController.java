package kr.co.there.mzbbs.controller;

import java.io.File;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.service.MzbbsService;

@Controller
@RequestMapping("/admin/magazine")
public class MzbbsController {
	@Autowired
	MzbbsService mzbbsService;

	@GetMapping(value = "")
	public String list(Model model,HttpServletRequest req) throws Exception {
		try {
			if((int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/member/login";
		}
		model.addAttribute("mzList", mzbbsService.list());
		return "/admin/magazine/magazineList";
	}
	
	@GetMapping("/{magazine_idx}")
	public String detail(@PathVariable("magazine_idx") int magazine_idx, Model model,HttpServletRequest req) throws SQLException {
		try {
			if((int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/member/login";
		}
		model.addAttribute("mzbean", mzbbsService.one(magazine_idx, false));
		model.addAttribute("numLikes",mzbbsService.numLikes(magazine_idx));
		return "/admin/magazine/magazineDetail";
	}

	//수정시 PUT 방법으로는 파일을 입력할 수 없다.
	@PostMapping("/{magazine_idx}/update")
	public String edit(MultipartFile magazine_thumb,@PathVariable int magazine_idx, String magazine_subject,String magazine_content,String magazine_hashtag, HttpServletRequest req) throws Exception {
		String path=req.getRealPath("")+"resources/img/magazine/";
		String origin=magazine_thumb.getOriginalFilename();
		MzbbsVo mzbean=new MzbbsVo();
		mzbean.setMagazine_idx(magazine_idx);
		mzbean.setMagazine_subject(magazine_subject);
		mzbean.setMagazine_content(magazine_content);
		mzbean.setMagazine_hashtag(magazine_hashtag);
		if("".equals(origin)) mzbbsService.edit(mzbean, false); //입력한 섬네일 파일이 없다면 (섬네일을 유지하는 경우)
		else { //입력한 섬네일 파일이 있다면 (섬네일을 갱신하는 경우)
			String rename=System.currentTimeMillis()+"_"+origin;
			mzbean.setMagazine_thumb(rename);
			mzbbsService.edit(mzbean, true);
			File file=new File(path+"/"+rename);
			try {
				magazine_thumb.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		return "redirect:/admin/magazine";
	}

	@DeleteMapping("/{magazine_idx}")
	public String delete(@PathVariable int magazine_idx) throws Exception {
		mzbbsService.remove(magazine_idx);
		return "redirect:./";
	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String magazineAdd(HttpServletRequest req) {
		try {
			if((int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/member/login";
		}
		return "/admin/magazine/magazineAdd";
	}

	@PostMapping(value = "")
	public String magazineInsert(MultipartFile magazine_thumb,String magazine_subject,String magazine_content,String magazine_hashtag,HttpServletRequest req) throws Exception {
		String path=req.getRealPath("")+"resources/img/magazine/";
		String origin=magazine_thumb.getOriginalFilename();
		String rename=origin;
		if( !("".equals(origin)) ) { //입력한 섬네일 파일이 존재한다면-
			rename=System.currentTimeMillis()+"_"+origin;
			File file=new File(path+"/"+rename);
			try {
				magazine_thumb.transferTo(file);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		MzbbsVo mzbean=new MzbbsVo();
		mzbean.setMagazine_subject(magazine_subject);
		mzbean.setMagazine_content(magazine_content);
		mzbean.setMagazine_hashtag(magazine_hashtag);
		mzbean.setMagazine_thumb(rename);
		mzbbsService.add(mzbean);
		return "redirect:/admin/magazine";
	}

}
