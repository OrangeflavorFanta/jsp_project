package data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.dto.MarketDto;
import data.mapper.MarketMapperInter;

@Controller
public class MarketController {
	
	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/")//루트주소
	public String start() {
		
		return "redirect:market/list";
		
	}
	
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		//dto에서 총갯수 얻기
		int totalCount=mapper.getTotalCount();
		
		List<MarketDto> list=mapper.getAllDatas();
		
		mview.addObject("list", list);
		mview.addObject("totalCount", totalCount);//list에서 totalCount라고 할게~~
		mview.setViewName("marketlist");
		return mview;
	}
	
	
	@GetMapping("/market/form")
	public String form() {
		
		return "addform";
	}
	
	
	@PostMapping("/market/insert")
	public String insert(@ModelAttribute MarketDto dto,
			@RequestParam MultipartFile photo,
			HttpSession session) {//web하고 dto(컴퓨터)하고 연결해주는 역할(다른 사람과 연결해줌, 서버에 저장)
		
		//업로드 경로 구하기
		String path=session.getServletContext().getRealPath("/upload");//upload파일에다가
		System.out.println(path);
		
		if(photo.getOriginalFilename().equals(""))
			dto.setPhotoname(null);
		else {//사진명 구해서 넣기
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//날짜 형식 선언
			String photoname="f_"+sdf.format(new Date())+photo.getOriginalFilename();//파일 이름 형식 선언
			
			dto.setPhotoname(photoname);//photoname을 이렇게 여기에 저장해줄게
			
			//실제 업로드
			try {
				photo.transferTo(new File(path+"\\"+photoname));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		//db에 저장
		mapper.insertMarket(dto);
		return "redirect:list";
	}
	
	//삭제
	 @GetMapping("/market/delete") 
	  public String delete(@RequestParam String num, HttpSession session) {
		  
		 //실제경로
		 String path=session.getServletContext().getRealPath("/upload");
		 //압로드된 파일명
		 String uploadfile=mapper.getData(num).getPhotoname();
		 
		 //파일객체 생성
		 File file=new File(path+"\\"+uploadfile);
		 
		 //파일 삭제
		 file.delete();
		 
		 mapper.deleteMarket(num);
		  
		  return "redirect:list";	  
	  }
	
	 //수정폼
	  @GetMapping("/market/updateform")
	  public ModelAndView uform(@RequestParam String num){
	  
		  ModelAndView mview=new ModelAndView();
		  
		  //dto
		  MarketDto dto= mapper.getData(num);
		  
		  mview.addObject("dto", dto);
		  mview.setViewName("updateform");
		  
		  
		  return mview;
	  }
	 
	  //수정
	  @PostMapping("/market/update")
		public String update(@ModelAttribute MarketDto dto,
				@RequestParam MultipartFile photo,
				HttpSession session) {//web하고 dto(컴퓨터)하고 연결해주는 역할(다른 사람과 연결해줌, 서버에 저장)
			
			//업로드 경로 구하기
			String path=session.getServletContext().getRealPath("/upload");//upload파일에다가
			System.out.println(path);
			
			if(photo.getOriginalFilename().equals(""))
				dto.setPhotoname("no");
			else {//사진명 구해서 넣기
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");//날짜 형식 선언
				String photoname="f_"+sdf.format(new Date())+photo.getOriginalFilename();//파일 이름 형식 선언
				
				dto.setPhotoname(photoname);//photoname을 이렇게 여기에 저장해줄게
				
				//실제 업로드
				try {
					photo.transferTo(new File(path+"\\"+photoname));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				
			}
			
			//db에 저장
			mapper.updateMarket(dto);
			return "redirect:list";
		}
	 
	 
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
