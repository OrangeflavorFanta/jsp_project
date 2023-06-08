package boot.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.model.PersonDto;

@Controller
public class FormController {

	//단순 폼으로 이동..검색
	@GetMapping("/sist/form1")
	public String form1() {

		return "form/form1"; // WEB-INF/board/form/form1/jsp
	}
	
	@GetMapping("/sist/form2")
	public String form2()
	{
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3()
	{
		return "form/form3";
	}

	// 데이타를 저장..넘기기
	@PostMapping("/sist/read1") // 중간경로
	public ModelAndView read1(String name, int java, int spring) {// @RequestParam 생략 해도 됨

		ModelAndView mview = new ModelAndView();

		mview.addObject("name", name);
		mview.addObject("java", java);
		mview.addObject("spring", spring);
		mview.addObject("tot", java + spring);
		mview.addObject("avg", (java + spring) / 2.0);

		// 포워드 경로
		mview.setViewName("result/result1");// 실제 경로

		return mview;
	}

	
	@PostMapping("/sist/read2")
	public String formRead2(@ModelAttribute("dto") PersonDto dto)
	{
		
		return "result/result2";
	}
	  
	  
	  
	  
	  @PostMapping("/sist/read3") //map으로 읽을 경우 폼의 name 이 key값으로 입력 값이 value값으로 저장
	  public ModelAndView form3(@RequestParam Map<String, String> map) {
	  
	  ModelAndView mview=new ModelAndView();
	  
	  mview.addObject("name", map.get("name"));
	  mview.addObject("blood",map.get("blood")); 
	  mview.addObject("hp", map.get("hp"));
	  
	  mview.setViewName("result/result3");
	  return mview; 
	  
	  }
	  
	  
	 

}
