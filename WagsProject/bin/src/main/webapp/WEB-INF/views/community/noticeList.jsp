<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<section>
  <table width="800" align="center">
  <caption><h3>공지사항</h3></caption>
    <tr>
      <td>번호</td>
      <td>제목</td>
      <td>작성자</td>
      <td>작성일</td>
    </tr>
    <c:forEach items="${nlist}" var="ndto" varStatus="sts">
      <tr>
        <td>${sts.count}</td>
        <td><a href="noticeContent?id=${ndto.id}">${ndto.title}</a></td>
        <td>관리자</td>
        <td>${ndto.writeday}</td>
      </tr>
    </c:forEach>
  </table>
</section>
</body>
</html>