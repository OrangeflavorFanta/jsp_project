package boot.data.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class loginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login/main")
	public String loginform(HttpSession session, Model model) {
		
		//폼의 아이디를 얻어줌
		String myid=(String)session.getAttribute("myid");
		
		//로그인 상태인지 아닌지 판단
		String loginok=(String)session.getAttribute("loginok");
		
		//한번도 실행 안하면 null;
		if(loginok==null) {
			return "/login/loginform";
		}
		else {
			//로그인 중일때 request에 로그인한 이름 저장하기
			String name=service.getName(myid);
			model.addAttribute("name", name);
			
			return "/login/logoutform";
		}
		
				
	}
	
	@PostMapping("/login/loginprocess")
	public String loginproc(@RequestParam String id,
			@RequestParam String pass,
			@RequestParam(required = false) String cbsave,//required false하는 이유..?
			HttpSession session, Model model) {//model은 model이라는 데이터 저장 공간안에 저장해주는 것, modelandview는 데이터를 저장하고 보여주는 페이지까아쥐
		
		//id와 pass 받기
		int check=service.loginIdPassCheck(id, pass);
		
		
		if(check==1) {
			session.setMaxInactiveInterval(60*60*8);
			
			session.setAttribute("myid", id);
			session.setAttribute("loginok", "yes");//yes일 때 save(loginok)
			session.setAttribute("saveok", cbsave);
			
			//id에 대한 데이터
			MemberDto dto=service.getDataById(id);
			
			session.setAttribute("loginphoto", dto.getPhoto());
			
			return "redirect:main";
			
		}else {//id와 pass가 안맞을 경우
			
			return "/login/passfail";
		}
		
		
	}
	
	@GetMapping("/login/logoutprocess")
	public String logout(HttpSession session) {
		
		session.removeAttribute("loginok");
		
		return "redirect:main";//main에서 판단해서 가주기로 결정한거라 main으로 이동
	}
	
	
	
	
	
	
	
	
}
