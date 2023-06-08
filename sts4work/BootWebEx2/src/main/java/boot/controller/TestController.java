package boot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TestController {
	
	@GetMapping("/")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		//모델에 저장
		mview.addObject("name", "장환라");
		mview.addObject("addr", "부천시 소사구");
		mview.addObject("hp", "010-8201-7151");
		
		//포워드
		mview.setViewName("redirect:sist/home");
		
		return mview;
	}

}
