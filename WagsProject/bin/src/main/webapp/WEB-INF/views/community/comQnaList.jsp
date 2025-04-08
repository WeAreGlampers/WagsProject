<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 게시판</title>
<style>
.container {
	width: 1100px;
	margin: 0 auto;
}

.qna-header {
	display: flex;
	font-weight: bold;
	border-bottom: 1px solid #ddd;
	padding: 10px 0;
	background-color: #FFE08C;
}

.qna-row {
	display: flex;
	border-bottom: 1px solid #eee;
	padding: 10px 0;
}

.answer-row {
	display: flex;
	border-bottom: 1px solid #eee;
	padding: 10px 0;
	background-color: #f9f9f9;
	margin-left: 20px;
	width: calc(100% - 20px);
	position: relative;
}

.answer-row::before {
	content: "↳";
	position: absolute;
	left: -20px;
	color: #888;
}

.qna-status {
	width: 10%;
}

.qna-title {
	width: 15%;
}

.qna-content {
	width: 30%;
}

.qna-author {
	width: 10%;
}

.qna-product {
	width: 15%;
}

.qna-type {
	width: 10%;
}

.qna-date {
	width: 10%;
}

</style>
<script>
function viewAnswer() {
  // 답변 보기 기능 구현 (필요 시)
}
</script>
</head>
<body>
	<!-- /community/comQnaList.jsp -->
	<div class="container">
		<div class="qna-header">
			<div style="color:#CC723D;" class="qna-status">답변상태</div>
			<div style="color:#CC723D;" class="qna-title">제목</div>
			<div style="color:#CC723D;" class="qna-content">질문내용</div>
			<div style="color:#CC723D;" class="qna-author">작성자</div>
			<div style="color:#CC723D;" class="qna-product">문의상품</div>
			<div style="color:#CC723D;" class="qna-type">분류</div>
			<div style="color:#CC723D;" class="qna-date">작성일</div>
		</div>
		<c:set var="ref" value="-1"/>
		<c:forEach items="${qnaMap}" var="map">
			
			<c:set var="viewAnswer" value="" />
			<c:if test="${map.ref != 0}">
				<c:set var="viewAnswer" value="onclick='viewAnswer()'" />
			</c:if>
			<c:if test="${map.qna==1}">
				<div class="qna-row">
			</c:if>
			<c:if test="${map.qna==2}">
				<div class="answer-row">
			</c:if>
			<div class="qna-status">
				<c:if test="${map.ref == 0}">
					<span style="color: red;">답변 대기</span>
				</c:if>
				<c:if test="${map.ref != 0 && map.qna == 1}">
					<span style="color: blue;">답변 완료</span>
				</c:if>
				<c:if test="${map.ref != 0 && map.qna == 2}">
					<span style="color: green;">답변 내용</span>
				</c:if>
			</div>
			<div class="qna-title">
				${map.qtitle}
			</div>
			<c:if test="${map.secret==1 && userid != map.userid && ref != map.ref}">
				<div class="qna-content">
					비밀글 입니다. <img src="../static/secretIcon.png" width="20"
						valign="middle">
				</div>
			</c:if>
			<c:if test="${map.secret==0 || userid == map.userid || ref == map.ref}">
				<div class="qna-content">${map.content}</div>
				<c:if test="${qdto.ref!=0}">
					<c:set var="ref" value="${qdto.ref}"/>
				</c:if>
			</c:if>
			<div class="qna-author">${map.userid}</div>
			<div class="qna-product">${map.pcode}</div>
			<div class="qna-type">${map.type}</div>
			<div class="qna-date">${map.writedayTime}</div>
	</div>
	</c:forEach>
	<div>
	<c:if test="${page!=1}">
		<a href="comQnaList?page=${page-1}" style="color: #CC723D;">이전</a>
	</c:if>
	<c:forEach begin="${pstart}" end="${pend}" var="i">
		<c:if test="${page==i}">
			<a href="comQnaList?page=${i}">${i}</a>
		</c:if>
		<c:if test="${page!=i}">
			<a href="comQnaList?page=${i}" style="color: #CC723D;">${i}</a>
		</c:if>
	</c:forEach>
	<c:if test="${page!=totalPages}">
		<a href="comQnaList?page=${page+1}" style="color: #CC723D;">다음</a>
	</c:if>
	</div>
	</div>
</body>
</html>