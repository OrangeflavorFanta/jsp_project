package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import boot.data.dto.BoardAnswerDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.MemberService;

@RestController //responsebody대신에 이걸 쓰면 매핑마다 안써줘도 됨...
public class BbAnswerController {
	
	@Autowired
	MemberService memservice;
	
	@Autowired
	BoardAnswerService bbservice;
	
	//insert
	@PostMapping("/board/ainsert")
	public void insert(@ModelAttribute BoardAnswerDto dto,
			HttpSession session) {//json으로 저장만 해주기 때문에 void, 반환 없으므로
		
		//session에 로그인 한 id얻기
		String myid=(String) session.getAttribute("myid");
		
		//아이디를 넘겨서 name얻기
		String name=memservice.getName(myid);
		
		//dto에 넣기
		dto.setMyid(myid);
		dto.setName(name);
		
		//insert
		bbservice.insertAnswer(dto);
		
	}
	
	
	//list
	@GetMapping("/board/alist")
	public List<BoardAnswerDto> alist(String num){

		
		return bbservice.getAllAnswers(num);
	}
	
	
	
	  //delete
	  @GetMapping("/board/adelete")
	  public void deleteAnswer(String idx) {
	  
		 bbservice.deleteAnswer(idx);
	  }
	 
	
	//댓글 수정창 띄우기 모달 update
	  @GetMapping("/board/adata")
	  public BoardAnswerDto update(String idx) {
		  
		  
		  
		  return bbservice.getAnswer(idx);
	  }

	  
	  //정말로 댓글을 수정해주는 구문
	  @PostMapping("/board/aupdate")
	  public void auodate(@ModelAttribute BoardAnswerDto dto) {
		  
		  bbservice.updateAnswer(dto);	  
	  }
	  
}
