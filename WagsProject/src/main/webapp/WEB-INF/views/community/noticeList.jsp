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
section {
  width: 1100px;
  margin: auto;
  padding: 20px 0;
  min-height: 600px;
}

section h3 {
  text-align: center;
  margin-bottom: 30px;
  color: #333;
}

table {
  width: 800px;
  margin: auto;
  border-collapse: collapse;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  border-radius: 4px;
  overflow: hidden;
  margin-bottom:30px;
}

caption {
  font-size: 24px;
  margin-bottom: 15px;
  font-weight: bold;
  color: #333;
}

tr:first-child {
  background-color: #FFF6E0;
  color: #333;
  font-weight: bold;
}

tr:not(:first-child):not(:last-child):hover {
  background-color: #FFF6E0;
}

tr:last-child {
  background-color: #FFF6E0;
}

td {
  padding: 12px 15px;
  border-bottom: 1px solid #eee;
}

td:nth-child(2) {
  text-align: left;
}

td a {
  color: #333;
  text-decoration: none;
}

td a:hover {
  text-decoration: underline;
  color: #555;
}

.pagination {
  text-align: center;
  padding: 10px 0;
}

.pagination a {
  display: inline-block;
  padding: 5px 10px;
  margin: 0 3px;
  border-radius: 3px;
  text-decoration: none;
  color: #333;
}

.pagination a:hover {
  background-color: #f5f5f5;
}

.pagination .current {
  background-color: #f0f0f0;
  font-weight: bold;
}

.pagination .nav-btn {
  background-color: #f9f9f9;
  border: 1px solid #eee;
}
</style>
</head>
<body>
<section>
  <table width="800" align="center">
  <caption><h3>공지사항</h3></caption>
    <tr>
      <td>번호</td>
      <td style="text-align:center;">제목</td>
      <td>작성자</td>
      <td>작성일</td>
    </tr>
    <c:set var="num" value="${index+1}"/>
    <c:forEach items="${nlist}" var="ndto">
      <tr>
        <td>${num}</td>
        <td><a href="noticeContent?id=${ndto.id}&page=${page}">${ndto.title}</a></td>
        <td>관리자</td>
        <td>${ndto.writeday}</td>
      </tr>
      <c:set var="num" value="${num+1}"/>
    </c:forEach>
    <tr>
   	  <td colspan="4">
   	  <c:if test="${page!=1}">
   	    <a href="noticeList?page=${page-1}" style="color:#333;">이전</a>
   	  </c:if>
   	  <c:forEach begin="${pstart}" end="${pend}" var="i">
   	    <c:if test="${page==i}">
   	      <a href="noticeList?page=${i}" style="color:#CC723D;">${i}</a>
   	    </c:if>
   	    <c:if test="${page!=i}">
   	      <a href="noticeList?page=${i}" style="color:#333;">${i}</a>
   	    </c:if>
   	  </c:forEach>
   	  <c:if test="${page!=totalPages}">
   	    <a href="noticeList?page=${page+1}" style="color:#333;">다음</a>
   	  </c:if>
   	  </td>
    </tr>
  </table>
</section>
</body>
</html>