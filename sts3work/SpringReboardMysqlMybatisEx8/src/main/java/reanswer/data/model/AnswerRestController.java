package reanswer.data.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDaoInter;
import reboard.data.model.ReboardDto;

@RestController
public class AnswerRestController {
	
	
	@Autowired
	ReanswerDao adao;
	
	@Autowired
	ReboardDaoInter dao; 
	
	@GetMapping("/board/adelete")//ajax mapping주소, ajax의  url과 일치
	public HashMap<String, Integer> answerDelete(@RequestParam int idx,
			@RequestParam String pass){//인티저는 0,1로 전달되어야 하기 때문에 integer쓰는거임
		
		int check=adao.getCheckPass(idx, pass);
		
		if(check==1) {//비번이 맞을 경우 댓글 삭제
			adao.deleteAnswer(idx);
		}
		
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("check", check);
		
		return map;
		
	}
	
	
	/*
	 * //ajax연습을 위한 출력 문제
	 * 
	 * @GetMapping("/rest/list") public List<ReboardDto> ajaxlist(){
	 * List<ReboardDto> list=dao.getAlldatas();
	 * 
	 * for(ReboardDto dto:list) { if(!dto.getPhoto().equals("no")) { String []
	 * photos=dto.getPhoto().split(","); dto.setPhoto(photo[0]);//사진은 첫번째 사진으로 넣기
	 * 
	 * } }
	 * 
	 * return list; }
	 */
	
	
	
	
	
		
	
}
