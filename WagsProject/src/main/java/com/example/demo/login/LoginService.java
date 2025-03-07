package com.example.demo.login;

import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface LoginService {

	public String login(Model model, HttpServletRequest request);

	public String loginOk(MemberDto mdto,HttpSession session);

	public String getUserid(HttpServletRequest request);

	public String getPwd(HttpServletRequest request);

	public String logout(HttpSession session);

}
