package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.BoardAnswerDto;
import boot.data.dto.BoardDto;
import boot.data.service.BoardAnswerService;
import boot.data.service.BoardService;
import boot.data.service.MemberService;

@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	@Autowired
	MemberService mservice;
	
	@Autowired
	BoardAnswerService aservice;
	
	@GetMapping("/board/list")
	   public ModelAndView boardlist(@RequestParam(defaultValue = "1") int currentPage) {
	      ModelAndView mview = new ModelAndView();

	      int totalcount = service.geTotalCount();

	      int totalPage;
	      int startPage;
	      int endPage;
	      int start;
	      int perPage = 3;
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
	      List<BoardDto> list = service.getList(start, perPage);

	      /*
	       * // list에 각 글에 대한 댓글 개수 추가하기 for (BoardDto d : list) {
	       * d.setAcount(adao.getAnswerList(d.getNum()).size()); }
	       */
	      
	      //댓글갯수
	      for(BoardDto d:list) {
	    	  
	    	  d.setAcount(aservice.getAllAnswers(d.getNum()).size());
	    	  System.out.println(service.getAllDatas());
	      }
	      

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
	      mview.setViewName("/board/boardlist");

	      return mview;
	   }
	
	
	@GetMapping("/board/form")
	public String form() {
		
		return"/board/writeform";
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto, HttpSession session) {//멀티 파트에 있어서 없애도 된다

		//업로드 할 폴더 지정
		String path=session.getServletContext().getRealPath("/photo");
		
		//업로드 할 파일 명
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//업로드 안한 경우
		if(dto.getUpload().getOriginalFilename().equals(""))
		dto.setUploadfile("no");
		
		else {//업로드 한 경우
			String uploadFile="f_"+sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadFile);
			
			//실제 업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadFile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//세션에서 id얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//이름은 memberservice에서 얻어서 dto저장
		String name= mservice.getName(myid);
		dto.setName(name);
		
		//db에 insert
		service.insertBoard(dto);
		
		//return "redirect:list"; //일단은 list content로 이동해보기
		return "redirect:content?num="+service.getMaxNum();
	}
	
	
	@GetMapping("/board/content")
	public ModelAndView content(@RequestParam String num,
			@RequestParam (defaultValue = "1") int currentpage){//커런트 페이지는 1이 기본 값임
		//@RequestParam :
		//@ModelAttribute:
		
		ModelAndView mview=new ModelAndView();
		
		service.updateReadCount(num);//조회수 증가
		
		BoardDto dto= service.getData(num);
		
		//업로드 파일의 확장자를 구해서 따로 보내준다
		int dotloc=dto.getUploadfile().lastIndexOf('.'); //마지막 .의 위치로 구분해준다/ 웬만한 것은 indexof로 써주면 죔
		String ext=dto.getUploadfile().substring(dotloc+1); //.다음 글자부터 끝까지 추출
		
		System.out.println(dotloc+","+ext);
		
		if(ext.equalsIgnoreCase("jpg")|ext.equalsIgnoreCase("gif")|ext.equalsIgnoreCase("png")|ext.equalsIgnoreCase("jpeg"))
		mview.addObject("bupload", true);
		else
			mview.addObject("bupload", false); //->이미지인지 아닌지를 보고 출력하기 위해서 써줌
		
		
		mview.addObject("dto", dto);
		mview.addObject("currentPage", currentpage);
		mview.setViewName("/board/content");
		
		return mview;
	}
	
	
	
	
	
}
