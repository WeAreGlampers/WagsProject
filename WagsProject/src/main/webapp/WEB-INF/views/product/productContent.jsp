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
	position: relative;
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
	text-decoration: none;
	color: black;
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
	position: absolute;
	visibility: hidden;
	background: #CC723D;
	color: #fff;
	padding: 10px;
	border-radius: 5px;
	top: 83%; /* 버튼 위에 나타나게 위치 조정 */
	left: 50%;
	transform: translateX(-50%);
	z-index: 1000; /* 버튼보다 위로 보이도록 설정 */
}

section .number {
	width: 400px;
	margin: auto; /* 중앙 정렬 */
	border: 1px solid red;
}

section #datepicker {
	width: 150px;
	background: #FFE08C;
	color: #CC723D;
	border: none;
	padding: 10px 20px;
	border-radius: 5px;
	font-size: 16px;
	cursor: pointer;
	transition: background 0.3s;
	text-align: center;
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
				alert("날짜를 선택해주세요!");
			} else {
				// 장바구니 메시지 띄우기
				document.getElementById("cartLayer").style.visibility="visible";
				alert("cartLayer 보이기 실행됨");
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
		var fireWoodPrice1 = document.getElementById("fireWoodPrice").innerText;
		var grillPrice1 = document.getElementById("fireWoodPrice").innerText;
		document.rform.fireWoodPrice.value = fireWoodPrice1;
		document.rform.grillPrice.value = grillPrice1;
		
		if(document.getElementById("datepicker").value == "일정선택 ▽") {
			alert("날짜를 선택해주세요!");
			return false;
		} else {
			alert(document.rform.inday.value);
			return true;
		}
		
	}
	
</script>
</head>
<body>
<section>
	<div></div> <!-- 그림 -->
	<form name="rform" method="post" action="reservation" onsubmit="return reservationChk()">
	<input type="hidden" name="chk" value="1">
	<input type="hidden" name="pcode" value="${pdto.pcode}">
	<input type="hidden" name="title" value="${pdto.title}">
	<input type="hidden" name="roomPrice" value="${pdto.price}">
	<input type="hidden" name="fireWoodPrice">
	<input type="hidden" name="grillPrice">
		
		
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
				<span id="roomPrice"> ${pdto.price} </span> 원
				<div> 기준 : ${pdto.standard}인 (최대 ${pdto.max}인) --> </div>
			</div>
			<!-- <div id="map" style="width:100%;height:400px;"> 거리뷰 </div> -->
		
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
				<input type="text" name="inday" value="일정선택 ▽" id="datepicker">
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
			<div id="cartLayer">
			현재 상품을 장바구니에 담았습니다. <p>
			<input type="button" value="장바구니로 이동" onclick="location='../member/cartView'">
			</div>
			<input type="button" value="장바구니 담기" onclick="addCart()">  
			<!-- 기간 + 기간에 따른 요금 + pcode + fireWood + grill -->
				<input type="submit" value="예약"> 
		</div>
		
		<!-- <input type="button" value="버튼" onclick="UnavailableDates('${pdto.pcode}')"> --> 
	</div>	<!-- second close -->
	</form> <!-- form close -->
	
	<%-- <form method="post" action="qnaWriteOk">
		<input type="hidden" name="pcode" value="${pdto.pcode}">
		<input type="button" value="작성">
	</form> --%>
	
	<div id="third">
		<h3> 상품평 </h3>
		<div> 
			<c:forEach begin="1" end="${pdto.Ystar}">
				<img src="../static/star1.png">
			</c:forEach>
			<c:forEach begin="1" end="${pdto.hstar}">
				<img src="../static/star3.png">
			</c:forEach>
			<c:forEach begin="1" end="${pdto.Gstar}">
				<img src="../static/star2.png">
			</c:forEach>
			${pdto.review}개 상품평
		</div>
		
		<c:forEach items="${rlist}" var="rdto">
			
		
		
		</c:forEach>
		
	
	
	
	</div>
	
</section>

<!-- easePick 달력 라이브러리 사용 -->

<!-- CDN 사용 설치 -->
<!-- EasePick CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css">

<!-- EasePick JS -->
<script src="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.umd.min.js"></script>

<!-- EasePick 적용 (초기화 및 설정) -->
	<script>
      const DateTime = easepick.DateTime;
      const bookedDates = [ 
    	  	${test}
    	  ].map(d => {
          if (d instanceof Array) {
            const start = new DateTime(d[0], 'YYYY-MM-DD');
            const end = new DateTime(d[1], 'YYYY-MM-DD');

            return [start, end];
          }

          return new DateTime(d, 'YYYY-MM-DD');
      });
      const picker = new easepick.create({
        element: document.getElementById('datepicker'),
        css: [
          'https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css',
          'https://easepick.com/css/demo_hotelcal.css',
        ],
        plugins: ['RangePlugin', 'LockPlugin'],
        RangePlugin: {
          tooltipNumber(num) {
            return num - 1;
          },
          locale: {
            one: 'night',
            other: 'nights',
          },
        },
        LockPlugin: {
          minDate: new Date(),
          minDays: 2,
          inseparable: true,
          filter(date, picked) {
            if (picked.length === 1) {
              const incl = date.isBefore(picked[0]) ? '[)' : '(]';
              return !picked[0].isSame(date, 'day') && date.inArray(bookedDates, incl);
            }

            return date.inArray(bookedDates, '[)');
          },
        }
      });
    </script>

</body>
</html>