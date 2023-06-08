package spring.mvc.coffee;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/form1")
	public String form1() {
		
		return "board/writeform";
	}
	
	
	@PostMapping("/process1")
	public ModelAndView process1 (@RequestParam String name,
			@RequestParam String date, 
			@RequestParam String gender,
			@RequestParam (required = false) String msg,//에러가 안나게 하겠다는 의미로 required = false
			@RequestParam (defaultValue = "1") int currentPage) //required = false줘도 됨
	{
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("name", name);
		mview.addObject("date", date);
		mview.addObject("gender", gender);
		mview.addObject("msg", msg);
		mview.addObject("currentPage", currentPage);
		
		mview.setViewName("board/result");
		
		
		return mview;
	}
	
	@GetMapping("/result2")
	public String result2(Model model) {
		
		model.addAttribute("myimg1", "../image/03.png");
		model.addAttribute("title", "좋아하는 미니언즈 캐릭터");
		
		
		return "board/result2";
	}
	
	
	
	
	
	
	
	
	
}
