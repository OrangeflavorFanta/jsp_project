package quiz.jshop.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class JpashopController {

	@Autowired
	JpashopDao dao;
	
	@GetMapping("/shop")
	public ModelAndView start() {
		
		ModelAndView mview=new ModelAndView();
		
		List<JpashopDto> list=dao.list();
		
		mview.addObject("list", list);
		mview.addObject("count", list.size());
		mview.setViewName("jshop/shoplist");
		
		return mview;
	}
	
	@GetMapping("/sangaddform")
	public String add() {
		
		return "jshop/sangaddform";
	}
	
	@PostMapping("/insert")
	public String insert(JpashopDto dto) {
		
		dao.insert(dto);
		
		return "redirect:shop";//리다이렉트는 가상주소, 그냥 리턴은 실제경로
	}
	
	
	

	
	
	
	
	
	
	
}
