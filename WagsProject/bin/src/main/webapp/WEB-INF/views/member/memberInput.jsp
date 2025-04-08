<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	section {
		width:1100px;
		margin:auto;
		text-align:center;
		margin-bottom:60px;
	}
	section div {
		margin-top:15px;
	}
	section #mform {
		margin:auto;
	}
	section .txt {
		width:420px;
		height:42px;
	}
	section .email {
		width:130px;
		height:42px;
	}
	section #select {
		width:132px;
		height:48px;
		border:2px solid #FFE08C;
		border-radius:5px;
	}
	section #submit {
		width:427px;
		height:46px;
		background:#FFE08C;
		color:#CC723D;
		cursor:pointer;
	}
	section #login {
		width:427px;
		height:46px;
		background:white;
		color:#CC723D;
		cursor:pointer;
	}
	section input {
		border-radius:5px;
		border:2px solid #FFE08C;
		outline:none;
	}
	section #emailInput {
		vartical-align:middle;
	}
</style>
<script>
function useridDupChk(userid) {
	if (userid.length < 4) {
		document.getElementById("idChkMsg").innerText="4자 이상 입력해주세요.";
		document.getElementById("idChkMsg").style.color="red";
		document.getElementById("idChkMsg").style.fontSize="12px";
		idChkNum = 0;
	} else {
		var chk = new XMLHttpRequest();
		chk.onload = function() {
			if (chk.responseText=="1") {
				document.getElementById("idChkMsg").innerText="이미 사용중인 아이디 입니다.";
				document.getElementById("idChkMsg").style.color="red";
				document.getElementById("idChkMsg").style.fontSize="12px";
				idChkNum = 0;
			} else {
				document.getElementById("idChkMsg").innerText="사용 가능한 아이디 입니다.";
				document.getElementById("idChkMsg").style.color="blue";
				document.getElementById("idChkMsg").style.fontSize="12px";
				idChkNum = 1;
			}
		}
		chk.open("get","/member/useridDupChk?userid="+userid);
		chk.send();
	}
}
function pwdSameChk() {
	var pwd = document.memForm.pwd.value;
	var pwd2 = document.memForm.pwd2.value;
	
	if(pwd2.length != 0) {
		if (pwd == pwd2) {
			document.getElementById("pwdChkMsg").innerText="비밀번호 일치";
			document.getElementById("pwdChkMsg").style.color="blue";
			document.getElementById("pwdChkMsg").style.fontSize="12px";	
			pwdChkNum = 1;
		} else {
			document.getElementById("pwdChkMsg").innerText="비밀번호 불일치";
			document.getElementById("pwdChkMsg").style.color="red";
			document.getElementById("pwdChkMsg").style.fontSize="12px";	
			pwdChkNum = 0;
		}
	}
}
function getServer(my) {
	document.memForm.server.value = my.value;	
}
var idChkNum = 0;
var pwdChkNum = 0;
function inputChk() {
	var emailAddr = document.memForm.eid.value + "@" + document.memForm.server.value;
	document.memForm.email.value = emailAddr;
	var name = document.memForm.name.value;
	var phone = document.memForm.phone.value;
	if (idChkNum == 0 || pwdChkNum == 0 || phone.length < 12 || emailAddr.length < 5 || name.length < 2) {
		alert("잘못 입력하셨거나 입력되지 않은 항목이 있는지 확인해 주세요.");
		return false;
	}
	
}
</script>
</head> 

<body>  <!-- member/memberInput.jsp -->

<section>
<div id="container">
	<div><caption><h3 style="color:#CC723D;">회원 가입</h3></caption></div>
	<form name="memForm" method="post" action="memberInputOk" onsubmit="return inputChk()">
	<input type="hidden" name="email">
		<div>
			<input type="text" class="txt" name="name" placeholder="이름">	
		</div>
		<div>
			<input type="text" class="txt" name="userid" placeholder="아이디" onblur="useridDupChk(this.value)"> <p>
			<span id="idChkMsg"></span>
		</div>
		<div><input type="password" name="pwd" class="txt" placeholder="비번" onkeyup="pwdSameChk()"></div>
		<div>
			<input type="password" name="pwd2" class="txt" placeholder="비번확인" onkeyup="pwdSameChk()"> <p>
			<span id="pwdChkMsg"></span>
		</div>
		<div><input type="text" name="phone" class="txt" placeholder="전화번호"></div>
		<div id="emailInput">
			<input type="text" name="eid" placeholder="이메일" class="email">@<input type="text" name="server" class="email">
			<select name="dserver" id="select" onchange="getServer(this)">
				<option value="">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="coupang.com">coupang.com</option>
			</select>
		</div>
		<div><input type="submit" id="submit" value="회원가입"></div>
		<div><input type="button" id="login" onclick="location='../login/login'" value="로그인"></div>
	</form>
</div>
</section>

</body>
</html>