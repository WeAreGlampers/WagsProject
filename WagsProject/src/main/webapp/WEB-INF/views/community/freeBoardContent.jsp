<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세보기</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Noto Sans KR', sans-serif;
        background-color: #f5f5f5;
        color: #333;
        margin: 0;
        padding: 20px;
    }
    
    table {
        width: 700px;
        margin: 0 auto 20px auto;
        border-collapse: collapse;
        box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        background-color: white;
        border-radius: 8px;
        overflow: hidden;
    }
    
    caption h3 {
        text-align: center;
        margin: 20px 0;
        color: #333;
        font-size: 24px;
    }
    
    h3 {
        width: 700px;
        margin: 30px auto 10px auto;
        color: #333;
    }
    
    td {
        padding: 12px 15px;
        border-bottom: 1px solid #eee;
    }
    
    tr:first-child td {
        border-top: none;
    }
    
    tr:last-child td {
        border-bottom: none;
    }
    
    tr td:first-child {
        width: 100px;
        background-color: #FFF6E0;
        font-weight: bold;
        text-align: center;
    }
    
    tr[height="200"] td {
        vertical-align: top;
    }
    
    tr[height="200"] td:last-child {
        padding: 20px;
    }
    
    input[type="button"], 
    input[type="submit"] {
        background-color: #FFF9C4;
        color: #CC723D;
        border: none;
        padding: 8px 16px;
        border-radius: 4px;
        cursor: pointer;
        margin: 0 3px;
        transition: background-color 0.3s ease;
    }
    
    input[type="button"]:hover, 
    input[type="submit"]:hover {
        background-color: #FFE08C;
    }
    
    input[type="text"], 
    input[type="password"] {
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        margin-right: 5px;
    }
    
    #delform, #uform {
        display: none;
    }
    
    /* 댓글 관련 스타일 */
    .comment-table {
        width: 700px;
        margin: 10px auto;
        border-collapse: collapse;
        background-color: white;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    
    .comment-table tr {
        border-bottom: 1px solid #eee;
    }
    
    .comment-table tr:last-child {
        border-bottom: none;
    }
    
    .comment-table td {
        padding: 10px 15px;
        border: none;
    }
    
    .comment-table td:first-child {
        width: 100px;
        background-color: #FFF6E0;
        font-weight: bold;
    }
    
    .comment-actions span, 
    .comment-actions a {
        color: #CC723D;
        cursor: pointer;
        margin-right: 10px;
        text-decoration: none;
    }
    
    .comment-actions span:hover, 
    .comment-actions a:hover {
        text-decoration: underline;
    }
    
    .comment-form {
        width: 700px;
        margin: 20px auto;
        padding: 15px;
        background-color: white;
        border-radius: 8px;
        box-shadow: 0 1px 3px rgba(0,0,0,0.1);
    }
    
    .comment-form input[type="text"] {
        width: 80%;
        margin-right: 10px;
    }
    
    .comment-form input[name="userid"] {
        width: 120px;
        background-color: #FFF6E0;
    }
</style>
</head>
<body>
<table>
    <caption><h3>게시판 내용</h3></caption>
    <tr>
        <td>제 목</td>
        <td colspan="3">${bdto.title}</td>
    </tr>
    <tr>
        <td>작성자</td>
        <td>${bdto.userid}</td>
    </tr>
    <tr>
        <td>조회수</td>
        <td>${bdto.views}</td>
    </tr>
    <tr>
        <td>작성일</td>
        <td colspan="3">${bdto.writeday}</td>
    </tr>
    <tr height="200">
        <td>내 용</td>
        <td colspan="3">${bdto.content}</td>
    </tr>
    <tr>
        <td colspan="4" align="center">
            <a href="freeBoard?page=${page}"><input type="button" value="목록"></a>
            <a href="freeBoardUpdate?id=${bdto.id}&page=${page}"><input type="button" value="수정"></a>
            <a href="javascript:viewform()"><input type="button" value="삭제"></a>
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
<table class="comment-table">
    <c:forEach items="${clist}" var="cdto">
    <tr>
        <td>${cdto.userid}</td>
        <td>${cdto.content}</td>
        <td>${cdto.writeday}</td>
        <c:if test="${cdto.userid == userid}">
        <td class="comment-actions">
            <span onclick="viewUform(${cdto.id})">수정</span>
            <a href="commentDelete?cid=${cdto.cid}&userid=${cdto.userid}&id=${cdto.id}&page=${page}">삭제</a>
        </td>
        </c:if>
    </tr>
    </c:forEach>

    <tr id="uform">
        <td colspan="4">
            <form method="post" action="commentUpdateOk">
                <input type="hidden" name="cid" value="${bdto.id}"> <!-- freeBoard 테이블의 id -->
                <input type="hidden" name="id" id="id" value="">
                <input type="hidden" name="page" value="${page}">
                <input type="text" name="userid" value="${userid}" readonly>
                <input type="text" name="content" placeholder="댓글을 입력하세요" required> <!-- 입력해야만 등록 가능 -->
                <input type="submit" value="댓글 수정">
            </form>
        </td>
    </tr>
</table>

<c:if test="${chk == 1}">
<!-- 댓글 입력 폼 -->
<div class="comment-form">
    <form method="post" action="commentWriteOk">
        <input type="hidden" name="cid" value="${bdto.id}"> <!-- freeBoard 테이블의 id -->
        <input type="hidden" name="page" value="${page}">
        <input type="text" name="userid" value="${userid}" readonly>
        <input type="text" name="content" placeholder="댓글을 입력하세요" required> <!-- 입력해야만 등록 가능 -->
        <input type="submit" value="댓글 작성">
    </form>
</div>
</c:if>
<script>
function viewform() { // 숨어있는 id="delform"요소를 보이게 하기
    document.getElementById("delform").style.display = "table-row";
}

function viewUform(id) {
    document.getElementById("uform").style.display = "table-row";
    document.getElementById("id").value = id;
}
</script>

</body>
</html>