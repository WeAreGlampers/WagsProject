package com.example.demo.cookie;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
@Qualifier("cs")
public class CookieServiceImpl implements CookieService {
	@Autowired
	private CookieMapper mapper;
	
}
