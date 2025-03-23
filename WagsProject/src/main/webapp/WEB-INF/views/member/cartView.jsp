<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 기존 CSS 유지하면서 수정 */
#allChkDiv {
    width: 800px;
    margin: auto;
    padding: 15px;
    text-align: left;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

#allChk {
    margin-right: 15px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* 체크박스 스타일 */
.subChk {
    margin: 10px;
    left: 10px;
    top: 15px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* 선택예약 버튼과 선택삭제 버튼 통일 */
#reserveBtn, input[type="button"][onclick="cartDel()"] {
    width: 100px;
    height: 36px;
    background: #FFE08C;
    color: #CC723D;
    font-weight: 600;
    border: #FFE08C;
    border-radius: 8px;
    margin-right: 15px;
    cursor: pointer;
    text-align: center;
}

#reserveBtn:hover, input[type="button"][onclick="cartDel()"]:hover {
    text-decoration: underline;
}

/* allChkDiv 안의 요소들 간격 조정 */
#allChkDiv label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin-right: auto;
}

/* 삭제 버튼 스타일 통일 */
form > input[type="button"] {
    width: 100px;
    height: 36px;
    background: #FFE08C;
    color: #CC723D;
    font-weight: 600;
    border: #FFE08C;
    border-radius: 8px;
    margin: 0 auto 30px;
    display: block;
    cursor: pointer;
}

form > input[type="button"]:hover {
    text-decoration: underline;
}
</style>
<script>
function allCheck(my) {
	var subChk = document.getElementsByClassName("subChk");
	if (my.checked) {
		for (i = 0; i < subChk.length; i++) {
			subChk[i].checked = true;
		}
	} else {
		for (i = 0; i < subChk.length; i++) {
			subChk[i].checked = false;
		}
	}
}
function subCheck() {
	var subChk = document.getElementsByClassName("subChk");
	var chkNum = 0;
	for ( i = 0; i < subChk.length; i++) {
		if (subChk[i].checked) {
			chkNum++;
		}
	}
	
	if(subChk.length == chkNum) {
		document.getElementById("allChk").checked=true;
	} else {
		document.getElementById("allChk").checked=false;
	}
}
/*
function reserve() {
	var pcodes = "";
	var titles = "";
	var fireWoods = "";
	var grills = "";
	var fireWoodPrices = "";
	var grillPrices = "";
	var indays = "";
	var outdays = "";
	var roomPrices = "";
	var totalPrices = "";
	var peoples = "";
	
	for (i=0;i<document.getElementsByClassName("subChk").length;i++) {
		if (document.getElementsByClassName("subChk")[i].checked) {
			pcodes = pcodes + document.getElementsByClassName("pcode")[i].value+",";
			titles = titles + document.getElementsByClassName("title")[i].innerText+",";
			indays = indays + document.getElementsByClassName("inday")[i].innerText+",";
			outdays = outdays + document.getElementsByClassName("outday")[i].innerText+",";
			fireWoods = fireWoods + document.getElementsByClassName("fireWood")[i].innerText+",";
			grills = grills + document.getElementsByClassName("grill")[i].innerText+",";
			fireWoodPrices = fireWoodPrices + document.getElementsByClassName("fireWoodPrice")[i].value+",";
			grillPrices = grillPrices + document.getElementsByClassName("grillPrice")[i].value+",";
			totalPrices = totalPrices + document.getElementsByClassName("totalPrice")[i].value+",";
			roomPrices = roomPrices + document.getElementsByClassName("roomPrice")[i].value+","
			peoples = peoples + document.getElementsByClassName("people")[i].value+","
		}
	}
	
	location="../product/reservation?people="+peoples+"&pcode="+pcodes+"&title="+titles+"&fireWood="+fireWoods+"&grill="+grills+"&fireWoodPrice="+fireWoodPrices+"&grillPrice="+grillPrices+"&inday="+indays+"&outday="+outdays+"&roomPrice="+roomPrices+"&totalPrice="+totalPrices;
	
}
*/
function cartDel() {
	var subChk = document.getElementsByClassName("subChk");
	var ids = "";
	for (i=0;i<subChk.length;i++){
		if (subChk[i].checked) {
			ids = ids + subChk[i].value + ",";
		}
	}
	location="cartDel?ids="+ids;
}

window.onpageshow = function() {
	if (document.getElementsByClassName("subChk").length==0) {
		document.getElementById("allChkDiv").style.display="none";
	}
}
</script>
</head>
<body>  <!-- /member/cartView.jsp -->
<form method="post" action="../product/reservation">
<div id="allChkDiv">
  <label for="allChk">
    <input type="checkbox" id="allChk" onclick="allCheck(this)">
    전체선택
  </label>
  <input type="submit" id="reserveBtn" value="선택예약">
  <input type="button" onclick="cartDel()" value="선택삭제">
</div>
<c:forEach items="${cartMap}" var="map">
	<div>
		<input type="checkbox" name="subChk" class="subChk" onclick="subCheck()" value="${map.id}">
		<div class="title">${map.title}</div>
		<div class="pimg"><img src="../static/product/${map.pimg}"></div>
		<div><span class="inday">${map.inday}</span> ~ <span class="outday">${map.outday}</span></div>
		<div>장작<span class="fireWood">${map.fireWood}</span> | <span class="fireWoodPrice1"><fmt:formatNumber value="${map.fireWoodPrice}" type="number" pattern="#,###"/></span>원</div>
		<div>바베큐<span class="grill">${map.grill}</span> | <span class="grillPrice1"><fmt:formatNumber value="${map.grillPrice}" type="number" pattern="#,###"/></span>원</div>
		<div>기준 ${map.standard}명 / 최대 ${map.max}명 </div>
		<div><span class="totalPrice1"><fmt:formatNumber value="${map.totalPrice}" type="number" pattern="#,###"/></span>원</div>
	</div>
	<input type="button" value="삭제" onclick="location='cartDel?ids=${map.id}'">
</c:forEach>
</form>

</body>
</html>