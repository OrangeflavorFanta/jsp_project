package boot.mvc.yeeun;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MycarController {
	
	@Autowired
	MycarMapperInter mapper;
	
	  @GetMapping("/")///루트주소
	  public String start() {
	  
	  return "redirect:list"; //가상주소
	  
	  }
	 
	
	@GetMapping("/list")//가상주소
	public ModelAndView main() {
		
		ModelAndView mview=new ModelAndView();
		
		int totalcount= mapper.getTotalCount(); //totalcount를 int로 저장해줄게
		List<MycarDto> list=mapper.getAllCars(); //mapper의 dto들을 list로 dto묶음을 다 가져올거야
		
		mview.addObject("totalcount", totalcount);//totalcountfmf totalcount라고 해줄게
		mview.addObject("list", list); //위의 list를 carform에서(insert해주는 form) list라고 해줄게
		mview.setViewName("/yeeun/carlist");//totalcount와 list를 carlist 에 전달해준다
		
		return mview;//setViewName에 주소를 줬다
	}
	
	@GetMapping("/insertform")
	public String insertform() {
		
		
		return "/yeeun/carform"; //form이라는 액션 주소를 가진 carform으로 가줄게
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MycarDto dto) {
		//ModelAtribute: 가상주소가 insert인 맵퍼와 carform의 액션주소가 insert라서 그 form의 name값을 가져와 dto안에 저장해준다 
		//결론= name 값을 갖고와서 저장해준다 
		
		mapper.insertMycar(dto); //sql의 mapper의 insert문을 가져와 dto에 insert해줄게
		
		return "redirect:list";//insert하면 가상주소가 list인 carlist로 가줄게
	}
	
	@GetMapping("/delete")
	public String delete(String num) {
		
		mapper.deleteMycar(num); //sql의 mapper의 delete문을 가져와 dto에서 delete 해줄게
		
		return "redirect:list"; //delete하면 list인 carlist로 가줄게
	}
	
	
	@GetMapping("/updateform")
	public ModelAndView updateform(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		MycarDto dto=mapper.getData(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("/yeeun/updateform");
		
		return mview;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MycarDto dto) {
		//modelAttribute: name값을 갖고와서 dto에 저장해준다.
		
		mapper.updateMycar(dto);
		
		return "redirect:list";
	}
	
	

}
