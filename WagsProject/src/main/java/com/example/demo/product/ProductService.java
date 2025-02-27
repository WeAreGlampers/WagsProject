package com.example.demo.product;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface ProductService {
	public String productList(HttpServletRequest request,Model model);
}
