package com.example.demo.dto;

import lombok.Data;

@Data
public class ReservationDto {
	private int id,useSave,review,state,pay,card1,halbu,bank1,card2,tel,bank2,totalPrice,fireWood,grill,people;
	private String userid,pcode,writeday,jumuncode,inday,outday,title,req;
	private int fireWoodPrice,grillPrice,roomPrice;
}
