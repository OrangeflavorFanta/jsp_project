package spring.db.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CarMemberController {
	
	//sql (mapper) -> dao -> controller

	@Autowired
	CarMemberDao dao;
	
	@GetMapping("/member/list")
	public String list(Model model) {
		
		//전체 갯수
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<CarMemberDto> list=dao.getAllDatas();
		
		//Model로 갖고와 request에 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "carmember/memberlist";
		
	}
	
	
	//고객 명단 입력 폼으로 가기
	@GetMapping("/member/writeform")
	public String memform() {
		
		return "carmember/writeform";
	}
	
	//insert
	@PostMapping("/member/write")
	public String insert(@ModelAttribute CarMemberDto dto) {
		
		dao.insertMymem(dto);
		return "redirect:list";
		
	}
	
	//수정 폼으로 가기
	@GetMapping("/member/updateform")
	public String update (String num, Model model) {
		
		//dto가져오기
		CarMemberDto dto=dao.getData(num);
		
		//저장
		model.addAttribute("dto", dto);
		
		return "carmember/updateform";
	}
	
	//update
	@PostMapping("/member/update")
	public String update(@ModelAttribute CarMemberDto dto) {
		
		dao.updateMyMem(dto);
		return "redirect:list";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
