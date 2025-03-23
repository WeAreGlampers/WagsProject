<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	/* Main styles for the free board */
body {
  font-family: 'Noto Sans KR', sans-serif;
  margin: 0;
  padding: 20px;
  color: #333;
}

/* Table styles */
table {
  width: 800px;
  margin: 20px auto;
  border-collapse: collapse;
  background-color: white;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.05);
  border-radius: 8px;
  overflow: hidden;
}

caption {
  margin-bottom: 15px;
}

caption h3 {
  font-size: 24px;
  margin: 0;
  padding: 10px 0;
  color: #333;
}

/* Table header row */
table tr:first-child {
  background-color: #FFF6E0;
  font-weight: bold;
  border-bottom: 2px solid #ddd;
}

table tr:first-child td {
  padding: 12px 15px;
  text-align: center;
}

/* 처음과 마지막, 마지막 전 tr 을 제외한 나머지 */
table tr:not(:first-child):not(:last-child):not(:nth-last-child(2)) {
  border-bottom: 1px solid #eee;
}

table tr:not(:first-child):not(:last-child):not(:nth-last-child(2)):hover {
  background-color: #FFF6E0;
}

table td {
  padding: 12px 15px;
}

/* Title column */
table tr td:nth-child(2) {
  width: 50%;
}

/* Write button styling */
input[type="button"] {
  padding: 8px 15px;
  background-color: #FFF9C4;
  color: #CC723D;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  transition: background-color 0.2s;
}

input[type="button"]:hover {
  background-color: #FFE08C;
}

a {
  text-decoration: none;
  color: inherit;
}

/* Current page highlighting */
a[style*="color:red"] {
  color: #e74a3b !important;
  font-weight: bold;
}

/* Pagination row */
table tr:nth-last-child(1) td {
  padding-top: 20px;
  text-align: center;
  background-color: #FFF6E0;
}


/* Write button row */
table tr:nth-last-child(2) td {
  padding-top: 15px;
  border-bottom: none;
}

table tr:last-child a, 
table tr:last-child {
  margin: 0 5px;
  color: #666;
}

table tr:last-child a:hover {
  color: #4e73df;
}

table tr:last-child td:not(a) {
  color: #ccc;
}
</style>

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
					<td style="color:#CC723D; text-decoration: underline;"> <a href="views?id=${bdto.id}&page=${page}"> ${bdto.title} </a> </td>
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