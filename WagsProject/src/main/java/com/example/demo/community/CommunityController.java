
package com.example.demo.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.demo.dto.FreeBoardDto;

import jakarta.servlet.http.HttpServletRequest;

import com.example.demo.dto.QnaDto;

import jakarta.servlet.http.HttpSession;

@Controller
public class CommunityController {
	@Autowired
	@Qualifier("cs")
	private CommunityService service;
	
	@GetMapping("/community/comQnaList")
	public String comQnaList(HttpSession session, Model model, QnaDto qdto) {
		return service.comQnaList(session, model, qdto);
	}

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
	
	@GetMapping("/community/noticeList")
	public String noticeList(Model model, HttpServletRequest request) {
		return service.noticeList(model,request);
	}
	
	@GetMapping("/community/noticeContent")
	public String noticeContent(HttpServletRequest request,Model model) {
		return service.noticeContent(request, model);
	}
}


