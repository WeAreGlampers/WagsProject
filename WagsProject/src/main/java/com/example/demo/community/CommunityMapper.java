package com.example.demo.community;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CommunityMapper {

	public ArrayList<HashMap> getQna();

	public String getPtitle(String pcode);

}
