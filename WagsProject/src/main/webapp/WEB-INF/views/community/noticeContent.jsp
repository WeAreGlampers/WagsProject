<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	margin-bottom:30px;
}
table{
	border-collapse: collapse;
	margin-bottom:20px;
}
caption{
	color: #CC723D;
}
table tr{
	height:50px;
}
table tr:nth-child(4){
 	height:100px;
}
td {
    padding: 10px;
    border: 1px solid #FFE08C;
}
input[type=button]{
	background:#FFE08C;
	border:1px solid #FFE08C;
	color:#CC723D;
	border-radius:5px;
	font-size:17px;
	font-weight:bold;
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
  </table>
  <div>
  	<input type="button" value="목록" onclick="location='noticeList?page=${page}'">
  </div>
</section>
</body>
</html>