package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class FormController {

	@PostMapping("/quiz/form")
	public String form() {
		
		return "sawonform";
	}
	
	
}
