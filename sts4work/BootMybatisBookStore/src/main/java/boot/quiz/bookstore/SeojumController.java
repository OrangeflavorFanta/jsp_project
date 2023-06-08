package boot.quiz.bookstore;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class SeojumController {
	
	@Autowired
	SeojumMapperInter mapper;
	
	@GetMapping("/")
	public String strart() {
		
		return "redirect:list";
	}
	
	//list출력 및 count 출력 리스트로 가기
	@GetMapping("/list")
	public ModelAndView jjin() {
		
		ModelAndView mview=new ModelAndView();
		
		//totalCount출력
		int totalCount=mapper.getTotalCount();
		
		List<SeojumDto> list=mapper.getAllData();
		
		mview.addObject("list", list);
		mview.addObject("totalCount", totalCount);
		mview.setViewName("book/seojumlist");
		
		return mview;
	}
	
	//폼으로 이동
	@GetMapping("/form")
	public String form() {
		
		return "book/addform";
	}
	
	//순수하게 데이터 넣어주기
	@PostMapping("/insert")
	public String insert(SeojumDto dto) {
		
		mapper.insertSeojum(dto);
		
		return "redirect:list";
	}
	
	//상세페이지로
	@GetMapping("/detail")
	public ModelAndView detail(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		SeojumDto dto = mapper.getData(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("book/detailpage");
		
		return mview;
	}
	
	@GetMapping("/updateform")
	public ModelAndView updateform(String num) {
		ModelAndView mview= new ModelAndView();
		
		SeojumDto dto= mapper.getData(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("book/updateform");
		
		return mview;
	}
	
	@PostMapping("/update")
	public String update(SeojumDto dto) {
		
		mapper.updateSeojum(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/delete")
	public String delete(SeojumDto dto) {
		
		mapper.deleteSeojum(dto);
		
		return "redirect:list";
	}
	
	
	
	
	
	
}
