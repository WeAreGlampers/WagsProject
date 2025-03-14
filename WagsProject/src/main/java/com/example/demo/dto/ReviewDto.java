package com.example.demo.dto;

import lombok.Data;

@Data
public class ReviewDto {
	private int id,star,rid;
	private String userid,pcode,title,content,writeday;
}
