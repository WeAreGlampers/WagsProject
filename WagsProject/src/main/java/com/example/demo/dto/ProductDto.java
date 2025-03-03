package com.example.demo.dto;

import lombok.Data;

@Data
public class ProductDto {
	private int id,price,standard,max,save,review,grill,fireWood;
	private String title,pcode,pimg,dimg,content;
} 
