package com.example.demo.member;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface MemberMapper {

	public boolean useridDupChk(String userid);

	public void memberInputOk(MemberDto mdto);

	public void getSave(String userid);

	public MemberDto getMemInfo(String userid);

	public void pwdUpdateOk(MemberDto mdto);

	public void updatePhoneOk(String userid, String phone);

	public void updateEmailOk(String userid, String email);
	

}
