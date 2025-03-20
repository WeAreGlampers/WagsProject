
package com.example.demo.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.CommentDto;
import com.example.demo.dto.FreeBoardDto;

import com.example.demo.dto.NoticeDto;

@Mapper
public interface CommunityMapper {

	public ArrayList<HashMap> getQna();

	public String getPtitle(String pcode);

	public void freeBoardWriteOk(FreeBoardDto bdto);

	public ArrayList<FreeBoardDto> getList(int index);

	public int getTotal();

	public int getNoticeTotal();
	
	public void views(String id);

	public FreeBoardDto freeBoardContent(String id);
	
	public boolean isPwd(int id,String pwd);
	
	public void updateOk(FreeBoardDto bdto);
	
	public ArrayList<NoticeDto> noticeList(int index);
  
	public NoticeDto noticeContent(String id);

	public void freeBoardDelete(int id);

	public ArrayList<CommentDto> getComment(String id);

	public void commentWriteOk(CommentDto cdto);

	public void commentDelete(String id);
	
	public void commentUpdateOk(CommentDto cdto);


	
}


