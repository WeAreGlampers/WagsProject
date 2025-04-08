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
	<form method="post" action="updateOk">
	<input type="hidden" name="id" value="${bdto.id}">
	<input type="hidden" name="page" value="${page}">
		<table align="center" width="700">
			<caption> <h3> 글 수정 </h3> </caption>
			<tr>
				<td>제목</td>
				<td> <input type="text" name="title" value="${bdto.title}"> </td>
			</tr>
			<tr>
				<td>작성자</td>
				<td> ${bdto.userid} </td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td> <input type="password" name="pwd"> </td>
				<c:if test="${param.err == 1}">
					<td style="font-size:12px; color:red;"> 비밀번호가 일치하지 않습니다.  </td>
				</c:if>
			</tr>
			
			<tr>
				<td>조회수</td>
				<td> ${bdto.views} </td>
			</tr>
			<tr>
				<td>내용</td>
				<td> <textarea name="content" id="content">${bdto.content}</textarea> </td>
			</tr>

			<tr align="center">
				<td colspan="2"><input type="submit" value="수정"></td>
			</tr>


		</table>
	</form>
</body>
</html>