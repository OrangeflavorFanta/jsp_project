package reanswer.data.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AnswerController {
	
	@Autowired
	ReanswerDaoInter adao;
	
	@PostMapping("/board/ainsert")
	public String answerInsert(@ModelAttribute ReanswerDto dto,
			@RequestParam String currentPage) {
		
		//db에 추가
		adao.insertOfReanswer(dto);
		
		//내용보기로
				
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}


}
