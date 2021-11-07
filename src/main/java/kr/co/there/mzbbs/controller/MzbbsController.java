package kr.co.there.mzbbs.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.SQLException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;
import com.google.protobuf.compiler.PluginProtos.CodeGeneratorResponse.File;

import kr.co.there.mzbbs.model.entity.MzbbsVo;
import kr.co.there.mzbbs.service.MzbbsService;

@Controller
@RequestMapping("/admin/magazine")
public class MzbbsController {
	@Autowired
	MzbbsService mzbbsService;
	
	@GetMapping(value = "")
	public String list(Model model) throws Exception {
		model.addAttribute("list", mzbbsService.list());
		return "/admin/magazine/magazineList";
	}
	
//	@GetMapping("/{magazine_idx}")
//	public String detail(@PathVariable("magazine_idx") int magazine_idx, Model model) {
//		try {
//			mzbbsService.objMapping(model, magazine_idx);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return "/admin/magazine/magazineDetail";
//	}
//	
//	@PutMapping("/{magazine_idx}")
//	public String edit(@PathVariable int magazine_idx, MzbbsVo bean) throws Exception {
//		mzbbsService.edit(bean);
//		return "redirect:./";
//	}
//	
//	@DeleteMapping("/{magazine_idx}")
//	public String delete(@PathVariable int magazine_idx) throws Exception {
//		mzbbsService.remove(magazine_idx);
//		return "redirect:./";
//	}

	@RequestMapping(value = "/form", method = RequestMethod.GET)
	public String magazineAdd() {
		return "/admin/magazine/magazineAdd";
	}
	
	@PostMapping(value = "")
	public String magazineInsert(MzbbsVo mzbean,Model model) throws Exception {
		System.out.println(mzbean.getMagazine_subject());
		System.out.println(mzbean.getMagazine_thumb());
		mzbbsService.add(mzbean);
		return list(model);
	}

}
