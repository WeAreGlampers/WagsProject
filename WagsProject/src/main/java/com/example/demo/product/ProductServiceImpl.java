package com.example.demo.product;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;

	@Override
	public String productContent(HttpSession session, HttpServletRequest request, Model model) {
		
		return "/product/productContent";
	}

	

	

	

}
