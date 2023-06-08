package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService service;
	
	@GetMapping("/member/form")
	public String memberform() {
		
		return "/member/memberform";
				
	}
	
	
	@GetMapping("/member/list")
	public String list(Model model) {
		
		//전체 조회
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		model.addAttribute("count", list.size());
		
		return "/member/memberlist";
	}
	
	
	
	//중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody //json반환 해주는 것 pashing..?
	public Map<String, Integer> idCheckPass(@RequestParam String id){
		Map<String, Integer> map =new HashMap<>();
		
		//id
		int n=service.getSearchId(id);
		
		map.put("count", n); //0 or 1 ("count":0)
		
		return map;
		
	}
	
	
	//insert
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			MultipartFile myphoto,
			HttpSession session) {
		
		//업로드 경로
		String path=session.getServletContext().getRealPath("/photo");
		
		//저장파일
		SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMDDHHmmss");
		String fileName="photo_"+sdf.format(new Date())+"_"+myphoto.getOriginalFilename();
		
		//dto의 photo에 저장
		dto.setPhoto(fileName);
		
		//upload
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
			
			//dao insert
			service.insertMember(dto);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		//return "member/gaipsuccess";
		return "redirect:list";
	}
	
	//나의 정보로 이동
	@GetMapping("/member/myinfo")
	public String myinfo(Model model) {
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return"/member/myinfo";
				
	}
	
	
	@GetMapping("/member/delete")
	@ResponseBody //ajax하려면 필요함
	public void deleteMember(@RequestParam String num) {
		
		service.deleteMember(num);
	}
	
	//info에서 사진만 수정
	@PostMapping("/update/photo")
	@ResponseBody //ajax위해 사용
	public void photoupload(String num ,MultipartFile photo, //사진 넣어줘야 하니까
			HttpSession session) {
		
		//업로드 될 경로 구하기
		String path=session.getServletContext().getRealPath("/photo");
		
		//파일명 구하기
		SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd");
		
		String fileName="f_"+sdf.format(new Date())+photo.getOriginalFilename();
		
		try {
			photo.transferTo(new File(path+"\\"+fileName));
			
			service.updatephoto(num, fileName); //db사진까지 수정 세션까지 아님
			session.setAttribute("loginphoto", fileName);
			
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	//수정폼에 입력할 데이터 반환
	@GetMapping("/member/updateform")
	@ResponseBody
	public MemberDto getData(String num) {
		
		return service.getDataByNum(num);
	}
	
	
	//수정
	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto, HttpSession session) {
		service.updateMember(dto);
		
		//세션에 저장된 이름 변경
		session.setAttribute("loginname", dto.getName());
	}
	
	
	//수정 페이지로 넘어가기
	@GetMapping("/member/modify")
	public ModelAndView modify(String num) {
		
		ModelAndView mview=new ModelAndView();
		
		MemberDto dto=service.getDataByNum(num);
		
		
		mview.addObject("dto", dto);
		mview.setViewName("/member/memberupdateform");
		
		return mview;
	}
	
	@PostMapping("/member/update2")
	public String update2(@ModelAttribute MemberDto dto) {
		
		service.updateMember(dto);
		
		return "redirect:myinfo";
	}
	
}
