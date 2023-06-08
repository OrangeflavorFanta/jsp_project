package spring.mvc.reboard;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reanswer.data.model.ReanswerDaoInter;
import reanswer.data.model.ReanswerDto;
import reboard.data.model.ReboardDao;
import reboard.data.model.ReboardDto;


@Controller
public class BoardContentController {
	
	@Autowired
	ReboardDao dao;
	
	@Autowired
	ReanswerDaoInter adao;
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam int num,
			@RequestParam int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		//readCount
		dao.updateReadCount(num);
		
		//dto
		ReboardDto dto=dao.getData(num);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		
		
		//num에 해당하는 댓글 db에서 가져와서 보낸다
		List<ReanswerDto> alist=adao.getAnswerList(num);
		
		//댓글이 있을 때만 보내야 하므로
		mview.addObject("acount", alist.size());
		mview.addObject("alist", alist);
		
		
		
		mview.setViewName("content");
		return mview;

		
		
		
		
	
	}
	

	
	
}
