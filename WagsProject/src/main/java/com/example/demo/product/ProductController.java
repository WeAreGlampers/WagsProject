package com.example.demo.product;


import java.net.http.HttpRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.example.demo.dto.CartDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;


@Controller
public class ProductController {
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	

	@GetMapping("/product/productContent")
	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		return service.productContent(session, request, model);
	}
	
	@GetMapping("/product/addCart")
	public String addCart(CartDto cdto, HttpServletRequest request, HttpSession session) {
		return service.addCart(cdto,request,session);
	}
	
	

	@RequestMapping("/product/productList")
	public String productList(HttpServletRequest request,Model model) {
		return service.productList(request,model);
	}

}
