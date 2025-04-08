package com.example.demo.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.method.annotation.HttpHeadersReturnValueHandler;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ReviewDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("ms")
	private MemberService service;
	
	@GetMapping("/member/memberInput")
	public String memberInput() {
		return service.memberInput();
	}
	
	@PostMapping("/member/memberInputOk")
	public String memberInputOk(MemberDto mdto) {
		return service.memberInputOk(mdto);
	}
	
	@GetMapping("/member/useridDupChk")
	public @ResponseBody String useridDupChk(HttpServletRequest request) {
		return service.useridDupChk(request);
	}
	
	@GetMapping("/member/memberInfo")
	public String memberInfo(Model model,
			HttpSession session) {
		return service.memberInfo(model,session);
	}
	
	@PostMapping("/member/pwdUpdateChk")
	public String pwdUpdateChk(HttpSession session, String pwd) {
		return service.pwdUpdateChk(session, pwd);
	}
	
	@GetMapping("/member/pwdUpdate")
	public String pwdUpdate(Model model, HttpSession session,String pwd) {
		return service.pwdUpdate(model, session,pwd);
	}
	
	@GetMapping("/member/exisPwd")
	public @ResponseBody String exisPwd(HttpSession session, String pwd) {
		return service.exisPwd(session,pwd);
	}
	
	@PostMapping("/member/pwdUpdateOk")
	public String pwdUpdateOk(MemberDto mdto,HttpSession session) {
		return service.pwdUpdateOk(mdto,session);
	}
	
	@GetMapping("/member/updatePhone")
	public String updatePhone(Model model, HttpSession session) {
		return service.updatePhone(model,session);
	}
	
	@GetMapping("/member/updateEmail")
	public String updateEmail(Model model, HttpSession session) {
		return service.updateEmail(model,session);
	}
	
	@GetMapping("/member/updatePhoneOk")
	public @ResponseBody String updatePhoneOk(HttpServletRequest request,
			HttpSession session) {
		return service.updatePhoneOk(request,session);
	}
	
	@GetMapping("/member/updateEmailOk")
	public @ResponseBody String updateEmailOk(HttpServletRequest request,
			HttpSession session) {
		return service.updateEmailOk(request, session);
	}
	
	@GetMapping("/member/reservationStatus")
	public String reservationStatus(Model model, HttpSession session) {
		return service.reservationStatus(model,session);
	}
	@GetMapping("/member/cartView")
	public String cartView(HttpSession session, Model model) {
		return service.cartView(session,model);
	}
	
	@GetMapping("/member/cartDel")
	public String cartDel(HttpSession session, HttpServletRequest request) {
		return service.cartDel(session,request);
	}
	
	@GetMapping("/member/reviewWrite")
	public String reviewWrite(HttpSession session,Model model,HttpServletRequest request) {
		return service.reviewWrite(session,model,request);
	}
	
	@PostMapping("/member/reviewWriteOk")
	public String reviewWriteOk(ReviewDto rdto) {
		return service.reviewWriteOk(rdto);
	}
	
	@GetMapping("/member/reviewList")
	public String reviewlist(HttpSession session,Model model, HttpServletRequest request) {
		return service.reviewList(session,model,request);
	}
	
	@GetMapping("/member/reviewDelete")
	public String reviewDelete(HttpSession session, HttpServletRequest request) {
		return service.reviewDelete(session,request);
	}
	
	@GetMapping("/member/reviewUpdate")
	public String reviewUpdate(HttpSession session, ReviewDto rdto, Model model) {
		return service.reviewUpdate(session,rdto,model);
	}
	
	@PostMapping("/member/reviewUpdateOk")
	public String reviewUpdateOk(HttpSession session,ReviewDto rdto) {
		return service.reviewUpdateOk(session,rdto);
	}
	
	@GetMapping("/member/cancel")
	public String cancel(HttpSession session, HttpServletRequest request) {
		return service.cancel(session,request);
	}
}
