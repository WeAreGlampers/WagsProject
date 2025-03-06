package com.example.demo.dto;

import lombok.Data;

@Data
public class CartDto {
	private int id,fireWood,grill,fireWoodPrice,grillPrice,roomPrice,totalPrice;
	private String userid, pcode,writeday,inday,outday,title;
}
