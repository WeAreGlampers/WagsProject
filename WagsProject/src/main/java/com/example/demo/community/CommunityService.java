package com.example.demo.community;

import org.springframework.ui.Model;

import com.example.demo.dto.QnaDto;

import jakarta.servlet.http.HttpSession;

public interface CommunityService {

	public String comQnaList(HttpSession session, Model model, QnaDto qdto);

}
