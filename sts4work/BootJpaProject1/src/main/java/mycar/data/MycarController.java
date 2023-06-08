package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {

	@Autowired
	MycarDao dao;
	
	@GetMapping("/car")//처음 경로 start
	public String start() {
		
		return "redirect:car/carlist";
	}
	
	@GetMapping("/car/carform")//결국 이 페이지를 보여준다는 것
	public String form() {
		
		return "mycar/caraddform";
	}
	
	//insert
	@PostMapping("/car/insert")//중간경로
	public String insert(@ModelAttribute MycarDto dto) {
		
		dao.insertCar(dto);
		
		return "redirect:carlist";
	}
	
	@GetMapping("/car/carlist")
	public ModelAndView list() {
		ModelAndView mview=new ModelAndView();
		
		//dao
		List<MycarDto> list=dao.getAllDatas();
		
		//저장
		mview.addObject("list", list);
		mview.addObject("tcount", list.size());
		
		mview.setViewName("mycar/carlist");
		
		return mview;
	}
	
	//delete
	@GetMapping("/car/delete")
	public String delete(Long num) {
		
		dao.deletecar(num);
		
		return "redirect:carlist";
	}
	
	
	@GetMapping("/car/updateform")
	public ModelAndView updateform(Long num) {
		
		ModelAndView mview=new ModelAndView();
		//dao
		MycarDto dto=dao.getData(num);
		//request에 저장
		mview.addObject("dto", dto);
		
		mview.setViewName("mycar/carupdateform");
		return mview;
	}
	
	//update
	@PostMapping("/car/update")
	public String update(@ModelAttribute MycarDto dto) {
		
		dao.update(dto);
		return "redirect:carlist";
	}
	
	
	
	
	
	

}
