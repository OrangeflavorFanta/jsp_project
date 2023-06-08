package spring.mvc.reboard;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import reboard.data.model.ReboardDao;

@Controller
public class BoardDeleteController {
	
	@Autowired
	ReboardDao dao;
	
	@GetMapping("/board/deletepassform")
	public ModelAndView upassform(@RequestParam int num,
			@RequestParam int currentPage) {
		
		ModelAndView mview=new ModelAndView();
		
		mview.addObject("num", num);
		mview.addObject("currentPage", currentPage);//해당 페이지 넘어가기 위해 써줘야 함
		
		mview.setViewName("deletepassform");
		return mview;
	}
	
	@PostMapping("/board/delete")
	public String delete(@RequestParam int num,
			@RequestParam String currentPage,
			@RequestParam int pass,
			HttpSession session) {
		
		//비번이 맞는지 체크(비교해보는 것)
		int check=dao.getCheckPass(num, pass);
		
		if(check==0) {
			return "passfail";
		}else {
			
			//photo폴더의 사진 지우기
			String photo=dao.getData(num).getPhoto();
			
			if(!photo.equals("no")) {
				//,로 분리
				String []fName=photo.split(",");
				
				//실제 업로드 경로
				String path=session.getServletContext().getRealPath("/WEB-INF/photo");
				
				for(String f:fName)
				{
					File file=new File(path+"\\"+f);
					file.delete();
				}
				
			}
			
			
			//db삭제 해줌
			dao.deleteReboard(num);
			
			return "redirect:list?currentPage="+currentPage;
			
		}
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
