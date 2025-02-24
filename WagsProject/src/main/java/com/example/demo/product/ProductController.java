package com.example.demo.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller
public class ProductController {
	@Autowired
	@Qualifier("ps")
	private ProductService service;

}
