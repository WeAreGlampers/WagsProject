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
	<form method="post" action="writeOk">
		<table align="center" width="700">
			<input type="hidden" name="userid" value="${userid}">
			<caption> <h3> 글 작성 </h3> </caption>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"></td>
			</tr>
			<tr>
				<td>작성자</td>
				<td> ${userid} </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pwd" id="pwd"></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="content" id="content"> </textarea></td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="저장"></td>
			</tr>


		</table>
	</form>


</body>
</html>