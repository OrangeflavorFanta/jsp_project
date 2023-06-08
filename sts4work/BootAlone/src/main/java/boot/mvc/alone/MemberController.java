package boot.mvc.alone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {

	@Autowired
	MemberMapperInter mapper;
	
	
	//데이터 갖고오기
	@GetMapping("/")
	public String start() {
		
		return "redirect:list";
	}
	
	@GetMapping("/list")
	public ModelAndView list(String num) {
		
		ModelAndView model=new ModelAndView();
		
		int totalcount = mapper.getTotalCount();
		List<MemberDto> list = mapper.listMember();
		
		
		model.addObject("totalcount", totalcount);
		model.addObject("list", list);
		model.setViewName("/member/memberlist");
		
		
		return model;
	}
	
	
	//insert	
	@GetMapping("/insertform")
	public String go() {
		
		return "/member/form";
	}
	
	@PostMapping("/insert")
	public String insert(MemberDto dto) {
		
		mapper.insertMember(dto);
		
		return "redirect:list";
	}
	
	
	//update
	@GetMapping("/updateform")
	public ModelAndView gogo(String num) {
		
		ModelAndView model=new ModelAndView();
		
		MemberDto dto= mapper.getData(num);
		model.addObject("num", num);
		model.addObject("dto", dto);
		model.setViewName("/member/updateform");
		
		return model;
	}
	
	@PostMapping("/update")
	public String update(@ModelAttribute MemberDto dto) {
		
		mapper.updateMember(dto);
		
		return "redirect:list";
	}
	
	
	//delete
	@GetMapping("/delete")
	public String delete(String num) {
		
		mapper.deleteMember(num);
		
		return "redirect:list";
	}
	
	
	//detailpage로 가기
	@GetMapping("/detail")
	public ModelAndView getDetail(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		MemberDto dto = mapper.getData(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("/member/detailpage");
		
		return mview;
	}
	
	@GetMapping("/delform")
	public String deleform(String num) {
		
		mapper.deleteMember(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/upform")
	public ModelAndView upform(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		MemberDto dto = mapper.getData(num);
		
		mview.addObject("dto", dto);
		mview.setViewName("/member/updateform");
		
		return  mview;
	}
	
	@GetMapping("/ajaxinsertform")
	public String ajaxform() {
		
		
		return "/member/ajaxform";
	}
	
	
	
}
