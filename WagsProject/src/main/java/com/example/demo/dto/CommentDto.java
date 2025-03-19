package com.example.demo.dto;

import lombok.Data;

@Data
public class CommentDto {
	private int id,cid;
	private String userid, pwd, content, writeday;
}
