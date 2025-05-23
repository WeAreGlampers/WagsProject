package com.example.demo.member;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

import com.example.demo.dto.MemberDto;
import com.example.demo.dto.ProductDto;
import com.example.demo.dto.ReviewDto;

@Mapper
public interface MemberMapper {

	public boolean useridDupChk(String userid);

	public void memberInputOk(MemberDto mdto);

	public void getSave(String userid);

	public MemberDto getMemInfo(String userid);

	public void pwdUpdateOk(MemberDto mdto);

	public void updatePhoneOk(String userid, String phone);

	public void updateEmailOk(String userid, String email);

	public ArrayList<HashMap> cartView(String userid);

	public ArrayList<HashMap> reservationStatus(String userid);

	public void cartDel(String id);

	public void chgStateCompleted(String id);

	public void chgStateDday(int dDay, String id);

	public HashMap reservationStatusOne(int id);

	public ArrayList<HashMap> getReview(String userid);

	public void reviewWriteOk(ReviewDto rdto);

	public void chgReviewCount(int id);

	public double getStarAvg(String pcode);

	public int getReviewCount(String pcode);

	public void updateProductStatus(double avgStar, int reviewCount, String pcode);

	public void reviewDelete(String id);

	public void chgReviewCount2(String id);

	public ReviewDto getReviewForUpdate(int id);

	public void reviewUpdateOk(ReviewDto rdto);
	
}
