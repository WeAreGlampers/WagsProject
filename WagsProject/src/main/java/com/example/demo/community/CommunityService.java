
package com.example.demo.community;

import org.springframework.ui.Model;

import com.example.demo.dto.QnaDto;
import com.example.demo.dto.CommentDto;
import com.example.demo.dto.FreeBoardDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface CommunityService {

	public String comQnaList(HttpSession session, Model model, QnaDto qdto);

	public String write(HttpSession session, Model model);
	
	public String writeOk(FreeBoardDto bdto);
	
	public String freeBoard(Model model, HttpServletRequest request, CommentDto cdto);
	
	public String views(HttpServletRequest request);
	
	public String content(Model model,HttpServletRequest request,HttpSession session);

	public String noticeList(Model model, HttpServletRequest request);
  
	public String noticeContent(HttpServletRequest request,Model model);
	
	public String update(HttpServletRequest request, Model model);

	public String updateOk(FreeBoardDto bdto, HttpServletRequest request);

	public String freeBoardDelete(HttpServletRequest request);

	public String commentWriteOk(CommentDto cdto,HttpServletRequest request);

	public String commentUpdateOk(HttpServletRequest request, CommentDto cdto);

	public String commentDelete(HttpServletRequest request, HttpSession session);

}

