package com.example.demo.product;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class ProductController {
	@Autowired
	@Qualifier("ps")
	private ProductService service;
	
	@GetMapping("/product/productContent")
	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		return service.productContent(session, request, model);
	}
	
	@GetMapping("/product/ex")
	public String ex() {
		return "/product/ex";
	}
	
	
	
}
