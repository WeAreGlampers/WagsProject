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
	margin-bottom:100px;
}

section caption {
	
}

section #container {
	position:relative;
	width: 800px;
	margin: auto;
	text-align: center;
	
	margin-bottom: 100px;
}

section #container div {
	margin-top: 15px;
}
section .oneLine {
	text-align:left;
	height:40px;
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

section #pwd1Msg {
	visibility:hidden;
}

section #pwd2Msg {
	visibility:hidden;
}
</style>
<script>
	var infoChk = 1;
	var appr = 0;
	function pwdChk1(pwd) {
		var pwd2 = document.chgForm.pwd2.value;
		var len = pwd.trim().length;
		if ( len < 4 ) {
			document.getElementById("pwd1Msg").style.visibility="visible";
			document.getElementById("pwd1Msg").innerText="4자 이상 입력해주세요.";
			document.getElementById("pwd1Msg").style.color="red";
			document.getElementById("pwd1Msg").style.fontSize="12px";
		} else {
			var chk = new XMLHttpRequest();
			chk.onload = function() {
				//alert(chk.responseText);
				if(chk.responseText=="1") {
					document.getElementById("pwd1Msg").style.visibility="visible";
					document.getElementById("pwd1Msg").innerText="이미 사용중인 비밀번호 입니다.";
					document.getElementById("pwd1Msg").style.color="red";
					document.getElementById("pwd1Msg").style.fontSize="12px";
				} else {
					document.getElementById("pwd1Msg").style.visibility="hidden";
					document.getElementById("pwd1Msg").innerText="";
					appr = 1;
				}
				
				if (appr==1) {
					if(pwd == pwd2) {
						document.getElementById("pwd2Msg").style.visibility="visible";
						document.getElementById("pwd2Msg").innerText="비밀번호 일치";
						document.getElementById("pwd2Msg").style.color="blue";
						document.getElementById("pwd2Msg").style.fontSize="12px";
						infoChk = 0;
					} else {
						document.getElementById("pwd2Msg").style.visibility="visible";
						document.getElementById("pwd2Msg").innerText="비밀번호 불일치";
						document.getElementById("pwd2Msg").style.color="red";
						document.getElementById("pwd2Msg").style.fontSize="12px";
						infoChk = 1;
					}
				}

			}
			chk.open("get","exisPwd?pwd="+pwd);
			chk.send();
		}
	}
	
	function pwdChk2(pwd2) {
		var pwd = document.chgForm.pwd.value;
		if (appr==1) {
			if(pwd == pwd2) {
				document.getElementById("pwd2Msg").style.visibility="visible";
				document.getElementById("pwd2Msg").innerText="비밀번호 일치";
				document.getElementById("pwd2Msg").style.color="blue";
				document.getElementById("pwd2Msg").style.fontSize="12px";
				infoChk = 0;
			} else {
				document.getElementById("pwd2Msg").style.visibility="visible";
				document.getElementById("pwd2Msg").innerText="비밀번호 불일치";
				document.getElementById("pwd2Msg").style.color="red";
				document.getElementById("pwd2Msg").style.fontSize="12px";
				infoChk = 1;
			}
		}
	}
	
	function check(form) {
		if (infoChk == "1") {
			alert("변경할 비밀번호를 확인해주세요.")
			return false;	
		} else {
			return true;
		}
		
	}
</script>
</head>
<body>  <!-- member/chgMemInfo.jsp -->
<section>
	<caption>
			<h3 align="center">비밀번호 수정</h3>
		</caption>
		<div id="container">
		<form name="chgForm" method="post" action="pwdUpdateOk" onsubmit="return check(this.form)">
			<div class="oneLine">
				<div class="leftDiv">이름</div>
				<div class="rightDiv">${mdto.name}</div>
			</div>

			<div class="oneLine">
				<div class="leftDiv">아이디</div>
				<div class="rightDiv">${mdto.userid}</div>
			</div>
			
			<div class="oneLine">
				<div class="leftDiv">새로운 비밀번호</div>
				<div class="rightDiv">
					 <input type="password" name="pwd" onblur="pwdChk1(this.value)">				 				
				</div>
				<span id="pwd1Msg"></span>
			</div>
			
			<div class="oneLine">
				<div class="leftDiv">비밀번호 확인</div>
				<div class="rightDiv">
					 <input type="password" name="pwd2" onkeyup="pwdChk2(this.value)">		 				
				</div>
				<span id="pwd2Msg"></span>
			</div>
			<div class="oneLine">
				<div  align="center"> <input type="submit" value="수정하기"> </div>
			</div>
			 
				</form>
			</div>
			
			
		
	
	
	
	
</section>

</body>
</html>