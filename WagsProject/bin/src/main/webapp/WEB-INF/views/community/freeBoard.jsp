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
	<table width="800" align="center">
		<caption> <h3> 자유게시판 </h3> </caption>
			<tr>
				<td> 작성자 </td>
				<td> 제 목 </td>
				<td> 조회수 </td>
				<td> 작성일 </td>
			</tr>
			
			<c:forEach items="${blist}" var="bdto">
				<tr>
					<td> ${bdto.userid}	</td>		
					<td> <a href="views?id=${bdto.id}&page=${page}"> ${bdto.title} </a> </td>
					<td> ${bdto.views} </td>				
					<td> ${bdto.writeday} </td>
				</tr>
			</c:forEach>	
			
			<!-- 글 작성 버튼 -->
			<tr>
				<td colspan="4" align="right">
					<a href="write"> <input type="button" value="글 작성"> </a>
				</td>
			</tr>
			
			<!-- 페이지 처리 -->
	
	
	</table>

</body>
</html>