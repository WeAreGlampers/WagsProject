package com.example.demo.login;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;

@Controller

public class LoginController {
	@Autowired
	@Qualifier("ls")
	private LoginService service;
}
