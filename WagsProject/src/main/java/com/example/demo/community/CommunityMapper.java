package com.example.demo.community;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.FreeBoardDto;

@Mapper
public interface CommunityMapper {

	public void writeOk(FreeBoardDto bdto);

	public ArrayList<FreeBoardDto> getList(int index);

	public int getTotal();

	public void views(String id);

	public FreeBoardDto content(String id);
	
	
	
}
