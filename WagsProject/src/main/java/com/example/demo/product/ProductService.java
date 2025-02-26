package com.example.demo.product;


import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

public interface ProductService {
	public String productContent(HttpSession session, HttpServletRequest request, Model model);
}
