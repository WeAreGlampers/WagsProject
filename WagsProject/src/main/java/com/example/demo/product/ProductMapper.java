package com.example.demo.product;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public ArrayList<ProductDto> productList();
	public boolean isCheck(String outday,String pcode);
	public ArrayList<ProductDto> productList2(int num);
}
