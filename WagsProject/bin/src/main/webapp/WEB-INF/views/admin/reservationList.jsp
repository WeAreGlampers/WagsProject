<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
  <table width="800" align="center">
    <caption><h3>예약 관리</h3></caption>
    <tr>
      <td>번호</td>
      <td>예약자</td>
      <td>예약상품</td>
      <td>입실일</td>
      <td>퇴실일</td>
      <td>추가인원</td>
      <td>상태</td>
      <td>변경</td>
    </tr>
    <c:forEach items="${rlist}" var="rdto" varStatus="sts">
      <tr>
        <td>${sts.count}</td>
        <td>${rdto.userid}</td>
        <td>${rdto.title}</td>
        <td>${rdto.inday}</td>
        <td>${rdto.outday}</td>
        <td>${rdto.people}</td>
        <td>
          <c:if test="${rdto.state==0}">
            예약완료
          </c:if>
          <c:if test="${rdto.state==1}">
            3일전
          </c:if>
          <c:if test="${rdto.state==2}">
            2일전
          </c:if>
          <c:if test="${rdto.state==3}">
            1일전
          </c:if>
          <c:if test="${rdto.state==4}">
            예약당일
          </c:if>
          <c:if test="${rdto.state==5}">
            이용완료
          </c:if>
          <c:if test="${rdto.state==6}">
            취소신청
          </c:if>
          <c:if test="${rdto.state==7}">
            취소완료
          </c:if>
        </td>
        <td>
          <c:if test="${rdto.state==0}">
            <input type="button" value="3일전" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
          <c:if test="${rdto.state==1}">
            <input type="button" value="2일전" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
          <c:if test="${rdto.state==2}">
            <input type="button" value="1일전" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
          <c:if test="${rdto.state==3}">
            <input type="button" value="예약당일" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
          <c:if test="${rdto.state==4}">
            <input type="button" value="이용완료" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
          <c:if test="${rdto.state==6}">
            <input type="button" value="취소완료" onclick="location='chgState?id=${rdto.id}'">
          </c:if>
        </td>
      </tr>
    </c:forEach>
  </table>
</section>
</body>
</html>