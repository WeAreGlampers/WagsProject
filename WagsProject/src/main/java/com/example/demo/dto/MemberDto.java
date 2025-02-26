package com.example.demo.dto;

import lombok.Data;

@Data
public class MemberDto {
	private int id,save;
	private String userid,pwd,name,email,phone,writeday;
	
	private String saveStr;
}
