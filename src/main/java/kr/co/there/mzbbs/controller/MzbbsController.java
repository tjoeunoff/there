package kr.co.there.mzbbs.controller;

import java.io.File;
import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.service.MzbbsService;

@Controller
@RequestMapping("/admin/magazine")
public class MzbbsController {
	@Autowired
	MzbbsService mzbbsService;
							//TODO 파일 경로 설정
    private String path = "D:\\DockerAWS\\Framework\\upload";

	@GetMapping(value = "")
	public String list(Model model) throws Exception {
		model.addAttribute("list", mzbbsService.list());
		return "/admin/magazine/magazineList";
	}

	@GetMapping("/{magazine_idx}")
	public String detail(@PathVariable("magazine_idx") int magazine_idx, Model model) throws SQLException {
		model.addAttribute("mzbean", mzbbsService.one(magazine_idx, false));
		return "/admin/magazine/magazineDetail";
	}

	//PUT 방법으로는 파일을 입력할 수 없다.
	@PostMapping("/{magazine_idx}/update")
	public String edit(MultipartFile magazine_thumb,@PathVariable int magazine_idx, String magazine_subject,String magazine_content,String magazine_hashtag) throws Exception {
		String origin=magazine_thumb.getOriginalFilename();
		MzbbsVo mzbean=new MzbbsVo();
		mzbean.setMagazine_idx(magazine_idx);
		mzbean.setMagazine_subject(magazine_subject);
		mzbean.setMagazine_content(magazine_content);
		mzbean.setMagazine_hashtag(magazine_hashtag);
		if("".equals(origin)) mzbbsService.edit(mzbean, false); //입력한 섬네일 파일이 없다면 (섬네일을 유지하는 경우)
		else {
			String rename=System.currentTimeMillis()+"_"+origin;
			mzbean.setMagazine_thumb(rename);
			mzbbsService.edit(mzbean, true);
			File file=new File(path+"/"+rename);
			try {
				magazine_thumb.transferTo(file);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} //입력한 섬네일 파일이 있다면 (섬네일을 갱신하는 경우)
		return "redirect:/admin/magazine";
	}

	@DeleteMapping("/{magazine_idx}")
	public String delete(@PathVariable int magazine_idx) throws Exception {
		mzbbsService.remove(magazine_idx);
		return "redirect:./";
	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String magazineAdd() {
		return "/admin/magazine/magazineAdd";
	}

	@PostMapping(value = "")
	public String magazineInsert(MultipartFile magazine_thumb,String magazine_subject,String magazine_content,String magazine_hashtag) throws Exception {
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
