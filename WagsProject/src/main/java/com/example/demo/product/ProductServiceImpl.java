package com.example.demo.product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("ps")
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductMapper mapper;
}
