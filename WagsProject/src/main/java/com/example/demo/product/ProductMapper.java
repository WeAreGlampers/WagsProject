package com.example.demo.product;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Mapper;
import com.example.demo.dto.CartDto;
import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;
import com.example.demo.dto.ReservationDto;
import com.example.demo.dto.ReviewDto;

@Mapper
public interface ProductMapper {
	public ArrayList<CartDto> getCart();
	public void addCart(CartDto cdto);
	public boolean isCart(CartDto cdto);
	public void upCart(CartDto cdto);
	public void dibsOk(String userid,String pcode);
	public void dibsDel(String userid,String pcode);
	public int isDibs(String userid,String pcode);
	public ProductDto getRoom(String pcode);
	public ArrayList<ReservationDto> getReservation(String pcode);
	public ArrayList<ReviewDto> getReview(String pcode);
	public void qnaDel1(String id);
	public void qnaDel2(int ref);
	public ArrayList<QnaDto> getQna(String pcode);

	public ArrayList<ProductDto> productList();
	public boolean isCheck(String outday,String pcode);
	public ArrayList<ProductDto> productList2(int num);
	public MemberDto getMember(String userid);
	public int getNumber(String jumuncode);
	public void reservationOk(ReservationDto rdto);
	public void setSave(String userid,int useSave,int addSave);
	public int getSave(String pcode);
	
	
 }

