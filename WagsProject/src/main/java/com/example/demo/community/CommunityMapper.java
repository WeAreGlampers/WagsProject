
package com.example.demo.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.FreeBoardDto;

import com.example.demo.dto.NoticeDto;

@Mapper
public interface CommunityMapper {

	public ArrayList<HashMap> getQna();

	public String getPtitle(String pcode);

	public void writeOk(FreeBoardDto bdto);

	public ArrayList<FreeBoardDto> getList(int index);

	public int getTotal();

	public void views(String id);

	public FreeBoardDto content(String id);
	
	public ArrayList<NoticeDto> noticeList();
  
	public NoticeDto noticeContent(String id);

}


