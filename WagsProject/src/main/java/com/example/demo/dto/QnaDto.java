package com.example.demo.dto;

import lombok.Data;

@Data
public class QnaDto {
	private int id,secret,type;
	private String userid,content,writeday,qtitle,ref,qna,pcode; 
}
