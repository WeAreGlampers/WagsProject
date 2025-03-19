<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 현황</title>
<style>
section {
  width:1100px;
  margin:auto;
}
section .reservation-item {
  border:1px solid #ddd;
  width:600px;
  margin:auto;
  margin-bottom:20px;
  padding:15px;
  border-radius:4px;
}
section .reservation-row {
  display:flex;
  padding:8px 0;
  border-bottom:1px solid #eee;
}
section .reservation-row:last-child {
  border-bottom:none;
}
 section .label {
  width:100px;
  font-weight:bold;
  padding-right:15px;
  text-align:right;
}
section .value {
  flex:1;
}
section .reviewWrite {
  width:100px;
  margin:auto;
  margin-top:10px;
}

</style>
</head>
<body> <!-- member/reservationStatus.jsp -->
<section>
  <h2>예약 현황</h2>
  <c:forEach items="${mapList}" var="map">
    <div class="reservation-item">
    
      <div class="reservation-row">
        <div class="label">예약번호:</div>
        <div class="value">${map.jumuncode}</div>
      </div>
      <div class="reservation-row">
        <div class="label">객실명:</div>
        <div class="value">${map.title}</div>
      </div>
      <div class="reservation-row">
        <div class="label">상태:</div>
        <div class="value">${map.stateStr}</div>
      </div>
      <div class="reservation-row">
        <div class="label">기간:</div>
        <div class="value">${map.inday}~${map.outday}</div>
      </div>
      <div class="reservation-row">
        <div class="label">장작:</div>
        <div class="value">${map.fireWood}</div>
      </div>
      <div class="reservation-row">
        <div class="label">그릴:</div>
        <div class="value">${map.grill}</div>
      </div>
      <div class="reservation-row">
        <div class="label">총 금액:</div>
        <div class="value"><fmt:formatNumber value="${map.totalPrice}" type="number" pattern="#,###"/>원</div>
      </div>
      <div class="reservation-row">
        <div class="label">요청사항:</div>
        <div class="value">${map.req}</div>
      </div>
      <c:if test="${map.state == 5}">
      	<c:if test="${map.review == 1}">
      		<div class="reviewWrite"><input type="button" value="리뷰작성완료" disabled></div>
      	</c:if>
      	
      	<c:if test="${map.review == 0}">
      		<div class="reviewWrite"><input type="button" value="리뷰작성" onclick="location='/member/reviewWrite?id=${map.id}'"></div>
      	</c:if>
      </c:if>
      <c:if test="${map.state == 0}">
      		<div class="reviewWrite"><input type="button" value="취소요청" onclick="location='cancel?id=${map.id}'"></div>
      </c:if>
    </div>
  </c:forEach>
</section>
</body>
</html>