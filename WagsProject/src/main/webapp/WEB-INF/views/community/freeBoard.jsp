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
					<a href="freeBoardWrite"> <input type="button" value="글 작성"> </a>
				</td>
			</tr>
			
			<!-- 페이지 처리 -->
	   <tr>
       <td colspan="4" align="center">
        <!-- 이전 그룹 -->
         <c:if test="${pstart > 1}">
          <a href="freeBoard?page=${pstart-1}"> ◁◁ </a>
         </c:if>
         <c:if test="${pstart==1}">
          ◁◁
         </c:if>
        
        <!-- 이전 페이지 -->
         <c:if test="${page > 1}">
          <a href="freeBoard?page=${page-1}"> ◁ </a>
         </c:if>
         <c:if test="${page == 1}"> 
          ◁
         </c:if>
         
        <c:forEach var="i" begin="${pstart}" end="${pend}">
         <c:if test="${page == i}"> <!-- 현재페이지랑 출력된 i의 값이 같을때 -->
          <a href="freeBoard?page=${i}" style="color:red;"> ${i} </a>
         </c:if>
         <c:if test="${page != i}">
          <a href="freeBoard?page=${i}"> ${i} </a>
         </c:if> 
        </c:forEach>
        
        <!-- 다음페이지 -->
         <c:if test="${page != totalPages}">
          <a href="freeBoard?page=${page+1}"> ▷ </a>
         </c:if>
         <c:if test="${page == totalPages}"> 
          ▷
         </c:if>
         
         <!-- 다음 그룹 -->
         <c:if test="${pend < totalPages}"> 
          <a href="freeBoard?page=${pend+1}"> ▷▷ </a>
         </c:if>
         <c:if test="${pend==totalPages}">
          ▷▷
         </c:if>
       </td>
     </tr>
			
			
	
	</table>

</body>
</html>