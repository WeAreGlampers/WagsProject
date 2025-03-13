package com.example.demo;

import java.text.DecimalFormat;

import com.example.demo.dto.ProductDto;

public class MyUtil {
	// 콤마, 자릿수 처리
	public static String comma(int num) {
		DecimalFormat df = new DecimalFormat("#,###");

		return df.format(num);
	}

	// 리뷰 별점 처리
	// 별점을 실수로 받은 뒤 노란별,반별,회색별의 갯수를 구하기
	public static void getStar(ProductDto pdto) {
		double star = pdto.getStar();

		int ystar = 0, hstar = 0, gstar = 0;

		// 노란별 갯수
		ystar = (int) pdto.getStar();

		double imsi = pdto.getStar() - ystar;

		if (imsi >= 0.8) {
			ystar++;
		} else if (imsi >= 0.2 && imsi < 0.8) {
			hstar = 1;
		}

		gstar = 5 - (ystar + hstar);

		// dto에 저장
		pdto.setYstar(ystar);
		pdto.setHstar(hstar);
		pdto.setGstar(gstar);
		
	}

}
