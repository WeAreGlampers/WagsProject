package com.example.demo.admin;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.ProductDto;

@Mapper
public interface AdminMapper {
	public ArrayList<ProductDto> productList();
	public int getPcode(String pcode);
	public void productWriteOk(ProductDto pdto);
	public void productDelete(String id);
	public ProductDto getProduct(String id);
	public void productUpdateOk(ProductDto pdto);
}
