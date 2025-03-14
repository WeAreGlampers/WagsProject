package com.example.demo.community;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.NoticeDto;

@Mapper
public interface CommunityMapper {
	public ArrayList<NoticeDto> noticeList();
	public NoticeDto noticeContent(String id);

}
