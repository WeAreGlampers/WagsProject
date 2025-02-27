package com.example.demo.member;

import java.text.DecimalFormat;
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
			String userid = (String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);
			
			model.addAttribute("mdto",mdto);
			DecimalFormat df = new DecimalFormat("#,###");
			String saveStr = df.format(mdto.getSave());
			mdto.setSaveStr(saveStr);			
			return "/member/memberInfo";
		}
		
		
	}

	@Override
	public String chgMemPChk(HttpSession session, String pwd) {
		if (session.getAttribute("userid")==null) {
			return "login/login";
		} else {
			String userid=(String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);
			//System.out.println(mdto.getPwd() + " " + pwd);
			if (mdto.getPwd().equals(pwd)) {
				return "redirect:/member/chgMemInfo";
			} else {
				return "redirect:/member/memberInfo?err=2";
			}
		}	
	}

	@Override
	public String chgMemInfo(Model model, HttpSession session,String pwd) {
		if (session.getAttribute("userid")==null) {
			return "login/login";
		} else {
			String userid=(String)session.getAttribute("userid");
			MemberDto mdto = mapper.getMemInfo(userid);
			DecimalFormat df = new DecimalFormat("#,###");
			String saveStr = df.format(mdto.getSave());
			mdto.setSaveStr(saveStr);	
			model.addAttribute("mdto",mdto);

			return "/member/chgMemInfo";

		}
	}

	@Override
	public String exisPwd(HttpSession session, String pwd) {
		String userid=(String)session.getAttribute("userid");
		MemberDto mdto = mapper.getMemInfo(userid);
		
			if(mdto.getPwd().equals(pwd)) {
				return "1";
			} else {
				return "0";
			}	
	}	

}
