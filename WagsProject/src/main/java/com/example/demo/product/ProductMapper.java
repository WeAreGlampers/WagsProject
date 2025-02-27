package com.example.demo.product;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.CartDto;

@Mapper
public interface ProductMapper {
	public void addCart(CartDto cdto);
	public boolean isCart(CartDto cdto);
	public void upCart(CartDto cdto);
}
