<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
</style>
</head>
<body>
<section>
  <table width="800" align="center">
    <caption><h3>상품관리</h3></caption>
    <tr>
      <td colspan="6" align="right">
        <input type="button" value="상품추가" onclick="location='productWrite'">
      </td>
    </tr>
    <tr>
      <td>번호</td>
      <td>상품명</td>
      <td>가격</td>
      <td>기준인원</td>
      <td>최대인원</td>
      <td>수정/삭제</td>
    </tr>
    <c:forEach items="${plist}" var="pdto" varStatus="sts">
     <tr>
      <td>${sts.count}</td>
      <td>${pdto.title}</td>
      <td>${pdto.price}</td>
      <td>${pdto.standard}</td>
      <td>${pdto.max}</td>
      <td>
        <input type="button" value="수정" onclick="location='productUpdate?id=${pdto.id}'">
        <input type="button" value="삭제" onclick="location='productDelete?id=${pdto.id}'">
      </td>
     </tr>
    </c:forEach>
  </table>
</section>
</body>
</html>