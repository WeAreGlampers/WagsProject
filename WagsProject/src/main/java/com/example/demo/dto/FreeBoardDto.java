package com.example.demo.dto;

import lombok.Data;

@Data
public class FreeBoardDto {
	private int id,views;
	private String userid,title,content,writeday,pwd;
}
