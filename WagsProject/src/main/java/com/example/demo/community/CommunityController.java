package com.example.demo.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

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
}
