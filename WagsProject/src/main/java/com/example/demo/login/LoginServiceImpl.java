package com.example.demo.login;

import org.apache.catalina.mapper.Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.example.demo.dto.MemberDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ls")
public class LoginServiceImpl implements LoginService {
	@Autowired
	private LoginMapper mapper;
	
	@Override
	public String login(Model model, HttpServletRequest request) {
		String err = request.getParameter("err");
		
		
		
		model.addAttribute("err",err);
		return "login/login";
	}

	@Override
	public String loginOk(MemberDto mdto,HttpSession session) {
		String name = mapper.loginOk(mdto);
		if (name==null) {
			return "redirect:/login/login?err=1";
		} else {
			
			System.out.println(name);
			session.setAttribute("name", name);
			session.setAttribute("userid", mdto.getUserid());
			
			return "redirect:/main/main";
		}

	}

	@Override
	public String getUserid(HttpServletRequest request) {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");

			String userid = mapper.getUserid(name,phone);
			if(userid==null) {
				return "찾으시는 정보의 아이디가 없습니다.";
			} else {
				return "아이디 : " + userid;
			}
	}

	@Override
	public String getPwd(HttpServletRequest request) {
		String userid=request.getParameter("userid");
		String name=request.getParameter("name");
		String phone=request.getParameter("phone");
		String pwd = mapper.getPwd(userid,name,phone);
		if(pwd != null) {
			String temp = "";
			for (int i = 0; i < 8; i++) {
				int num = (int)(Math.random() * 90); // 0~89
				num = num + 33;
				
				temp = temp + (char)num;
			}
			mapper.tempPwdChg(userid,temp);
			return "임시 비밀번호 : " + temp;
		} else {
			return "일치하는 정보가 존재하지 않습니다";
		}
		
		
	}
	
	

}
