package com.example.demo.utils;

public class MyUtils {
	
	public static String stateStr(int num)
	{
		String str;
		switch(num)
		{
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
}
