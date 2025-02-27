<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1100px;
	margin: auto;
}

section caption {
	
}

section #container {
	position:relative;
	width: 600px;
	margin: auto;
	text-align: center;
	
	margin-bottom: 100px;
}

section #container div {
	margin-top: 15px;
}
section .oneLine {
	text-align:left;
}

section .leftDiv {
	display: inline-block;
	width: 200px; /* 원하는 크기로 조정 */
	text-align: left;
	padding-right: 10px; /* 오른쪽 간격 추가 */
	font-weight:900;
}

section .rightDiv {
	display: inline-block;
	text-align:left;
}

section #cform {
	position:absolute;
	visibility:hidden;
	left:180px;
	top:290px;
	width:200px;
	height:90px;
	text-align:center;
	border:2px solid black;
}
</style>
<script>
	function chgMemInfo() {
		document.getElementById("cform").style.visibility="visible";
	}
	function cformClose() {
		document.getElementById("cform").style.visibility="hidden";
	}
</script>
</head>
<body>
	<!-- member/memberInfo.jsp -->
	<section>
		<caption>
			<h3 align="center">회원 정보</h3>
		</caption>
		<div id="container">
			<div class="oneLine">
				<div class="leftDiv">이름</div>
				<div class="rightDiv">${mdto.name}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">아이디</div>
				<div class="rightDiv">${mdto.userid}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">전화번호</div>
				<div class="rightDiv">${mdto.phone}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">이메일</div>
				<div class="rightDiv">${mdto.email}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">회원가입일</div>
				<div class="rightDiv">${mdto.writeday}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">보유적립금</div>
				<div class="rightDiv">${mdto.saveStr} 원</div>
			</div>
			<div class="oneLine">
				<div> <input type="button" value="회원정보 수정" onclick="chgMemInfo()"> </div>
			</div>
			
			<div id="cform">
				<form method="post" action="../member/chgMemPChk">
					비밀번호 <input type="password" name="pwd">
					<p>
					<input type="submit" value="확인">
					<input type="button" value="닫기" onclick="cformClose()">
				</form>
			</div>
		</div>
		
	</section>

</body>
</html>