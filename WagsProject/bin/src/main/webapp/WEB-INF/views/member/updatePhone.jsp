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
		if(phone.value.trim().length < 13) {
			alert("다시 생각해 봐. 뭔가 틀렸을거야. 안되는 이유가 있을거야.");
		} else {
			var chk = new XMLHttpRequest();
			chk.onload = function() {
				if(chk.responseText=="1") {
					opener.document.getElementById("phone").innerText=phone.value;
					alert("수정 완료");
					close();
				} else {
					alert("오류 발생. 지속적으로 발생 시 고객센터 문의 바랍니다.");
				}
			}
			chk.open("get","../member/updatePhoneOk?phone="+phone.value);
			chk.send();
		}
	}
</script>
</head>
<body>
<input type="text" name="phone" id="phone" value="${mdto.phone}" placeholder="변경할 전화번호">
<input type="button" value="수정하기" onclick="updatePhoneOk()">
</body>
</html>