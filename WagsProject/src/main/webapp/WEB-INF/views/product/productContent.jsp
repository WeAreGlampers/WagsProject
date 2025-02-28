<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

section #menu {
	width: 1100px;
	height: 50px;
	margin: auto;
	margin-top: 50px;
	margin-bottom: 40px;
}

section #menu ul {
	width: 1100px;
	height: 50px;
	padding-left: 0px;
	margin-left: 6px;
}

section #menu ul li {
	display: inline-block;
	list-style-type: none;
	width: 273px;
	height: 50px;
	text-align: center;
	border: 1px solid black;
	margin-left: -6px;
	line-height: 50px;
}

section #calendar {
	border-spacing:0px;
	border-collaps:collapse;
}

section #calendar #cal {
	background:white;
	border-spacing:0px;
	width:1100px;
	height:500px;
}

section #calendar #caption {
	height:40px;
}

a {
	text-decoration:none;
	color:black;
}
</style>
<script>
	function minus(n) {
		var quantity=document.getElementsByClassName("quantity")[n];
		//alert(n+" "+quantity.value)
		//alert(--quantity.value);
		if(quantity.value > 1)
			quantity.value = --quantity.value;
	}
	
	function plus(n) {
		var quantity=document.getElementsByClassName("quantity")[n];
		quantity.value = ++quantity.value;
	}
	
	function addCart() {
		var fireWood=document.getElementsByClassName("quantity")[0].value;
		var grill=document.getElementsByClassName("quantity")[1].value;
	
		var chk=new XMLHttpRequest();
		chk.onload=function() {
			if(chk.responseText != "1") {
				alert("오류")
			} else {
				// 장바구니 메시지 띄우기
				document.getElementById("cartLayer").style.visibility="visible";
				
				// 3초 뒤 숨기기
				ss=setTimeout(function(){
					document.getElementById("cartLayer").style.visibility="hidden";
					clearTimeout(ss);
				},3000);
			}
		}
		chk.open("GET","addCart?pcode=${pdto.pcode}&fireWood="+fireWood+"&grill="+grill);
		chk.send();
	}
</script>
</head>
<body>
<section>
	<div></div> <!-- 그림 -->
		<div id="cartLayer">
			현재 상품을 장바구니에 담았습니다. <p>
			<input type="button" value="장바구니로 이동" onclick="location='../member/cartView'">
		</div>
		
		<div id="first">
			<div> 
				<caption> <h3> 어반티지 글램핑 카라반 펜션 </h3> </caption>
					<c:if test="${ok == 0}">
						<img src="../static/jjim1.png" id="heart" onclick="jjimOk()" valign="middle">
					</c:if>
					<c:if test="${ok == 1}">
						<img src="../static/jjim2.png" id="heart" onclick="jjimDel()" valign="middle">
					</c:if>
				
			</div>
			<div> 방문자 리뷰 5,392 </div>
			<div> 숲속의 마을 어빈티지 글램핑 펜션 </div>
			
		<div>
			<tr>
				<td> 거리뷰 </td>
				<td> 공유 </td>
			</tr>
		</div>
		
		<div>
			<input type="button" value="객실예약" onclick="location='../product/productList'">
		</div>
		
	</div> <!-- first close -->
	
	<div id="menu">
		<ul>
			<li> 객실 </li>
			<li> 리뷰 </li>
			<li> Q&A </li>
			<li> 부가 서비스 </li>
		</ul>
	</div> <!-- menu close -->
	
	<div id="second">
		<div>
				<input type="button" value="일정선택 ▽" id="datepicker">
		</div>
		
		<div> <img src="../static/room.png"> </div> 
		
		<div>
				<div> 캠프닉 최대 이용시간 6시간 </div>
				<div> title </div>
				<div> price </div>
		</div>
		
		<div>
				<div> 최대인원 : <!-- 글램핑, 기준 : 2인 (최대 3인) --> <!-- ${max} --> </div>
				<div> 설명 : <!-- 침실 1, 침대 1 -->  </div>
				<div> 영업시간 : <!-- 6시간 이용(오후 03:00 ~ 오후 09:00) --> </div>
		</div>
		
		<!-- 옵션 선택 -->
		<div id="option">
			<h2> 부가 서비스 선택 </h2>
			<div> 픽업 </div>
			<div> 장작 
				<div id="number">
					<img src="../static/minus.png" valign="middle" onclick="minus(0)">
		          	<input type="text" name="quantity" value="0" class="quantity" readonly>
		         	<img src="../static/plus.png" valign="middle" onclick="plus(0)">
		         	<span> price </span>
				</div>
			</div>
			<div> 바베큐 그릴 서비스 
				<div id="number">
					<img src="../static/minus.png" valign="middle" onclick="minus(1)">
		          	<input type="text" name="quantity" value="0" class="quantity" readonly>
		         	<img src="../static/plus.png" valign="middle" onclick="plus(1)">
					<span> price </span>							     		
				</div>
			</div>
		</div>
		
		
		<div>
			<input type="button" value="장바구니 담기" onclick="addCart()"> 
			<input type="button" value="예약" onclick="location='../product/reservation'"> <!-- 기간 보내기 -->
		</div>
		
	</div>	<!-- second close -->
	
	<div id="third"> <!-- reviw 읽어와서 출력 -->
		
	
	</div>
	
	
	
	
</section>

<!-- <script>	
	function reservationCal(y,m,n) {
		
		// 해당 월의 1일 구하기
		if(y == -1) {
			var today=new Date();
			y=today.getFullYear();
			m=today.getMonth();
		}
		
		if(m == -1) {
			y--;
			m=11;
		}
		
		if(m == 12) {
			y++;
			m=0;
		}
		
		var xday=new Date(y,m,1); 
		
		// 1일의 요일
		var yoil=xday.getDay(); // 0~6(일~토)
		
		// 각 월의 기본 일수 설정
		var nums=[31,28,31,30,31,30,31,31,30,31,30,31];
		 
		// 해당 월의 일수
		var chong=nums[m];
		
	  	// 윤년 체크
	    if(m==1) // 2월달인 경우
	   	{
			if( (y%4==0 && y%100!=0) || y%400==0 )
				chong++;
	   	}
		
	  	// 해당 월의 주 계산
	    var ju=Math.ceil((chong+yoil)/7);
	  	
	    var calData="<table  align='center' border='0' id='cal'>";
	    calData=calData+"<caption>";
	    calData=calData+" <a href='javascript:reservationCal("+y+","+(m-1)+","+n+")'> 이전 </a> ";
	    calData=calData+y+"년 "+(m+1)+"월 ";
	    calData=calData+" <a href='javascript:reservationCal("+y+","+(m+1)+","+n+")'> 다음 </a>";
	    calData=calData+" </caption>";
	    calData=calData+"<tr>";
	    calData=calData+" <td> 일 </td>";
	    calData=calData+" <td> 월 </td>";
	    calData=calData+" <td> 화 </td>";
	    calData=calData+" <td> 수 </td>";
	    calData=calData+" <td> 목 </td>";
	    calData=calData+" <td> 금 </td>";
	    calData=calData+" <td> 토 </td>";
	    calData=calData+"</tr>";
	    
	    var day=1;
	    for(i=0;i<ju;i++) { // 주 반복
		    calData=calData+" <tr> ";
		   
		    for(j=0;j<7;j++) { // 요일 반복
			    if( (i==0 && j<yoil) || day>chong ) { // (1주차에 1일의 요일이전) ||  day가 총일수보다 크면
				    calData=calData+" <td> &nbsp; </td>"; // 공백 추가
			    } else {                            // nalJaSend(2025,1,20,0)
				    calData=calData+" <td onclick='nalJaSend("+y+","+m+","+day+","+n+")'> "+day+" </td> ";
				    day++;                     // nalJaSend(0)
			    }			   
		    }	   
		   
		    calData=calData+" </tr> ";
	    }	   
	    calData=calData+" </table> ";
	    
	    document.getElementById("calendar").innerHTML=calData;
	}
</script> -->

<!-- easePick 달력 라이브러리 사용 -->

<!-- CDN 사용 설치 -->
<!-- EasePick CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css">

<!-- EasePick JS -->
<script src="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.umd.min.js"></script>

<!-- EasePick 적용 (초기화 및 설정) -->
<script>
	const allowedDates = [
		'2025-03-01',
        '2025-03-03',
        '2025-03-07',
        '2025-03-11',
        '2025-03-17',
        '2025-03-21',
	]
	
document.addEventListener("DOMContentLoaded", function () {
    const picker = new easepick.create({
        element: document.getElementById('datepicker'),
        css: [
            "https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css"
        ],
        plugins: ["RangePlugin","LockPlugin"], // 범위 선택 기능 활성화
        RangePlugin: {
            tooltip: true // 선택한 날짜 툴팁 표시
        },
        LockPlugin: {
	        format: "YYYY-MM-DD", // 날짜 포맷 설정
	        minDate: new Date(), // 오늘 이전 날짜 선택 불가
	        filter(date, picked) {
	            return allowedDates.includes(date.format('YYYY-MM-DD'));
	        } 
        }
    });
});
</script>
</body>
</html>