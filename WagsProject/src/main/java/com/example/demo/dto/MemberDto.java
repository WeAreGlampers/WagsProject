package com.example.demo.dto;

import lombok.Data;

@Data
public class MemberDto {
	private int id,save;
	private String userid,password,name,email,phone,writeday;
}
