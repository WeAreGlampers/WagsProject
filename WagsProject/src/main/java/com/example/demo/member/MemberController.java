package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@GetMapping("/member/memberInput")
	public String memberInput() {
		return service.memberInput();
	}
	
	@PostMapping("/member/memberInputOk")
	public String memberInputOk(MemberDto mdto) {
		return service.memberInputOk(mdto);
	}
	
	@GetMapping("/member/useridDupChk")
	public @ResponseBody String useridDupChk(HttpServletRequest request) {
		return service.useridDupChk(request);
	}
	
	@GetMapping("/member/memberInfo")
	public String memberInfo(Model model,
			HttpSession session) {
		return service.memberInfo(model,session);
	}
	
	@PostMapping("/member/pwdUpdateChk")
	public String pwdUpdateChk(HttpSession session, String pwd) {
		return service.pwdUpdateChk(session, pwd);
	}
	
	@GetMapping("/member/pwdUpdate")
	public String pwdUpdate(Model model, HttpSession session,String pwd) {
		return service.pwdUpdate(model, session,pwd);
	}
	
	@GetMapping("/member/exisPwd")
	public @ResponseBody String exisPwd(HttpSession session, String pwd) {
		return service.exisPwd(session,pwd);
	}
	
	@PostMapping("/member/pwdUpdateOk")
	public String pwdUpdateOk(MemberDto mdto,HttpSession session) {
		return service.pwdUpdateOk(mdto,session);
	}
	
	@GetMapping("/member/updatePhone")
	public String updatePhone(Model model, HttpSession session) {
		return service.updatePhone(model,session);
	}
	
	@GetMapping("/member/updateEmail")
	public String updateEmail(Model model, HttpSession session) {
		return service.updateEmail(model,session);
	}
	
	@GetMapping("/member/phoneUpdateOk")
	public @ResponseBody String phoneUpdateOk(HttpServletRequest request,
			HttpSession session) {
		return service.updatePhoneOk(request,session);
	}
}
