<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@font-face {
	font-family: 'Gyeonggi_Batang_Regular';
	src:
		url('https://fastly.jsdelivr.net/gh/projectnoonnu/2410-3@1.0/Batang_Regular.woff')
		format('woff');
	font-weight: 400;
	font-style: normal;
}

body {
	font-family: 'GongGothicMedium';
	margin: 0px;
	padding: 0px;
	background-color: white;
	text-align: center;
	color: #333;
}

#outer {
	width: 100%;
	height: 40px;
	background: #FFE08C;
}

#outer #X {
	cursor: pointer;
}

#outer #first {
	width: 1100px;
	height: 40px;
	margin: auto;
	background: #FFE08C;

}

#outer #first #greet {
	display: inline-block;
	width: 1000px;
	height: 40px;
	line-height: 40px;
	text-align: center;
	color: #CC723D;
}

#outer #first #close {
	display: inline-block;
	width: 80px;
	height: 40px;
	line-height: 40px;
	text-align: right;
	color: black;
}

#newSection {
	width: 100%;
	margin: auto;
	text-align: right;
	background: white;
	display:inline-block;
	height:30px;
}

#newSection #privateMenu {
	position:relative;
	cursor:pointer;
	display:inline-block;
	height:30px;
}

#newSection #privateSub {
	position:absolute;
	visibility:hidden;
	left:-18px;
	top:7px;
	padding-left:0px;
	background:#FFE08C;
	z-index:5;
}

#newSection #privateSub > li {
	list-style:none;
	text-align:center;
	border: 1px solid #CC723D;
	color: #CC723D;
	width:90px;
}

header {
	width: 100%;
	height: 100px;
	margin: auto;
	background: white;
	color: black;
}

nav {
    width: 100%;
    height: 80px;
    margin: auto;
    position: relative;
    background: white;
    border-bottom: 2px solid #FFE08C;
}

nav > ul {
	gap:60px;
}

nav  ul {
    margin: 0px;
    padding: 0px;
    display: flex; 
    justify-content: center; /* 가로 기준 중앙 정렬 */ 
    align-items: center;  /* 세로 기준 중앙 정렬 */
    height: 100%;
}

nav > ul > li {
	list-style: none;
    position: relative;
    font-size: 14px;
    font-weight: bold;
    cursor: pointer;
    padding: 5px 10px;
}

nav .category {
    position: relative;
    display: flex; 
    align-items: center; 
}

nav .category .sub {
    visibility: hidden;
    position: absolute;
    top: 100%; 
    left: 50%;
    transform: translateX(-50%); /* 가로축 방향으로 50% 이동 */
 /*    width: max-content;
    min-width: 120px; /* 최소 넓이 */ 
    background: white;
    box-shadow: 0px 2px 5px rgba(0, 0, 0, 0.2);
    z-index: 10;
    display: flex; 
    justify-content: center; /* 가로 기준 중앙 정렬 */ 
    align-items: center;
}

nav .category .sub li {
	list-style: none;
	width:80px;
    font-size: 13px;
    padding: 5px 10px;
    text-align: center;
}

nav .category .sub #long {
	width:110px;
}

nav .category .sub #long2 {
	width:110px;
}
#logo img {
	width: 250px;
	height: 100px;
}

footer {
	width: 100%;
	height: 218px;
	background: #FFE08C;
	color: #CC723D;
	display: flex;
	justify-content: center;
	align-items: center;
}

a {
	text-decoration: none;
	color: black;
}
</style>
<script>
	// 회원전용 메뉴 보였다 숨기기
	function viewPrivate() {
		document.getElementById("privateSub").style.visibility = "visible";
	}
	function hidePrivate() {
		document.getElementById("privateSub").style.visibility = "hidden";
	}

	// 카테고리 보였다 숨기기
	function viewCategory(n) {
		document.getElementsByClassName("sub")[n].style.visibility = "visible";
	}

	function hideCategory(n) {
		document.getElementsByClassName("sub")[n].style.visibility = "hidden";
	}
	
	var h=40;
    function outerClose()
    {
    	ss=setInterval(function()
    	{
    		h--;
        	document.getElementById("outer").style.height=h+"px";
        	document.getElementById("first").style.height=h+"px";
        	
        	if(h==0)
        	{
        		clearInterval(ss);
        		document.getElementById("outer").style.display="none";
        	}	
    	},10);
    	
    	// 쿠키변수에 사용자가 x를 클릭하였으므로 정보를 저장 후 안보여주기
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		if(chk.responseText=="0")
    		{
    			alert("오류");
    		}	
    			
    	}
    	chk.open("get","../cookie/firstCookie");
    	chk.send();
    	
    }
    
    window.onload=function()
    {
     	// 쿠키를 체크하여 보여줄지 말지를 결정한다.
    	var chk=new XMLHttpRequest();
    	chk.onload=function()
    	{
    		var n=chk.responseText;
    		if(n=="1")
    		{
    			document.getElementById("outer").style.display="none"; // 1층 숨기기
    		}	
    	 
    	}
    	chk.open("get","../cookie/fcookOk");
    	chk.send();
    }
	
</script>


<sitemesh:write property="head"/>
</head> 
<body> <!-- default.jsp -->
	<div id="outer">
		<div id="first" onclick="location='../member/memberInput'">
			<div id="greet"> 신규 회원 가입하고 5000포인트 받기! </div>
			<div id="close"> <span id="X" onclick="outerClose()"> X </span> </div>
		</div>
	</div>
	<div id="newSection">
		<!-- 장바구니 -->
		<a href="../member/cartView"> 장바구니 </a>
		
		<!-- 비로그인 상태 -->
		<c:if test="${userid == null}">
			<a href="../login/login"> 로그인 </a>
			<a href="../member/memberInput"> 회원가입 </a>
		</c:if> 
		
		<!-- 로그인 상태 -->
		<c:if test="${userid != null}">
			<span id="privateMenu" onmouseover="viewPrivate()" onmouseout="hidePrivate()"> ${userid} 님 
				<ul id="privateSub">
					<li> <a href="../member/memberInfo"> 마이페이지 </a></li>
					<li> <a href="../member/cartView"> 장바구니 </a></li>
					<li> <a href="../member/reservationStatus"> 예약현황 </a></li>	
					<li> <a href="../member/reviewList"> 리뷰관리 </a></li>						
				</ul>
			</span>		
		
		<!-- 로그아웃 -->
		<a href="../login/logout"> 로그아웃 </a>
		</c:if>
		
		<!-- 고객센터 -->
	</div>
	
	<header>
		<div id="logo"> <a href="../main/main"> <img src="../static/logo.png" width="150" height="50" valign="middle"> </a> </div>
	</header>



	<nav>
		<ul>
			<!-- first -->
			<li>
				<span class="category" onmouseover="viewCategory(0)" onmouseout="hideCategory(0)"> GLAMPING & CARAVAN
				 	<ul class="sub">
				 		<li> <a href="../main/introduce">인사말</a> </li>
				 		<li id="long"> <a href="../main/map">찾아오시는 길</a> </li>	
				 	</ul>
				 </span>
			</li>
			
			<!-- second -->
			<li>
				<span class="category" onmouseover="viewCategory(1)" onmouseout="hideCategory(1)"> ROOMS
				  	<ul class="sub">
				  		<li id="long2"> <a href="../product/productList"> 글램핑&카라반 </a> </li>
				  	</ul>
				  </span>
			</li>
			
			<!-- third -->
			<li>
				<span class="category" onmouseover="viewCategory(2)" onmouseout="hideCategory(2)"> SPECIALTY
					<ul class="sub">
						<li> 글램핑 </li>
						<li> 카라반 </li>
						<li> 수영장 </li>
						<li> 장작 </li>
						<li> 바베큐 </li>
					</ul>				
				</span>
			</li>
			
			<!-- fourth -->
			<li>
			<span class="category" onmouseover="viewCategory(3)" onmouseout="hideCategory(3)"> COMMUNITY
					<ul class="sub">

						<li> <a href="../community/noticeList"> 공지사항 </a> </li>
						<li> <a href="../community/freeBoard"> 게시판 </a> </li>
						<li> <a href="../community/comQnaList"> Q&A </a> </li>

					</ul>				
				</span>
			
			</li>
		</ul>
	</nav>

	<sitemesh:write property="body"/>

	<footer>
	    <div>
	        <p>상호: WeAreGlampers · 대표자: 윤영제·이지현·강동완 · 통신판매신고번호: 제 2022-경기고양-0362 호</p>
	        <p>COMPANY REGISTRATION NUMBER: 058-59-00369 · ADDRESS: 55, Goyang-si, Ilsan-dong-gu ,Madhu-dong, , Gyeonggi-do, Korea</p>
	        <p>CARAVAN&GLAMPING: 010-2237-1667 · EMAIL: wags@naver.com</p>
	    </div>
	</footer>
	
</body>
</html>