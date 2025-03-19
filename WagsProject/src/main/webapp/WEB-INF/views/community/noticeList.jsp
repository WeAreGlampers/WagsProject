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
	height:600px;
}
table{
	border-collapse: collapse;
}
caption{
	color: #CC723D;
}
tr:first-child {
    color: #CC723D;
    font-weight: bold;
    background:#FFE08C;
}
tr:last-child {
    background:#FFE08C;
    
}
td {
    padding: 10px;
    border-bottom: 1px solid #FFE08C;
}
td:nth-child(2) {
    text-align: left;
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
   	    <a href="noticeList?page=${page-1}" style="color:#CC723D;">이전</a>
   	  </c:if>
   	  <c:forEach begin="${pstart}" end="${pend}" var="i">
   	    <c:if test="${page==i}">
   	      <a href="noticeList?page=${i}">${i}</a>
   	    </c:if>
   	    <c:if test="${page!=i}">
   	      <a href="noticeList?page=${i}" style="color:#CC723D;">${i}</a>
   	    </c:if>
   	  </c:forEach>
   	  <c:if test="${page!=totalPages}">
   	    <a href="noticeList?page=${page+1}" style="color:#CC723D;">다음</a>
   	  </c:if>
   	  </td>
    </tr>
  </table>
</section>
</body>
</html>