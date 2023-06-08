package boot.data.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class LoginRestController {

	@Autowired
	MemberService service;
	
	@ResponseBody
	@GetMapping("/member/login")
	public Map<String, String> loginproc(String id, String pass, HttpSession session){
		
		Map<String, String> map= new HashMap<>();
		
		int result=service.loginIdPassCheck(id, pass);
		
		if(result==1){
		
			//id 와 pass 일치할 때 세션 유지-> 세션 설정
			session.setMaxInactiveInterval(60*60*4);
			
			//로그인 정보 가져와 세션에 저장
			MemberDto mdto=service.getDataById(id);
			
			session.setAttribute("loginok", "yes");
			session.setAttribute("myid", id);
			session.setAttribute("loginphoto", mdto.getPhoto());
			session.setAttribute("loginname", mdto.getName());
		}
		
		map.put("result", result==1?"success":"fail");
		
		return map; 
	}
	
	@ResponseBody
	@GetMapping("/member/logout")
	public void logoutproc(HttpSession session) {
		
		//로그아웃 때 제거되어야 할 세션
		session.removeAttribute("loginok");//로그인한걸 지워줌
		session.removeAttribute("myid");//id도 지워줌
	}
	
	
	
	
	
	
	
	
}
