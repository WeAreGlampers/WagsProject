package com.example.demo.dto;

import lombok.Data;

@Data
public class CommentDto {
	private int id,cid,page;
	private String userid, pwd, content, writeday;
}
