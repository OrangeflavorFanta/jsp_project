package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Spliterator;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		
		
		return "/layout/main";				
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		
		ModelAndView mview=new ModelAndView();
		
		//전체 개수
		int totalCount=mapper.getTotalCount();
		
		//전체 조회
		List<IpgoDto> list=mapper.getAllIpgos();
		
		for(IpgoDto dto:list)
		{
			String []  photos=dto.getPhotoname().split(",");
			dto.setDimage(photos[0]);
		}		
		
		mview.addObject("list", list);
		mview.addObject("totalCount", totalCount);
		//mview.setViewName("ipgolist"); //jsp 리졸버
		mview.setViewName("/ipgo/ipgolist");//tiles 리졸버 -> /폴더명/파일명
		
		return mview;
	}
	
	@GetMapping("/ipgo/form")
	   public String form() {
		//return "ipgoform" jsp리졸버
		
	      return "/ipgo/ipgoform";
	   }
	
	//insert
	@PostMapping("/ipgo/insert")//파일 업로드 게시판은 무조건 postmapping
	public String insert(@ModelAttribute IpgoDto dto, 
			@RequestParam ArrayList<MultipartFile> upload,//여러개 갖고오면 arraylist
			HttpSession session) {//모델 어트리뷰트 생략가능
		
		String path=session.getServletContext().getRealPath("/photo");
		System.out.println(path);
		
		String uploadName="";
		int idx=1;//index
		
		if(upload.get(0).getOriginalFilename().equals(""))
			uploadName="no";
		else {
			for(MultipartFile f:upload)
			{
				SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
				String fName=idx+"_"+sdf.format(new Date())+"_"+f.getOriginalFilename();
				uploadName+=fName+",";
				
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//마지막 컴마 제거
			uploadName=uploadName.substring(0,uploadName.length()-1);
		}
		dto.setPhotoname(uploadName);
		mapper.insertIpgo(dto);
		return "redirect:list";
	}
	
	
	//오시는 길로 가기...쌍용교육센터 sub레이아웃으로 나오게
	@GetMapping("/load/map")
	public String load() {
	
		
		return "/load/map"; //titles 레이아웃 /폴더명/파일명  or  /sub/폴더명/파일명
	}
	
	
	
	
}
