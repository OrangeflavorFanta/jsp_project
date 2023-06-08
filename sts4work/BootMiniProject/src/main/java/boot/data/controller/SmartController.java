package boot.data.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import boot.data.dto.SmartDto;
import boot.data.service.SmartService;

@Controller
@RequestMapping("/smart")
public class SmartController {
	
	@Autowired
	SmartService service;

	@GetMapping("/form")
	public String form() {
		
		return "/smart/smartform";
	}
	
	
	//insert
	@PostMapping("/insert")
	public String insert(@ModelAttribute SmartDto dto) {
		
		service.insertShop(dto);
		
		return "redirect:list";
	}
	
	
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage) {//currentPage값을 1로 준다
		
		ModelAndView mview= new ModelAndView();
		int totalcount = service.getTotalCount();
		
		  int totalPage;
	      int startPage;
	      int endPage;
	      int start;
	      int perPage = 5;
	      int perBlock = 5;

	      // 총 페이지 개수
	      totalPage = totalcount / perPage + (totalcount % perPage == 0 ? 0 : 1);
	      // 각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5) 6(s:6, e:10)
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;
	      // 총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
	      if (endPage > totalPage)
	         endPage = totalPage;
	      // 각페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // 각페이지에서 필요한 게시글 가져오기
	      List<SmartDto> list = service.getShopList(start, perPage);

	      
			/*
			 * //상품갯수 for(SmartDto d:list) {
			 * 
			 * d.setAcount(service.getShopList(d.getNum()).size());
			 * System.out.println(service.getShopList(startPage, startPage));
			 * System.out.println(service.getShopList(perPage, startPage)); }
			 */

	      // 각페이지에 출력할 시작번호
	      int no = totalcount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 저장 model에 저장
	      mview.addObject("totalcount", totalcount);
	      mview.addObject("list", list);
	      mview.addObject("totalPage", totalPage);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("start", start);
	      mview.addObject("perPage", perPage);
	      mview.addObject("perBlock", perBlock);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("no", no);
		
	      //System.out.println(perPage);
		
		mview.setViewName("/smart/smartlist");
		return mview;
	}
	
	
	@GetMapping("/detail")
	public ModelAndView  detail(@RequestParam int num,@RequestParam int currentPage ) {
		
		ModelAndView mview=new ModelAndView();
		
		//numdp해당하는 dto
		SmartDto dto=service.getSangpum(num);
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentPage);
		mview.setViewName("/smart/detail");
		
		
		return mview;
	}
	
	
	
	
	
}
