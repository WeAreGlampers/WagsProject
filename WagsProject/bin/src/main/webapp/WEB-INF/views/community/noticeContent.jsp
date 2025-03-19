<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table tr{
	height:50px;
}
table tr:nth-child(4){
 	height:100px;
}
</style>
</head>
<body>
<section>
  <table width="600" align="center">
  <caption><h3>공지사항</h3></caption>
    <tr>
      <td>제목</td>
      <td>${ndto.title}</td>
    </tr>
    <tr>
      <td>작성자</td>
      <td>관리자</td>
    </tr>
    <tr>
      <td>작성일</td>
      <td>${ndto.writeday}</td>
    </tr>
    <tr>
      <td>내용</td>
      <td>${ndto.content}</td>
    </tr>
    <tr>
      <td colspan="2"><a href="noticeList">목록</a></td>
    </tr>
  </table>
</section>
</body>
</html>