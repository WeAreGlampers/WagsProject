<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 리뷰 목록</title>
<style>
section {
  width: 1100px;
  margin: auto;
}
section h2 {
  text-align: center;
  margin-bottom: 30px;
}
section .review-item {
  border: 1px solid #ddd;
  width: 600px;
  margin: auto;
  margin-bottom: 20px;
  padding: 15px;
  border-radius: 4px;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
}
section .review-row {
  display: flex;
  padding: 8px 0;
  border-bottom: 1px solid #eee;
}
section .review-row:last-child {
  border-bottom: none;
}
section .label {
  width: 100px;
  font-weight: bold;
  padding-right: 15px;
  text-align: right;
}
section .value {
  flex: 1;
}
section .stars {
  display: flex;
  align-items: center;
}
section .stars img {
  width: 20px;
  height: 20px;
  margin-right: 3px;
}
section .content-box {
  background-color: #f9f9f9;
  padding: 10px;
  border-radius: 4px;
  margin-top: 5px;
}
section .delete-btn {
  text-align: right;
  margin-top: 10px;
}
section .delete-btn input {
  background-color: #cccccc;
  color: white;
  border: none;
  padding: 5px 10px;
  border-radius: 3px;
  cursor: pointer;
}
section .delete-btn input:hover {
  background-color: #d32f2f;
}
</style>
</head>
<body> <!-- /member/reviewList.jsp -->
<section>
  <h2>리뷰 관리</h2>
  
  <c:forEach items="${reviewList}" var="map">
    <div class="review-item">
      <div class="review-row">
        <div class="label">이용 상품:</div>
        <div class="value">${map.ptitle}</div>
      </div>
      <div class="review-row">
        <div class="label">제목:</div>
        <div class="value">${map.title}</div>
      </div>
      <div class="review-row">
        <div class="label">내용:</div>
        <div class="value">
          <div class="content-box">${map.content}</div>
        </div>
      </div>
      <div class="review-row">
        <div class="label">작성일:</div>
        <div class="value">${map.writeday}</div>
      </div>
      <div class="review-row">
        <div class="label">별점:</div>
        <div class="value">
          <div class="stars">
            <c:forEach begin="1" end="${map.star}">
              <img src="../static/star1.png">
            </c:forEach>
            <c:forEach begin="${map.star+1}" end="5">
              <img src="../static/star2.png">
            </c:forEach>
          </div>
        </div>
      </div>
      <div class="delete-btn">
      	<input type="button" value="수정" onclick="location='/member/reviewUpdate?id=${map.id}&rid=${map.rid}'">
        <input type="button" value="삭제" onclick="location='/member/reviewDelete?id=${map.id}&pcode=${map.pcode}&rid=${map.rid}'">
      </div>
    </div>
  </c:forEach>
  
  <c:if test="${empty reviewList}">
    <div style="text-align: center; margin-top: 50px; color: #888;">
      작성한 리뷰가 없습니다.
    </div>
  </c:if>
</section>
</body>
</html>