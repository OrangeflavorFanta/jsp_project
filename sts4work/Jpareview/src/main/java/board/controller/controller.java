package board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import board.data.BoardDao;
import board.data.BoardDto;

@Controller
public class controller {

	@Autowired
	BoardDao dao;
	
	@GetMapping("/") //루트 주소(키자마자 보이는 곳)
	public String a() {
		
		
		
		return "redirect:board";
	}

	@GetMapping("/board")//루트의 주소가 가상주소인 보드기 떄문에 결국 여기로 오고 여기의 실제 주소인 board/list가 실제 루트주소가 되는 것임
	public ModelAndView d(BoardDto dto) {
		
		ModelAndView mview=new ModelAndView();
		
		List<BoardDto> form = dao.list();//dao에 있는 모든 dto의 데이터를 갖고 오겠다(dao에서 list가 daoInter의 데이터 findAll이었음)
		mview.addObject("f", form);//list의 form을 f라고 정해줄게~(list에서 쓰임)/modelandview랑 addobject랑 세트
		mview.addObject("fcount", form.size());//list의 form의 size(갯수)를 fcount라고 정해줄게~(list에서 쓰임)
		mview.setViewName("board/list");//리턴해주는 mview의 실제 경로 
		
		return mview;
	}
	
	@GetMapping("/board/write")//list에서 addform으로 가게 해주는 가상주소 (list에도 onclick에 이 주소가 있음)
	public String addform() {
		
		return "board/addform";
	}
	
	//insert
	@PostMapping("/board/insert")//addform의 action주소 (가상주소임)
	public String insert(BoardDto dto) {
		
		dao.insert(dto);//dao에 insert에 save해줄게
		
		return "board/list";
		
	}
	
	/*
	 * @PostMapping("/board/update") public String update(BoardDto dto) {
	 * 
	 * dao.update(dto);
	 * 
	 * return "redirect:board"; }
	 */
	
	

	
	
	
}
