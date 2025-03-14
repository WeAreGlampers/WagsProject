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
	#reserveBtn {
		width:100px;
		height:30px;
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
	
	
	for (i=0;i<document.getElementsByClassName("subChk").length;i++) {
		if (document.getElementsByClassName("subChk")[i].checked) {
			pcodes = pcodes + document.getElementsByClassName("pcode")[i].value+",";
			titles = titles + document.getElementsByClassName("title")[i].innerText+",";
			indays = indays + document.getElementsByClassName("inday")[i].innerText+",";
			outdays = outdays + document.getElementsByClassName("outday")[i].innerText+",";
			fireWoods = fireWoods + document.getElementsByClassName("fireWood")[i].innerText+",";
			grills = grills + document.getElementsByClassName("grill")[i].innerText+",";
			fireWoodPrices = fireWoodPrices + document.getElementsByClassName("fireWoodPrice")[i].innerText+",";
			grillPrices = grillPrices + document.getElementsByClassName("grillPrice")[i].innerText+",";
			totalPrices = totalPrices + document.getElementsByClassName("totalPrice")[i].innerText+",";
			roomPrices = roomPrices + document.getElementsByClassName("roomPrice")[i].value+","
		}
	}
	
	location="../product/reservation?pcode="+pcodes+"&title="+titles+"&fireWood="+fireWoods+"&grill="+grills+"&fireWoodPrice="+fireWoodPrices+"&grillPrice="+grillPrices+"&inday="+indays+"&outday="+outdays+"&roomPrice="+roomPrices+"&totalPrice="+totalPrices;
	
}

function cartDel() {
	var subChk = document.getElementsByClassName("subChk");
	var cartId = document.getElementsByClassName("cartId");
	var ids = "";
	for (i=0;i<subChk.length;i++){
		if (subChk[i].checked) {
			ids = ids + cartId[i].value + ",";
		}
	}
	location="cartDel?ids="+ids;
}

window.onload = function() {
	if (document.getElementsByClassName("subChk").length==0) {
		document.getElementById("allChkDiv").style.display="none";
	}
}
</script>
</head>
<body>  <!-- /member/cartView.jsp -->
<div id="allChkDiv"><input type="checkbox" id="allChk" onclick="allCheck(this)">
<input id="reserveBtn" type="button" onclick="reserve()" value="선택예약">
<input type="button" onclick="cartDel()" value="선택삭제">
</div>
<c:forEach items="${cartMap}" var="map">
	<div>
		<input type="hidden" name="id" class="cartId" value="${map.id}">
		<input type="hidden" name="pcode" value="${map.pcode}" class="pcode">
		<input type="hidden" name="roomPrice" value="${map.roomPrice}" class="roomPrice">
		<input type="checkbox" name="subChk" class="subChk" onclick="subCheck()">
		<div class="title">${map.title}</div>
		<div class="pimg"><img src="../static/product/${map.pimg}"></div>
		<div><span class="inday">${map.inday}</span> ~ <span class="outday">${map.outday}</span></div>
		<div>장작<span class="fireWood">${map.fireWood}</span> | <span class="fireWoodPrice"><fmt:formatNumber value="${map.fireWoodPrice}" type="number" pattern="#,###"/></span>원</div>
		<div>바베큐<span class="grill">${map.grill}</span> | <span class="grillPrice"><fmt:formatNumber value="${map.grillPrice}" type="number" pattern="#,###"/></span>원</div>
		<div>기준 ${map.standard}명 / 최대 ${map.max}명 </div>
		<div><span class="totalPrice"><fmt:formatNumber value="${map.totalPrice}" type="number" pattern="#,###"/></span>원</div>
	</div>
	<input type="button" value="삭제" onclick="location='cartDel?ids=${map.id}'">
</c:forEach>


</body>
</html>