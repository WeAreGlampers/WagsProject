
package com.example.demo.community;

import org.springframework.ui.Model;

import com.example.demo.dto.FreeBoardDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface CommunityService {

	public String write(HttpSession session, Model model);
	
	public String writeOk(FreeBoardDto bdto);
	
	public String freeBoard(Model model, HttpServletRequest request);
	
	public String views(HttpServletRequest request);
	
	public String content(Model model,HttpServletRequest request);

	public String noticeList(Model model);
  
	public String noticeContent(String id,Model model);
}

