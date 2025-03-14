<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	document.write("<div align='center'> 세션이 만료되었습니다.<br> <a href='javascript:login()'>로그인</a></div>");
	setTimeout(function(){
		opener.location="../main/main";
		close();
	},3000);
	function login() {
		opener.location="../login/login";
		close();
	}
</script>
</head>
<body> <!-- member/sessionOut.jsp -->


</body>
</html>