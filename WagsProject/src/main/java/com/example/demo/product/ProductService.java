package com.example.demo.product;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dto.CartDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

public interface ProductService {
	public String productContent(HttpSession session, HttpServletRequest request, Model model);
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session);
	public String dibsOk(HttpSession session,HttpServletRequest request);
	public @ResponseBody String dibsDel(HttpSession session,HttpServletRequest request); 
	
	public String productList(HttpServletRequest request,Model model);

}
