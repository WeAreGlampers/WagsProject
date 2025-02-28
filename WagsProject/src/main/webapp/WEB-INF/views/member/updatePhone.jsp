<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updatePhoneOk() {
		var phone = document.getElementById("phone");
		var chk = new XMLHttpRequest();
		chk.open("get","updatePhoneOk?phone="+phone.value);
		chk.send();
		chk.onload = function() {
			alert(chk.responseText);
		}
		
		close();
	}
</script>
</head>
<body>
<input type="text" name="phone" id="phone" value="${mdto.phone}" placeholder="변경할 전화번호">
<input type="button" value="수정하기" onclick="updatePhoneOk()">
</body>
</html>