package com.example.demo.utils;

public class MyUtils {
	
	public static String stateStr(int num) {
		String str;
		switch(num) {
		    case 0: str="예약완료"; break;
		    case 1: str="D-1"; break;
		    case 2: str="D-2"; break;
		    case 3: str="D-3"; break;
		    case 4: str="D-day"; break;
		    case 5: str="이용완료"; break;
		    case 6: str="취소요청"; break;
		    case 7: str="취소완료"; break;
		    default: str="오류";
		}
		
		return str;
	}
	
	public static String typeStr(int num) {
		String typeStr;
		switch(num) {
		case 0: typeStr = "예약 관련"; break;
		case 1: typeStr = "시설 관련"; break;
		case 2: typeStr = "서비스 관련"; break;
		case 3: typeStr = "기타 문의"; break;
		default: typeStr = "분류 없음";
		}
		return typeStr;
	}
}
