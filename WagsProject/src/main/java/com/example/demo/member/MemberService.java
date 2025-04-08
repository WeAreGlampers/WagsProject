package com.example.demo.member;

import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface MemberService {

	public String memberInput();

	public String memberInputOk(MemberDto mdto);

	public String useridDupChk(HttpServletRequest request);

	public String memberInfo(Model model, HttpSession session);

	public String pwdUpdateChk(HttpSession session, String pwd);

	public String pwdUpdate(Model model, HttpSession session,String pwd);

	public String exisPwd(HttpSession session, String pwd);

	public String pwdUpdateOk(MemberDto mdto, HttpSession session);

	public String updatePhone(Model model, HttpSession session);

	public String updateEmail(Model model, HttpSession session);

	public String updatePhoneOk(HttpServletRequest request, HttpSession session);

	public String updateEmailOk(HttpServletRequest request, HttpSession session);

	public String reservationStatus(Model model, HttpSession session);

	public String cartView(HttpSession session, Model model);

	public String cartDel(HttpSession session, HttpServletRequest request);

	public String reviewWrite(HttpSession session, Model model, HttpServletRequest request);

	public String reviewWriteOk(ReviewDto rdto);

	public String reviewList(HttpSession session, Model model, HttpServletRequest request);

	public String reviewDelete(HttpSession session, HttpServletRequest request);

	public String reviewUpdate(HttpSession session, ReviewDto rdto, Model model);

	public String reviewUpdateOk(HttpSession session, ReviewDto rdto);
	
	public String cancel(HttpSession session, HttpServletRequest request);

}
