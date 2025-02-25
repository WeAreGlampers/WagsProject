package com.example.demo.member;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ms")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberMapper mapper;
	
	@Override
	public String memberInput() {
		return "/member/memberInput";
		
	}

	@Override
	public String memberInputOk(MemberDto mdto) {
		 if ( mapper.useridDupChk(mdto.getUserid()) ) {
			 return "redirect:/member/memberInput?err=1";
		 } else {
			mapper.memberInputOk(mdto);
			
			LocalDate today = LocalDate.now();
			LocalDate xday = LocalDate.of(2025, 05, 01);
			//System.out.println(today.isBefore(xday));
			if (today.isBefore(xday)) {
				
				mapper.getSave(mdto.getUserid());
			}
			return "redirect:/login/login";
		 }
	}

	@Override
	public String useridDupChk(HttpServletRequest request) {
		if (mapper.useridDupChk(request.getParameter("userid"))) {
			return "1";
		} else {
			return "0";
		}	
	}

	@Override
	public String memberInfo(Model model, HttpSession session) {
		if (session.getAttribute("userid")==null) {
			return "redirect:/login/login";
		} else {
			return "/member/memberInfo";
		}
		
		
	}
	

}
