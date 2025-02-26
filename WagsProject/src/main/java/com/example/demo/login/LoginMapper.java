package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface LoginMapper {

	public String loginOk(MemberDto mdto);

	public String getUserid(String name, String phone);

	public String getPwd(String userid, String name, String phone);

	public void tempPwdChg(String userid, String temp);

}
