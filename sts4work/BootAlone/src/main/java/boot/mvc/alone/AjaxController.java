package boot.mvc.alone;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

@RestController
public class AjaxController {

	@Autowired
	MemberMapperInter mapper;
	
	
	@GetMapping("/alist")
	public List<MemberDto> alist() {
		
		return mapper.listMember(); 
	}
	
	
	@PostMapping("/ainsert")
	public void ainsert(MemberDto dto) {
		
		mapper.insertMember(dto);
	}
	
	/*
	 * @GetMapping("/aupform") public MemberDto goform(String num) {
	 * 
	 * ModelAndView model=new ModelAndView(); model.addObject("num", num);
	 * model.setViewName("/member/upform");
	 * 
	 * return model;
	 * 
	 * }
	 */
	
	@PostMapping("/aupdate")
	public void update(MemberDto dto) {
		
		mapper.updateMember(dto);
	}
	
	@GetMapping("/adeletefunc")
	public void delete(String num) {
		
		mapper.deleteMember(num);
	}
	
	
}
