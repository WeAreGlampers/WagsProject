package com.example.demo.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.FreeBoardDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	@Qualifier("cs")
	private CommunityService service;
	
	@GetMapping("/community/write")
	public String write(HttpSession session,Model model) {
		return service.write(session, model);
	}
	
	@PostMapping("/community/writeOk")
	public String writeOk(FreeBoardDto bdto) {
		return service.writeOk(bdto);
	}
	
	@GetMapping("/community/freeBoard")
	public String freeBoard(Model model, HttpServletRequest request) {
		return service.freeBoard(model, request);
	}
	
	@GetMapping("/community/views")
	public String views(HttpServletRequest request) {
		return service.views(request);
	}
	
	@GetMapping("/community/content")
	public String content(Model model,HttpServletRequest request) {
		return service.content(model,request);
	}
	
}
