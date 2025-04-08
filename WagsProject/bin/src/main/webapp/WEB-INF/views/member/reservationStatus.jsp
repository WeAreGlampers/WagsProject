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
    width: 1100px;
    margin: auto;
    text-align: center;
    padding-bottom: 80px;
    min-height: 800px;
}

section h2 {
    color: #CC723D;
    margin-bottom: 30px;
}

/* 예약 항목 박스 */
.reservation-item {
    border: 2px solid #FFE08C;
    width: 600px;
    margin: auto;
    margin-bottom: 20px;
    padding: 20px;
    border-radius: 8px;
    text-align: left;
}

/* 각 항목 행 */
.reservation-row {
    display: flex;
    padding: 10px 0;
    border-bottom: 1px solid #FFE08C;
}

.reservation-row:last-child {
    border-bottom: none;
}

/* 항목 레이블 */
.label {
    width: 100px;
    font-weight: bold;
    padding-right: 15px;
    text-align: right;
    color: #CC723D;
}

/* 항목 값 */
.value {
    flex: 1;
}

/* 리뷰 작성 및 취소 버튼 영역 */
.reviewWrite {
    width: 100px;
    margin: auto;
    margin-top: 15px;
    text-align: center;
}

/* 버튼 스타일 */
.reviewWrite input[type="button"] {
    width: 100px;
    height: 30px;
    background: #FFE08C;
    color: #CC723D;
    font-weight: 600;
    border: #FFE08C;
    border-radius: 8px;
    cursor: pointer;
}

.reviewWrite input[type="button"]:hover {
    text-decoration: underline;
}

/* 비활성화된 버튼 스타일 */
.reviewWrite input[type="button"]:disabled {
    background: #f0f0f0;
    color: #999;
    cursor: default;
    text-decoration: none;
}

/* 추가 스타일 - 금액 강조 */
.price-value {
    color: #CC723D;
    font-weight: bold;
}

/* 기간 표시 스타일 */
.date-range {
    font-weight: 500;
}

/* 상태 표시 스타일 */
.status-text {
    font-weight: bold;
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