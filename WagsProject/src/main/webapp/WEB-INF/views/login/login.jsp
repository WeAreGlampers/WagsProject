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
		width:1100px;
		margin:auto;
		text-align:center;
		padding-bottom: 80px;
		height:800px;
	}
	section h3,h4 {
		color:#CC723D;
	}
	section div {
		margin-top:10px;
	}
	section .txt {
		width:420px;
		height:42px;
		border:2px solid #FFE08C;
		border-radius:8px;
		outline:none;
		padding-left:10px;
	}
	section #submit {
		width:435px;
		height:46px;
		background:#FFE08C;
		font-weight:900;
		color:#CC723D;
		border:#FFE08C;
		border-radius:8px;
	}
	section #submit:hover {
		text-decoration:underline;
		cursor:pointer;
	}
	section #txt2 {
       width:200px;
       height:30px;
       border:2px solid #FFE08C;
       outline:none;
       border-radius:8px;
       padding-left:10px;
    }
    section .submit2 {
       width:215px;
       height:33px;
       background:#FFE08C;
       color:#CC723D;
       border:#FFE08C;
       border-radius:8px;
    }
    section #submit2:hover {
		text-decoration:underline;
		cursor:pointer;
	}
    section #uform {
       display:none;
       width:500px;
       margin:auto;
    }
    section #pform {
       display:none;
       width:500px;
       margin:auto;
    }
    section .sear {
    	text-align:center;
    	cursor:pointer;
    	text-weight:900;
    	color:#CC723D;
    	padding:20px;
    }
</style>
<script>
	function viewUform() {
		document.getElementById("view").innerText="";
		document.getElementById("uform").style.display="block";
		document.getElementById("pform").style.display="none";
		// 숨겨지는 비밀번호 폼의 입력값이 있을 수 있으므로 숨겨질 때 지운다..! 
		document.getElementById("pform").userid.value="";
		document.getElementById("pform").name.value="";
		document.getElementById("pform").phone.value="";
	}
	
	function viewPform() {
		document.getElementById("view").innerText="";
		document.getElementById("pform").style.display="block";
		document.getElementById("uform").style.display="none";
		document.getElementById("uform").name.value="";
		document.getElementById("uform").phone.value="";
	}
	
	function getUserid(form) {
		var name = form.name.value;
		var phone = form.phone.value;
		
		var chk = new XMLHttpRequest();
		chk.onload = function() {
			//alert(chk.responseText);
			
			document.getElementById("uform").style.display="none";
			document.getElementById("uform").name.value="";
			document.getElementById("uform").phone.value="";
			document.getElementById("view").innerText=chk.responseText;
		}
		chk.open("get","getUserid?name="+name+"&phone="+phone);
		chk.send();
	}
	
	function getPwd(form) {
		var userid = form.userid.value;
		var name = form.name.value;
		var phone = form.phone.value;
		
		var chk = new XMLHttpRequest();
		chk.onload = function() {
			document.getElementById("view").innerText=chk.responseText;
		}
		chk.open("get","getPwd?userid="+userid+"&name="+name+"&phone="+phone);
		chk.send();
	}
</script>
</head>
<body> <!-- login/login.jsp -->
<section>
    <h3 align="center"> 로그인 </h3>
    <form method="post" action="../login/loginOk">
    <c:if test="${move!=null}">
    	<input type="hidden" name="move" value="${move}">
    </c:if>
    <c:if test="${pcode!=null}">
    	<input type="hidden" name="pcode" value="${pcode}">
    </c:if>
      <div> <input type="text" name="userid" class="txt" placeholder="아이디"> </div>
      <div> <input type="password" name="pwd" class="txt" placeholder="비밀번호"></div>
      <div> <input type="submit" value="로그인" id="submit"> <p>
      		<c:if test="${err==1}">
      			<span id="chkMsg" style="color:red;fontSize:12px;">아이디/비밀번호를 확인해 주세요</span>
      		</c:if>
      <div id="searDiv"> 
        <span class="sear" onclick="viewUform()"> 아이디 찾기 </span> 
        <span class="sear" onclick="viewPform()"> 비밀번호 찾기 </span> 
         <span class="sear" onclick="location='../member/memberInput'"> 회원가입 </span>
      </div> 
      </div>
    </form>
    <div id="view"></div>
    <!-- 아이디 찾기 폼 -->
    <form id="uform">
    <h4>아이디 찾기</h4>
    	<div><input type="text" name="name" id="txt2" placeholder="이 름"></div>
    	<div><input type="text" name="phone" id="txt2" placeholder="전화번호(-포함)"></div>
    	<div><input type="button" value="아이디찾기" class="submit2" onclick="getUserid(this.form)"></div>
    </form>        
    
    <!-- 비밀번호 찾기 폼 -->
    <form id="pform">
    <h4>비밀번호 찾기</h4>
    	<div><input type="text" name="userid" id="txt2" placeholder="아이디"></div>
    	<div><input type="text" name="name" id="txt2" placeholder="이 름"></div>
    	<div><input type="text" name="phone" id="txt2" placeholder="전화번호(-포함)"></div>
    	<div><input type="button" value="비밀번호 찾기" class="submit2" onclick="getPwd(this.form)"></div>
    </form>
  </section>

</body>
</html>