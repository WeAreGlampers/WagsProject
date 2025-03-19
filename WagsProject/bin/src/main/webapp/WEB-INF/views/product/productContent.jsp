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
#datepicker {
	background: #FFE08C;
    color: #CC723D;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    font-size: 16px;
    cursor: pointer;
    transition: background 0.3s;
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
    margin-top:15px;
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

section #third .inReview {
	width: 1080px;
	height: 150px;
	overflow: auto;
	border: 1px solid black;
	margin-top: 20px;
	padding: 10px;
}

section #third .inReview #userid {
	font-size: 17px;
	font-weight: 900;
	margin-top: 10px;
}

section #third .inReview #title {
	font-weight: 900;
	margin-top: 10px;
}

section #third .inReview #content {
	margin-top: 10px;
}

section #fourth {
    width: 1100px;
    margin: 40px auto 20px;
    border-top: 1px solid #ddd;
    padding-top: 20px;
}

section #fourth #left {
    float: left;
    width: 50%;
}

section #fourth #right {
    float: right;
    width: 50%;
    text-align: right;
    margin-top: 20px;
}

section #fourth table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
    clear: both;
}

section #fourth table tr {
    border-bottom: 1px solid #eee;
}

section #fourth table td {
    padding: 12px 10px;
}

section #fourth #q {
    background: #FFE08C;
    color: #CC723D;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
}

section #fourth #a {
    background: #f0f0f0;
    color: #666;
    padding: 5px 10px;
    border-radius: 5px;
    font-weight: bold;
}

#space1, #space2, #space3 {
	width: 1100px;
	height: 60px;
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
				//alert("cartLayer 보이기 실행됨");
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
	
	// QnA 레이어 표시
	function showQnA() {
	    document.getElementById("qnaLayer").style.display = "block";
	    document.getElementById("overlay").style.display = "block";
	    document.getElementById("qnaTitle").value="";
	    document.getElementById("qnaContent").value="";
	    document.getElementById("secret").checked=false;
	    
	    document.body.style.overflow = "hidden"; // 스크롤 방지
	}

	// QnA 레이어 닫기
	function closeQnA() {
	    document.getElementById("qnaLayer").style.display = "none";
	    document.getElementById("overlay").style.display = "none";
	    document.body.style.overflow = "auto"; // 스크롤 허용
	}
	function chgSecretValue() {
		var secretCheckbox = document.getElementById("secret");
		var secret = document.getElementById("secretValue");
	    if(secretCheckbox.checked) {
	    	secret.value = "1";
	    } else {
	    	secret.value = "0";
	    }
	}
	
	// QnA 제출 처리
	function submitQnA() {
	    var qnaType = document.getElementById("qnaType").value;
	    var qnaTitle = document.getElementById("qnaTitle").value;
	    var qnaContent = document.getElementById("qnaContent").value;
	    
	      
	    
	    if(qnaType == "") {
	        alert("문의 유형을 선택해주세요.");
	        return false;
	    } else if (qnaTitle.trim() == "") {
	        alert("제목을 입력해주세요.");
	        return false;
	    } else if(qnaContent.trim() == "") {
	        alert("문의 내용을 입력해주세요.");
	        return false;
	    } else {
	    	alert("문의가 등록되었습니다.");
	    	return true;
	    }
	    closeQnA();
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
			<li> <a href="#space1"> 객실 </a> </li>
			<li> <a href="#space2"> 리뷰 </a> </li>
			<li> <a href="#space3"> Q&A </a> </li>
			<li> 부가 서비스 </li>
		</ul>
	</div> <!-- menu close -->
	

	<div id="second">
		<div id="space1">&nbsp;</div>
		<div>

				<input type="text" name="inday" value="일정선택 ▽" id="datepicker" readonly>
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
		
	</div>	<!-- second close -->

	
	</form>
	<!-- QnA -->
<form method="post" action="qnaWriteOk" onsubmit="return submitQnA()">
<input type="hidden" name="pcode" value="${pdto.pcode}">
<input type="hidden" name="secret" id="secretValue" value="0">
<div id="qnaLayer" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); width:600px; background:#fff; border-radius:10px; box-shadow:0 0 15px rgba(0,0,0,0.3); z-index:1000; padding:20px;">
    <div style="display:flex; justify-content:space-between; align-items:center; margin-bottom:15px;">
        <h3 style="margin:0; color:#CC723D;">Q&A 문의하기</h3>
        <img src="../static/close.png" onclick="closeQnA()" style="width:20px; height:20px; cursor:pointer;">
    </div>
    <div style="margin-bottom:15px;">
        <select name="type" id="qnaType" style="width:100%; padding:10px; border:2px solid #FFE08C; border-radius:5px; outline:none;">
            <option value="">문의 유형을 선택해주세요</option>
            <option value="0">예약 관련</option>
            <option value="1">시설 관련</option>
            <option value="2">서비스 관련</option>
            <option value="3">기타 문의</option>
        </select>
    </div>
    <div style="margin-bottom:15px;">
        <input type="text" name="qtitle" id="qnaTitle" placeholder="제목" style="width:100%; padding:10px; border:2px solid #FFE08C; border-radius:5px; outline:none; box-sizing:border-box;">
    </div>
    <div style="margin-bottom:15px;">
        <textarea name="content" id="qnaContent" placeholder="문의 내용을 입력해주세요" style="width:100%; height:150px; padding:10px; border:2px solid #FFE08C; border-radius:5px; outline:none; resize:none; box-sizing:border-box;"></textarea>
    </div>
    <div style="margin-bottom:15px;">
        <label style="display:block; margin-bottom:5px;">
            <input type="checkbox" id="secret" onchange="chgSecretValue()"> 비밀글로 문의하기
        </label>
    </div>
    <div style="text-align:center;">
        <input type="submit" value="문의하기" style="background:#FFE08C; color:#CC723D; border:none; padding:10px 20px; border-radius:5px; font-size:16px; cursor:pointer;">
    </div>
</div>


<div id="overlay" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%; background:rgba(0,0,0,0.5); z-index:999;"></div>


</form> <!-- form close -->
	
	<div id="third">
		<div id="space2">&nbsp;</div>
		<h3> 상품평 </h3>
		<div> 
			<c:forEach begin="1" end="${pdto.ystar}">
				<img src="../static/star1.png" width="30" valign="middle">
			</c:forEach>
			<c:forEach begin="1" end="${pdto.hstar}">
				<img src="../static/star3.png" width="30" valign="middle">
			</c:forEach>
			<c:forEach begin="1" end="${pdto.gstar}">
				<img src="../static/star2.png" width="30" valign="middle">
			</c:forEach>
			${pdto.review}개 상품평
		</div>
		<!-- 개인 -->
		<c:forEach items="${reviewList}" var="rdto">
		<div class="inReview">
			<div >
				<!-- 노란별 출력 -->
				<c:forEach begin="1" end="${rdto.star}">
					<img src="../static/star1.png" width="20">
				</c:forEach>
				<c:forEach begin="1" end="${5-rdto.star}">
					<img src="../static/star2.png" width="20">
				</c:forEach>
				(${rdto.writeday})
			</div>
			<div id="userid"> ${rdto.userid} </div>
			<div id="title"> ${rdto.title} </div>
			<div id="content"> ${rdto.content} </div>
				<div id="upDel" align="right">
					<c:if test="${userid != rdto.userid}">
						신고하기
					</c:if>
					<c:if test="${userid == rdto.userid}">
						<a href="../member/reviewUpdate?id=${rdto.id}&pcode=${rdto.pcode}"> 수정 </a> |
						<a href="../member/reviewDelete?id=${rdto.id}&pcode=${rdto.pcode}&rid=${rdto.rid}"> 삭제 </a>
					</c:if>	
				</div>
				
			</div>
		</c:forEach>
	</div> <!-- review 끝 -->
	
	<div id="fourth"> <!-- qna -->
			<div id="space3">&nbsp;</div>
			<div>
				<div id="left"> <h3> 상품문의 </h3> </div>
				<div id="right"><input type="button" value="문의하기" onclick="showQnA()"></div>
			</div>
				<div>
				<table width="1100" align="center">
					<c:forEach items="${qlist}" var="qdto">
						<tr>
							<td width="100">
								<c:if test="${qdto.qna==1}">
									<span id="q">질문</span>
								</c:if> 
								<c:if test="${qdto.qna==2}"> 
			              			-> <span id="a">답변</span>
								</c:if>
							</td>
							<td width="100">${qdto.userid}</td> 
							<td>${qdto.content}</td>
							<td width="180" align="center">${qdto.writeday} 
								<c:if test="${userid==qdto.userid}">
									<input type="button" value="삭제" onclick="location='qnaDel?id=${qdto.id}&pcode=${qdto.pcode}&ref=${qdto.ref}'">
								</c:if>
							</td> 
						</tr>
					</c:forEach>
				</table>
			</div> 
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