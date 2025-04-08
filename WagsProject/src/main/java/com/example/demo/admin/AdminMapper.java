package com.example.demo.admin;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.NoticeDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.QnaDto;
import com.example.demo.dto.ReservationDto;

@Mapper
public interface AdminMapper {
	public ArrayList<ProductDto> productList();
	public int getPcode(String pcode);
	public void productWriteOk(ProductDto pdto);
	public void productDelete(String id);
	public ProductDto getProduct(String id);
	public void productUpdateOk(ProductDto pdto);
	public ArrayList<ReservationDto> reservationList();
	public ArrayList<HashMap> qnaList();
	public void chgState(String id);
	public void qnaAnswer(QnaDto qdto);
	public void chgRef(int ref);
	public ArrayList<NoticeDto> noticeList();
	public void noticeWriteOk(NoticeDto ndto);
	public NoticeDto noticeContent(String id);
	public void noticeDelete(String id);
	public void noticeUpdateOk(NoticeDto ndto);
	public String getTitle(String pcode);
}
