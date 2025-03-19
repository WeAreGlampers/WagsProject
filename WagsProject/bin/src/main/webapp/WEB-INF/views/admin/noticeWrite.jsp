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
 <form method="post" action="noticeWriteOk">
  <table width="600" align="center">
  <caption><h3>글쓰기</h3></caption>
    <tr>
      <td>제목</td>
      <td><input type="text" name="title" size="50"></td>
    </tr>
    <tr>
      <td>작성자</td>
      <td>관리자</td>
    </tr>
    <tr>
      <td>내용</td>
      <td><textarea name="content" cols="52" rows="5"></textarea></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="button" value="취소" onclick="location='noticeList'">
        <input type="submit" value="글쓰기">
      </td>
    </tr>
  </table>
 </form>
</section>
</body>
</html>