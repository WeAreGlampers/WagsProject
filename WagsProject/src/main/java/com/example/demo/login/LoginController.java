package com.example.demo.login;

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

public class LoginController {
	@Autowired
	@Qualifier("ls")
	private LoginService service;
	
	@GetMapping("/login/login")
	public String login(Model model,HttpServletRequest request) {
		return service.login(model,request);
	}
	
	@PostMapping("/login/loginOk")
	public String loginOk(MemberDto mdto,HttpSession session,HttpServletRequest request) {
		return service.loginOk(mdto,session,request);	
	}
	
	@GetMapping("/login/getUserid")
	public @ResponseBody String getUserid(HttpServletRequest request) {
		return service.getUserid(request);
	}
	
	@GetMapping("/login/getPwd")
	public @ResponseBody String getPwd(HttpServletRequest request) {
		return service.getPwd(request);
	}
	@GetMapping("/login/logout")
	public String logout(HttpSession session) {
		return service.logout(session);
	}
	
}
