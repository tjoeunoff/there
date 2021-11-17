package kr.co.there.place.controller;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.there.place.model.entity.PlaceVo;
import kr.co.there.place.service.PlaceService;
import kr.co.there.review.model.entity.ReviewVo;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
//@RequestMapping("/admin/place")
public class PlaceController {
	Logger log = LoggerFactory.getLogger(getClass());
	
	@Autowired
	PlaceService placeService;
	
	
	// ===== admin page =====
	@GetMapping("/admin/place")
	public String list(Model model,HttpServletRequest req) throws Exception {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		model.addAttribute("list", placeService.list());
		return "/admin/place/admin_place_list";
	}

	@GetMapping("/admin/place/{place_idx}")
	public String detail(@PathVariable("place_idx") int place_idx, Model model,HttpServletRequest req) throws SQLException {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		HashMap<String, Object> map = new HashMap<>();
		map = placeService.One(place_idx, false, false);
		model.addAttribute("likeCnt", map.get("likeCnt"));
		model.addAttribute("reviewCnt", map.get("reviewCnt"));
		model.addAttribute("plbean", map.get("placeInfo"));
		model.addAttribute("scoreAvg", map.get("scoreAvg"));
		
		return "/admin/place/admin_place_detail";
	}
	
	@GetMapping("/admin/place/form")
	public String moveAddPage(HttpServletRequest req) {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		return "/admin/place/admin_place_add";
	}
	
	@PostMapping("/admin/place")
	public String add(MultipartFile file, Model model, HttpServletRequest request,
			String place_category, String place_name, String place_addr, String place_opentime, 
			String place_endtime, String place_tel, String place_url, String place_content, 
			String place_longitude, String place_latitude, String place_thumb, String place_hashtag) throws SQLException, ParseException {		
		
		PlaceVo bean = new PlaceVo();
		bean.setPlace_category(place_category);
		bean.setPlace_name(place_name);
		bean.setPlace_addr(place_addr);
		bean.setPlace_opentime(place_opentime);
		bean.setPlace_endtime(place_endtime);
		bean.setPlace_tel(place_tel);
		bean.setPlace_url(place_url);
		bean.setPlace_content(place_content);
		bean.setPlace_hashtag(place_hashtag);
		bean.setPlace_latitude(Float.parseFloat(place_latitude));
		bean.setPlace_longitude(Float.parseFloat(place_longitude));
		
        if (!file.isEmpty()) {
        	String savePath = request.getSession().getServletContext().getRealPath("/") + "resources\\img\\place\\";
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            bean.setPlace_thumb(filename);
       
            try {
				file.transferTo(new File(savePath + filename));
				placeService.add(bean);
				
				// 踰덊샇, �씠由�, �쐞�룄, 寃쎈룄 json�뙆�씪濡� ���옣
				int thisIdx = placeService.selectMaxIdx();
				String jsonPath = request.getSession().getServletContext().getRealPath("/") + "resources\\json\\place.json";
				
				File existJsonFile = new File(jsonPath);
				JSONObject obj = new JSONObject();	// 理쒖쥌�쑝濡� json�뿉 �엯�젰�릺�뒗 �궡�슜
				
				if(existJsonFile.exists()) {
					JSONParser parser = new JSONParser();
					
					Reader reader = new FileReader(jsonPath);
					JSONObject existObj = (JSONObject) parser.parse(reader);
					
					// json�뿉 �옉�꽦�릺�뼱�엳�뜕 �뵆�젅�씠�뒪 �젙蹂�
					JSONObject existPlaceMap = (JSONObject) existObj.get("positions");
					
					// �깉濡� �엯�젰�븯�뒗 �뵆�젅�씠�뒪 �젙蹂�
					JSONObject placeLatLngName = new JSONObject();
					
					placeLatLngName.put("name", place_name);
					placeLatLngName.put("addr", place_addr);
					placeLatLngName.put("tel", place_tel);
					placeLatLngName.put("lat", Float.parseFloat(place_latitude));
					placeLatLngName.put("lng", Float.parseFloat(place_longitude));
					
					existPlaceMap.put(thisIdx, placeLatLngName);
					obj.put("positions", existPlaceMap);
					
				} else {
					existJsonFile.createNewFile();
					
					JSONObject placeMap = new JSONObject();
					JSONObject placeLatLngName = new JSONObject();
					
					placeLatLngName.put("name", place_name);
					placeLatLngName.put("addr", place_addr);
					placeLatLngName.put("tel", place_tel);
					placeLatLngName.put("lat", Float.parseFloat(place_latitude));
					placeLatLngName.put("lng", Float.parseFloat(place_longitude));
					placeMap.put(thisIdx, placeLatLngName);
					obj.put("positions", placeMap);
				}
				
				try(
						FileWriter fileJson = new FileWriter(jsonPath); 
					) { 
					fileJson.write(obj.toJSONString());
				} catch (IOException e) {
					e.printStackTrace();
				}
				
			
				 
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
        }
		
		return "redirect:/admin/place";
	}
	
	@GetMapping("/admin/place/form/{place_idx}")
	public String moveEditPage(@PathVariable("place_idx") int place_idx, Model model,HttpServletRequest req) throws SQLException {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		HashMap<String, Object> map = new HashMap<>();
		map = placeService.One(place_idx, false, false);
		model.addAttribute("plbean", map.get("placeInfo"));
		
		return "/admin/place/admin_place_edit";
	}
	
//	@PutMapping("/admin/place/{place_idx}")
//	public String edit(@PathVariable("place_idx") int place_idx, PlaceVo bean, Model model) throws SQLException {
//		model.addAttribute("plbean", placeService.edit(bean));
//		return "redirect:/admin/place/{place_idx}";
//	}
	@PostMapping("/admin/place/{place_idx}")
	public String edit(@PathVariable("place_idx") int place_idx, MultipartFile file, Model model, HttpServletRequest request,
			String place_category, String place_name, String place_addr, String place_opentime, 
			String place_endtime, String place_tel, String place_url, String place_content, 
			String place_longitude, String place_latitude, String place_thumb, String place_hashtag) throws Exception {		
		
		PlaceVo bean = new PlaceVo();
		bean.setPlace_idx(place_idx);
		bean.setPlace_category(place_category);
		bean.setPlace_name(place_name);
		bean.setPlace_addr(place_addr);
		bean.setPlace_opentime(place_opentime);
		bean.setPlace_endtime(place_endtime);
		bean.setPlace_tel(place_tel);
		bean.setPlace_url(place_url);
		bean.setPlace_content(place_content);
		bean.setPlace_hashtag(place_hashtag);
		bean.setPlace_latitude(Float.parseFloat(place_latitude));
		bean.setPlace_longitude(Float.parseFloat(place_longitude));
		
		
		// 踰덊샇, �씠由�, �쐞�룄, 寃쎈룄 json�뙆�씪濡� ���옣
		String jsonPath = request.getSession().getServletContext().getRealPath("/") + "resources\\json\\place.json";

		JSONObject obj = new JSONObject();	// 理쒖쥌�쑝濡� json�뿉 �엯�젰�릺�뒗 �궡�슜
		JSONParser parser = new JSONParser();
		Reader reader = new FileReader(jsonPath);
		JSONObject existObj = (JSONObject) parser.parse(reader);
		
		// json�뿉 �옉�꽦�릺�뼱�엳�뜕 �뵆�젅�씠�뒪 �젙蹂�
		JSONObject existPlaceMap = (JSONObject) existObj.get("positions");
		
		// �깉濡� �엯�젰�븯�뒗 �뵆�젅�씠�뒪 �젙蹂�
		JSONObject placeLatLngName = new JSONObject();
		placeLatLngName.put("name", place_name);
		placeLatLngName.put("addr", place_addr);
		placeLatLngName.put("tel", place_tel);
		placeLatLngName.put("lat", Float.parseFloat(place_latitude));
		placeLatLngName.put("lng", Float.parseFloat(place_longitude));
		
		existPlaceMap.put(place_idx, placeLatLngName);

		obj.put("positions", existPlaceMap);
		System.out.println(place_idx + "踰� �닔�젙�븿 " + obj.get("positions"));	// json�닔�젙/�궘�젣 異붽��옉�뾽�븘�슂
		
		try(
				FileWriter fileJson = new FileWriter(jsonPath); 
			) { 
			fileJson.write(obj.toJSONString());
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
        if (!file.isEmpty()) {
        	String savePath = request.getSession().getServletContext().getRealPath("/") + "resources\\img\\place\\";
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            bean.setPlace_thumb(filename);
       
            try {
				file.transferTo(new File(savePath + filename));
				placeService.edit(bean);
				
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
        } else {
        	bean.setPlace_thumb(place_thumb);
        	placeService.edit(bean);
        }
		
        return "redirect:/admin/place/{place_idx}";
	}
	
	
	@DeleteMapping("/admin/place/{place_idx}")
	public String remove(@PathVariable("place_idx") int param) throws SQLException {
		placeService.remove(param);
		return "redirect:/admin/place";
	}
	
	@GetMapping("/admin/place/review")
	public String ReviewList(Model model,HttpServletRequest req) throws SQLException {
		try {
			if(req.getSession()==null || (int)req.getSession().getAttribute("sessionAuth")!=1) {
				return "redirect:/";
			}
		} catch(NullPointerException e) { //세션 값이 들어있지 않은 경우 이 예외가 발생하는 듯 하다. 즉, 로그아웃 상태에서 어드민 페이지를 요청할 때 예외를 잡고 메인페이지를 보여준다.
			return "redirect:/";
		}
		model.addAttribute("list", placeService.reviewList());
		return "/admin/place/admin_place_review";
	}

	
	
	// ===== home page =====
	@GetMapping("/place/category")
	public String showCategoryPage(Model model) throws SQLException {
		model.addAttribute("list", placeService.listHome());
		return "/home/place/place-by-category";
	}
	
	@GetMapping("/place/location")
	public String moveLocationPage() {
		return "/home/place/place-by-location";
	}
	
	@GetMapping("/place/{place_idx}")
	public String showPlaceDetailPage(@PathVariable("place_idx") int place_idx, Model model, HttpServletRequest req) throws SQLException {
		try {
			HashMap<String, Object> map = new HashMap<>();
			map = placeService.One(place_idx, true, true);
			model.addAttribute("plbean", map.get("placeInfo"));
			model.addAttribute("rvlist", map.get("reviewList"));
			model.addAttribute("likeCnt", map.get("likeCnt"));
			model.addAttribute("reviewCnt", map.get("reviewCnt"));
			model.addAttribute("scoreAvg", map.get("scoreAvg"));
			model.addAttribute("placeHasliked", placeService.hasLiked((String)req.getSession().getAttribute("sessionId"), place_idx));
			model.addAttribute("placeHasReview", placeService.hasReview((String)req.getSession().getAttribute("sessionId"), place_idx));
			model.addAttribute("idxList", placeService.selectIdx(place_idx));
			return "/home/place/place-detail";
		} catch(IndexOutOfBoundsException e) { //작성하지 않은 place 문서를 요청하면 이 예외가 발생한다.
			return "/errorpage";
		}
	}
	
	@PostMapping("/place/{place_idx}")
	public String addReview(ReviewVo bean, Model model) throws SQLException {
		model.addAttribute("rvbean", placeService.addReveiw(bean));
		return "redirect:/place/{place_idx}";
	}
	

	@ResponseBody
	@PostMapping("/place/likes/{place_idx}")
	public boolean like(@PathVariable int place_idx, String member_id) throws SQLException{
		return placeService.clickLike(member_id, place_idx);
	}
	
	

}
