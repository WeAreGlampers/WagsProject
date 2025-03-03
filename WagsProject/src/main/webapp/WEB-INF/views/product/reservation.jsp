<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:1100px;
	margin:auto;
}
#check{
	border:1px solid gray;
	border-radius:3px;
}
#check #content{
	border:1px solid black;
	border-radius:3px;
	height:100px;
	width:400px;
	margin:auto;
	margin-top:20px;
}
#check #content #title{
	line-height:60px;
	font-weight:900px;
	font-size:30px;
}
#price{
	
}
#price #left{
	float:left;
}
#price #right{
	float:right;
}
#price #totalPrice{
	color:red;
	font-size:20px;
	font-weight:800px;
}
</style>
</head>
<body>
<section>
  <div id="check">
    <b>아래내용이 맞는지 확인해주세요</b>
	<div id="content">
		<div id="title">${pdto.title}</div>
		<div id="date">
			일정 ${rdto.inday} ~ ${rdto.outday} ( ${day}박 ${day+1}일 )
		</div> 
	</div>
	<div id="price">  
		<div id="left">${pdto.title}</div>
		<div id="right">${rdto.totalPrice}</div>
		<c:if test="${rdto.fireWood>0 || rdto.grill>0}">
			<hr style="color:gray;">
			<div id="left">옵션</div>
			<c:if test="${rdto.fireWood>0}">
				<div id="left">장작</div>
				<div id="right">
					<fmt:formatNumber value="${fireWood}" type="number" pattern="#,###"/>원
				</div>
			</c:if>
			<c:if test="${rdto.grill>0}">
				<div id="left">바베큐</div>
				<div id="right">
					<fmt:formatNumber value="${grill}" type="number" pattern="#,###"/>원
				</div>
			</c:if>
		</c:if>
		<hr>
		<div style="float:left">결제금액</div>
		<div id="totalPrice">
			<fmt:formatNumber value="${rdto.totalPrice+fireWood+grill}" type="number" pattern="#,###"/>원
		</div>
	</div>
  </div>
</section>
</body>
</html>