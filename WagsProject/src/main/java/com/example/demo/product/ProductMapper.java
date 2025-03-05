package com.example.demo.product;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.CartDto;
import com.example.demo.dto.ProductDto;

@Mapper
public interface ProductMapper {
	public void addCart(CartDto cdto);
	public boolean isCart(CartDto cdto);
	public void upCart(CartDto cdto);
	public void dibsOk(String userid,String pcode);
	public void dibsDel(String userid,String pcode);
	public int isDibs(String userid,String pcode);
	public String getCart();
	
	
	public ArrayList<ProductDto> productList();
	public boolean isCheck(String outday,String pcode);
	public ArrayList<ProductDto> productList2(int num);
	public ProductDto getRoom(String pcode);
}
