<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	alert(document.getElementsByClassName("title")[0].innerText);
	
	
}
	
</script>
</head>
<body>  <!-- /member/cartView.jsp -->
<input type="checkbox" id="allChk" onclick="allCheck(this)">
<input type="button" onclick="reserve()" value="선택예약">
<c:forEach items="${cartMap}" var="map">
	<div>
		<input type="checkbox" name="subChk" class="subChk" onclick="subCheck()">
		<div class="title">${map.title}</div>
		<div class="pimg">${map.pimg}</div>
		<div><span>${map.inday}</span> ~ <span>${map.outday}</span></div>
		<div>장작${map.fireWood} | ${map.fireWoodPrice}원</div>
		<div>바베큐${map.grill} | ${map.grillPrice}원</div>
		<div>기준 ${map.standard}명 / 최대 ${map.max}명 </div>
		<div>${map.totalPrice}원</div>
	</div>
</c:forEach>


</body>
</html>