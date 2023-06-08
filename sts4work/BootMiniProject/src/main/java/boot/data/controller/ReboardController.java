package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.annotation.JsonCreator.Mode;

import boot.data.dto.BoardDto;
import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
public class ReboardController {

	@Autowired
	ReboardService service;
	
	@GetMapping("/reboard/list")
	public ModelAndView list(@RequestParam(value = "currentPage", defaultValue="1") int currentPage,
			@RequestParam(value = "searchcolumn", required = false)String sc,
			@RequestParam(value = "searchword", required = false)String sw) {//값이 없을 경우에 null로 들어가게 false로 해줌
		
		ModelAndView mview=new ModelAndView();
		
		  int totalPage; //홈페이지 수
	      int startPage; //각 블럭의 시작페이지
	      int endPage; //각 블럭의 끝페이지
	      int start; //각 페이지의 시작번호
	      int perPage = 3; //한페이지에 보여질 글의 갯수
	      int perBlock = 5; //한블럭당 보여지는 페이지 개수
	      
	      //전체 갯수
	      int totalCount=service.getTotalCount(sc, sw);

	      // 총 페이지 개수
	      totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);
	      // 각블럭의 시작페이지.. 현재페이지가 3(s:1, e:5) 6(s:6, e:10)
	      startPage = (currentPage - 1) / perBlock * perBlock + 1;
	      endPage = startPage + perBlock - 1;
	      
	      // 총페이지가8 (6~10 ... endpage를 8로 수정해주어야함.)
	      if (endPage > totalPage)
	         endPage = totalPage;
	      
	      // 각페이지에서 불러올 시작번호
	      start = (currentPage - 1) * perPage;

	      // 각페이지에서 필요한 게시글 가져오기
	      List<ReboardDto> list = service.getPagingList(sc, sw, start, perPage);

	      // 각페이지에 출력할 시작번호
	      int no = totalCount - (currentPage - 1) * perPage;

	      // 출력에 필요한 변수들을 저장 model에 저장
	      mview.addObject("totalCount", totalCount);
	      mview.addObject("list", list);
	      mview.addObject("totalPage", totalPage);
	      mview.addObject("startPage", startPage);
	      mview.addObject("endPage", endPage);
	      mview.addObject("start", start);
	      mview.addObject("perPage", perPage);
	      mview.addObject("perBlock", perBlock);
	      mview.addObject("currentPage", currentPage);
	      mview.addObject("no", no);		
	      
	      mview.setViewName("/reboard/boardlist");
	      return mview;
	}
	
	
	@GetMapping("/reboard/form")
	public String form(@RequestParam (defaultValue = "0") int num,
			@RequestParam (defaultValue= "0") int regroup,
			@RequestParam (defaultValue= "0") int restep,
			@RequestParam (defaultValue= "0") int relevel,
			@RequestParam (defaultValue= "1") int currentPage,
			Model model) {
		
		//답글일 때 넘어오는 값
		//새 글일 경우는 모두 null이므로 defaultValue 값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		
		//제목에 새글 일경우 "", 답글 일 경우 해당 제목을 넣어보자
		String subject="";
		if(num>0) {
			subject=service.getData(num).getSubject();
		}
		
		model.addAttribute("subject", subject);
		
		
		return "/reboard/writeform";
	}
	
	
	//insert
	@PostMapping("/reboard/insert")
	public String insert(ReboardDto dto, int currentPage, List<MultipartFile> upload,
			HttpSession session){
		
		String path=session.getServletContext().getRealPath("/photo");
		
		if(upload.get(0).getOriginalFilename().equals(""))
			dto.setPhoto("no");
		else {
			String photo="";
			int idx=1;
			SimpleDateFormat sdf= new SimpleDateFormat("yyy-MM-dd");
			
			for(MultipartFile multi:upload) {
				String newName=idx+"_"+sdf.format(new Date())+multi.getOriginalFilename();
				photo+=newName+",";
				
				try {
					multi.transferTo(new File(path+"\\"+newName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			photo=photo.substring(0, photo.length()-1);
			dto.setPhoto(photo);
			
			
		}
		
		service.insertReboard(dto);
		
		return "redirect:list?currenrPge="+currentPage;
		
	}
	
	
}
