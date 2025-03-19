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
<body>
	<table width="700" align="center">
     <caption> <h3> 게시판 내용 </h3> </caption>
     <tr>
       <td> 제 목 </td>
       <td colspan="3"> ${bdto.title} </td>
     </tr>
     <tr>
       <td> 작성자 </td>
       <td> ${bdto.userid} </td>
     </tr>
     <tr>
       <td> 조회수 </td>
       <td> ${bdto.views} </td>
     </tr>
     <tr>
       <td> 작성일 </td>
       <td colspan="3"> ${bdto.writeday} </td>
     </tr>
     <tr height="200">
       <td> 내 용 </td>
       <td colspan="3"> ${bdto.content} </td>
     </tr>
     <tr>
       <td colspan="4" align="center">
        <a href="freeBoard?page=${page}"> <input type="button" value="목록"> </a>
        <a href="freeBoardUpdate?id=${bdto.id}&page=${page}"> <input type="button" value="수정"> </a>
        <a href="javascript:viewform()"> <input type="button" value="삭제"> </a>
       </td>
     </tr>
    
     <tr id="delform">
       <td colspan="4" align="center">
         <form method="post" action="freeBoardDelete">
           <input type="hidden" name="id" value="${bdto.id}">
           <input type="hidden" name="page" value="${page}">
           비밀번호 <input type="password" name="pwd">
           <input type="submit" value="삭제">
         </form>
       </td>
     </tr>
   </table>
	
	<!-- 댓글 목록 -->
	<h3>댓글</h3>
	<table width="700" align="center" border="1">
	    <c:forEach items="${clist}" var="cdto" varStatus="sts">
	        <tr>
	            <td>${cdto.userid}</td>
	            <td>${cdto.content}</td>
	            <td>${cdto.writeday}</td>
	            <c:if test="${cdto.userid == userid}">
	            	<td> <span onclick="viewUform(${cdto.id})"> 수정 </span> </a> </td>
	            	<td> <a href="commentDelete?cid=${cdto.cid}&userid=${cdto.userid}&id=${cdto.id}&page=${page}"> 삭제 </a> </td>
	            </c:if>
	        </tr>
	    </c:forEach>
	    
	    <div id="uform">
			<form method="post" action="commentUpdateOk">
				<input type="hidden" name="cid" value="${bdto.id}"> <!-- freeBoard 테이블의  id -->
				<input type="hidden" name="id" id="id" value="">
				<input type="hidden" name="page" value="${page}">
			    <input type="text" name="userid" value="${userid}" readonly>
			    <input type="text" name="content" placeholder="댓글을 입력하세요" required> <!-- 입력해야만 등록 가능 -->
			    <input type="submit" value="댓글 수정">
			</form>
		</div>
	</table>
	
	<!-- 댓글 입력 폼 -->
	<div>
		<form method="post" action="commentWriteOk">
			<input type="hidden" name="cid" value="${bdto.id}"> <!-- freeBoard 테이블의  id -->
			<input type="hidden" name="page" value="${page}">
		    <input type="text" name="userid" value="${userid}" readonly>
		    <input type="text" name="content" placeholder="댓글을 입력하세요" required> <!-- 입력해야만 등록 가능 -->
		    <input type="submit" value="댓글 작성">
		</form>
	</div>
	
  <script>
	function viewform() { // 숨어있는 id="delform"요소를 보이게 하기
		document.getElementById("delform").style.display = "table-row";
	}
	
	function viewUform(id) {
		document.getElementById("uform").style.display = "table-row";
		document.getElementById("id").value = id;
	}
  </script>
  <style>
#delform {
	display: none;
}

#uform {
	display: none;
}
</style>
</body>


</html>