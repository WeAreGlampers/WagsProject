package com.example.demo.member;

import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MemberService {

	public String memberInput();

	public String memberInputOk(MemberDto mdto);

	public String useridDupChk(HttpServletRequest request);

	public String memberInfo(Model model, HttpSession session);

	public String chgMemPChk(HttpSession session, String pwd);

	public String chgMemInfo(Model model, HttpSession session,String pwd);

}
