package spring.db.car;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;



@Controller
public class CarController {

	@Autowired
	MycarDao dao;
	
	@GetMapping("/samsung/list")
	public String list(Model model ) {
		
		//전체 갯수
		int totalCount=dao.getTotalCount();
		
		//목록 가져오기
		List<MycarDto> list=dao.getAllDatas();
		
		//모델로 갖고와 request로 저장
		model.addAttribute("totalCount", totalCount);
		model.addAttribute("list", list);
		
		return "car/carlist";
	}
	
	//입력폼으로 가기
	@GetMapping("/samsung/writeform")
	public String carform() {
		
		return "car/writeform";
	}
	
	//insert
	@PostMapping("/samsung/write")
	public String insert(@ModelAttribute MycarDto dto)
	{
		dao.insertMyCar(dto);
		return "redirect:list";
	}
	
	//수정폼으로 가기
	@GetMapping("/samsung/updateform")
	public String updateform(@RequestParam String num, Model model) {//저장하려면 모델..?
		
		//dto가져오기
		MycarDto dto=dao.getData(num);
		
		//저장
		model.addAttribute("dto", dto);
		
		return "car/updateform";
	}
	
	//update
	@PostMapping("/samsung/update")
	public String update(@ModelAttribute MycarDto dto) {
		
		dao.updateMyCar(dto);
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/samsung/delete")
	public String delete(@RequestParam String num) {
		//string은 forward로 하기 때문에 쓴거,  modelandview는 여러개 하는거라 코드가 많아짐
		
		dao.deleteMyCar(num);
		
		return "redirect:list";
	}
	
	
	
}
