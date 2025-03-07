package com.example.demo.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("as")
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminMapper mapper;
}
