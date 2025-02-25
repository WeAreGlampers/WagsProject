package com.example.demo.login;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;

@Mapper
public interface LoginMapper {

	public String loginOk(MemberDto mdto);

	public String getUserid(String name, String phone);

}
