<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

body {
    font-family: 'Noto Sans KR', sans-serif;
    background-color: #f8f9fa;
    color: #333;
    margin: 0;
    padding: 0;
}

section {
    width: 1150px;
    margin: 40px auto;
    background: #fff;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

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

a {
	text-decoration:none;
	color:black;
}

input[type="button"] {
	background: #FFE08C;
    color: #CC723D;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
}

input[type="button"]:hover {
    background: #0056b3;
}

input[type="submit"] {
	background: #FFE08C;
    color: #CC723D;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
}

input[type="submit"]:hover {
    background: #0056b3;
}

.quantity {
    width: 40px;
    text-align: center;
    border: none;
    font-size: 16px;
    background: transparent; /* 배경 투명 */
}

section #cartLayer {
	position:absolute;
	visibility:hidden;
}

section .number {
	width:400px;
	margin:auto; /* 중앙 정렬 */
	border:1px solid red;
}

</style>
<script>

	// 수량 빼기
	function minus(n) {
		var quantity=document.getElementsByClassName("quantity")[n];
		var optionPrice=document.getElementsByClassName("optionPrice")[n];
		//alert(n+" "+quantity.value)
		//alert(--quantity.value);
		if(quantity.value > 0) {
			quantity.value = --quantity.value;
			optionPrice.textContent =  quantity.value * 20000;
		}
	}
	
	// 수량 더하기
	function plus(n) {
		var quantity=document.getElementsByClassName("quantity")[n];
		var optionPrice=document.getElementsByClassName("optionPrice")[n];

		quantity.value = ++quantity.value;
		optionPrice.innerText = quantity.value * 20000;
	}
	
	// 장바구니에 상품 추가
	function addCart() { 
		// 수량
		var fireWood=document.getElementsByClassName("quantity")[0].value;
		var grill=document.getElementsByClassName("quantity")[1].value;
		// 가격
		var fireWoodPrice= parseInt(document.getElementById("fireWoodPrice").innerText);
		var grillPrice= parseInt(document.getElementById("grillPrice").innerText);
		// 제목, 숙박기간, 방가격
		var title=document.getElementById("title").innerText;
		var date=document.getElementById("datepicker").value;
		var roomPrice=parseInt(document.getElementById("roomPrice").innerText);
		
		alert("addCart?pcode=p0101&fireWood="+fireWood+"&grill="+grill+"&fireWoodPrice="+fireWoodPrice+"&grillPrice="+grillPrice+"&title="+title+"&date="+date+"&roomPrice="+roomPrice);
		
		var chk=new XMLHttpRequest();
		chk.onload=function() {
			if(chk.responseText.trim() != "1") {
				alert("오류");
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
		chk.open("GET","addCart?pcode=${pdto.pcode}&fireWood="+fireWood+"&grill="+grill+"&fireWoodPrice="+fireWoodPrice+"&grillPrice="+grillPrice+"&title="+title+"&date="+date+"&roomPrice="+roomPrice); 
		chk.send();
	}
	
	// 찜 안 됐을 때 클릭(찜 상태로 변경)
	function dibsOk() {
		// 로그인 상태
		<c:if test="${userid != null}">
				
			var chk = new XMLHttpRequest();
			chk.onload=function() {
				if(chk.responseText == "0") {
					location="../login/login";
				} else {
					document.getElementById("heart").src="../static/jjim2.png";
					document.getElementById("heart").setAttribute("onclick","dibsDel()");
				}
			}
			chk.open("GET","dibsOk?pcode=${pdto.pcode}");
			chk.send();
			
		</c:if>

		// 비로그인 상태
		<c:if test="${userid == null}">
			location="../login/login";
		</c:if>
	}
	
	// 찜 됐을 때 클릭(찜 안됐을 때로 변경)
	function dibsDel() {
		var chk= new XMLHttpRequest();
		chk.onload=function() {
			if(chk.responseText == "0") {
				location="../login/login";
			} else {
				document.getElementById("heart").src="../static/jjim1.png";
				document.getElementById("heart").setAttribute("onclick","dibsOk()");
			}		
		}
		chk.open("GET","dibsDel?pcode=${pdto.pcode}");
		chk.send();
	}
	
	function reservationChk() {
		
		if(document.getElementById("datepicker").value == "일정선택 ▽") {
			alert("날짜를 선택해주세요!");
			return false;
		} else {
			return true;
		}
		
	}
	
</script>
</head>
<body>
<section>
	<div></div> <!-- 그림 -->
	<form method="post" action="reservation" onsubmit="return reservationChk()">
	<input type="hidden" name="chk" value="1">
	<input type="hidden" name="pcode" value="${pdto.pcode}">
	<input type="hidden" name="title" value="${pdto.title}">
	<input type="hidden" name="roomPrice" value="${pdto.price}">
		<div id="cartLayer">
			현재 상품을 장바구니에 담았습니다. <p>
			<input type="button" value="장바구니로 이동" onclick="location='../member/cartView'">
		</div>
		
		<div id="first">
			<div> 
				<h3> <span id="title"> ${pdto.title} </span> 
					<c:if test="${ok == 0}">
						<img src="../static/jjim1.png" id="heart" onclick="dibsOk()" valign="middle">
					</c:if>
					<c:if test="${ok == 1}">
						<img src="../static/jjim2.png" id="heart" onclick="dibsDel()" valign="middle">
					</c:if>
				</h3>
				<div id="roomPrice"> ${pdto.price} </div> 원
				<div> 기준 : ${pdto.standard}인 (최대 ${pdto.max}인) --> </div>
			</div>
			<tr>
				<td> 거리뷰 </td>
				<td> 공유 </td>
			</tr>
		
		<div>
			<input type="button" value="객실예약" onclick="location='productList'">
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
				<input type="button" name="inday" value="일정선택 ▽" id="datepicker">
		</div>
		
		<div> <img src="../static/room.png"> </div> 
		
		<!-- 옵션 선택 -->
		<div id="option">
			<h2> 부가 서비스 선택 </h2>
			<div> 
			<span> 장작 </span> 
				<div class="number">
					<img src="../static/minus.png" valign="middle" onclick="minus(0)">
		          	<input type="text" name="fireWood" value="0" class="quantity" readonly>
		         	<img src="../static/plus.png" valign="middle" onclick="plus(0)">
		         	가격(인당 20,000원) : <span class="optionPrice" name="fireWoodPrice" id="fireWoodPrice"> 0 </span> 원  
				</div>
			
			<span> 바베큐 그릴 서비스 </span> 
				<div class="number">
					<img src="../static/minus.png" valign="middle" onclick="minus(1)">
		          	<input type="text" name="grill" value="0" class="quantity" readonly>
		         	<img src="../static/plus.png" valign="middle" onclick="plus(1)">
					가격(인당 20,000원) : <span class="optionPrice" name="grillPrice" id="grillPrice"> 0 </span> 원 					     		
				</div>
			</div>
		</div>
		
		
		<div>
			<input type="button" value="장바구니 담기" onclick="addCart()">  
			<!-- 기간 + 기간에 따른 요금 + pcode + fireWood + grill -->
				<input type="submit" value="예약"> 
		</div>
		
	</div>	<!-- second close -->
	</form> <!-- form close -->
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