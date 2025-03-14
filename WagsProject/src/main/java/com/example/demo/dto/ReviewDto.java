package com.example.demo.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private int id,rid,star;
	private String userid,pcode,title,content,writeday,chUserid;
	
}

