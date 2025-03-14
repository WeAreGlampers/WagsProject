package com.example.demo.community;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {
	@Autowired
	@Qualifier("cs")
	private CommunityService service;
	
	@GetMapping("/community/noticeList")
	public String noticeList(Model model) {
		return service.noticeList(model);
	}
	
	@GetMapping("/community/noticeContent")
	public String noticeContent(String id,Model model) {
		return service.noticeContent(id, model);
	}
}
