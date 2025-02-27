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
	
	@PostMapping("/member/chgMemPChk")
	public String chgMemPChk(HttpSession session, String pwd) {
		return service.chgMemPChk(session, pwd);
	}
	
	@GetMapping("/member/chgMemInfo")
	public String chgMemInfo(Model model, HttpSession session,String pwd) {
		return service.chgMemInfo(model, session,pwd);
	}
	
	@GetMapping("/member/exisPwd")
	public @ResponseBody String exisPwd(HttpSession session, String pwd) {
		return service.exisPwd(session,pwd);
	}
	
}
