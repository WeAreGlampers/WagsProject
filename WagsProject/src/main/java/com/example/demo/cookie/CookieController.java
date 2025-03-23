package com.example.demo.cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class CookieController {
	@Autowired
	@Qualifier("cs")
	private CookieService service;
	
	@GetMapping("/cookie/firstCookie")
	public @ResponseBody String firstCookie(HttpServletResponse response)
	{
		try
		{
			Cookie cookie=new Cookie("fcook","1");
			cookie.setMaxAge(10);
			cookie.setPath("/"); 
			response.addCookie(cookie);
			
			return "1";
		}
		catch(Exception e)
		{
			return "0";
		}

	}
	
	@GetMapping("/cookie/fcookOk")
	public @ResponseBody String fcookOk(HttpServletRequest request)
	{
		Cookie cookie=WebUtils.getCookie(request, "fcook");
		
		if(cookie==null)
		{
			return "0";
		}
		else
		{
			return "1";
		}
	}

}
