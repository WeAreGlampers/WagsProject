<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function getServer(my) {
	document.memForm.server.value = my.value;	
}
</script>
</head>

<body>  <!-- member/memberInput.jsp -->

<section>
	<caption><h3>회원 가입</h3></caption>
	<form name="memForm" method="post" action="memberInput">
		<input type="text" name="name" placeholder="이름">
		<input type="text" name="userid" placeholder="아이디">
		<input type="password" name="pwd" placeholder="비번">
		<input type="password" name="pwd2" placeholder="비번확인">
		<input type="text" name="phone" placeholder="전화번호">
		<input type="text" name="emailId" placeholder="이메일">@<input type="text" name="server" class="email">
					<select name="dserver" id="select" onchange="getServer(this)">
						<option value="">직접입력</option>
						<option value="naver.com">naver.com</option>
						<option value="daum.net">daum.net</option>
						<option value="hanmail.net">hanmail.net</option>
						<option value="gmail.com">gmail.com</option>
						<option value="coupang.com">coupang.com</option>
					</select>
	</form>
	
</section>

</body>
</html>