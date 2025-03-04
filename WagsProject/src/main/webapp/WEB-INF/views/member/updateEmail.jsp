<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function updateEmailOk() {
		var email = document.getElementsByClassName("email")[0].value + "@" + document.getElementsByClassName("email")[1].value;
		var eid = document.getElementById("eid").value;
		var server = document.getElementById("server").value;
		
		if (eid.trim().length == "0" || server.trim().length == "0") {
			alert("이메일을 확인해 주세요.")
		} else {
			var chk = new XMLHttpRequest();
			chk.onload = function() {
				if(chk.responseText=="1") {
					opener.document.getElementById("email").innerText=email;
					alert("수정 완료");
					close();
				} else {
					alert("오류 발생. 지속적으로 발생 시 고객센터 문의 바랍니다.");
				}
			}
			chk.open("get","../member/updateEmailOk?email="+email);
			chk.send();
		}
	}
	
	function getServer(my) {
		document.getElementsByClassName("email")[1].value = my.value;	
	}
</script>
</head>
<body>  <!-- updateEmail.jsp -->
<div id="emailInput">
			<input type="text" id="eid" name="eid" placeholder="이메일" class="email">@<input type="text" id="server" name="server" class="email">
			<select name="dserver" id="select" onchange="getServer(this)">
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="coupang.com">coupang.com</option>
			</select>
		</div>
<input type="button" value="수정하기" onclick="updateEmailOk()">
</body>
</html>