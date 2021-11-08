package kr.co.there;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeIndexController {

	@RequestMapping("/")
	public String index() {
		ClassPathResource resource = new ClassPathResource("");
		System.out.println(resource.getPath());

		return "home/index";
	}

}