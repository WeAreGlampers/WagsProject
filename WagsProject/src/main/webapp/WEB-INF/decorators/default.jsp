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
	padding:0px;
	background-color:white;
	text-align:center;
}

#outer {
	width:100%;
	height:40px;
	background:red;
}

#outer #X {
	cursor:pointer;
}

#outer #first {
	width: 1100px;
	height: 40px;
	margin: auto;
	background:white;
}

#outer #first #greet {
	display:inline-block;
	width:1000px;
	height:40px;
	line-height:40px;
	text-align:center;
	color:black;
}

#outer #first #close {
	display:inline-block;
	width:80px;
	height:40px;
	line-height:40px;
	text-align:right;
	color:black;
}

#newSection {
	width: 1100px;
	height: 30px;
	margin: auto;
	text-align:right;
	background:white;
}

header {
	width: 1100px;
	height: 70px;
	margin: auto;
	background:white;
	color:black;
}

nav {
	width: 1100px;
	height: 80px;
	margin: auto;
	position:relative;
	background:white;
}

nav ul {
	list-style:none; /* li 태그 맨 앞 점 지우기 */
	margin: 0 15px;
	padding: 0px;
	display:flex; /* 가로 정렬 */
	justify-content:space-around; /* 메뉴 항목 균등 정렬 */
	align-items:center; /* 수직 가운데 정렬 */ 
	height:100%;
}

nav ul li {
	color:black;
	text-decoration:none;  /* 링크 밑줄 지우기 */
	font-size:14px;
	font-weight:bold;
	cursor:pointer; 
}

nav #category #firstCategory #firstSub {
	visibility:hidden;
}
nav #category #firstCategory #firstSub li{
	font-size:12px;
	width:100px;
}

nav #category #secondCategory #secondSub {
	visibility:hidden;
}
nav #category #secondCategory #secondSub li {
	font-size:12px;
	width:100px;
}

nav #category #thirdCategory #thirdSub {
	visibility:hidden;
}
nav #category #thirdCategory #thirdSub li {
	font-size:12px;
	width:100px;
}

nav #category #fourthCategory #fourthSub {
	visibility:hidden;
}
nav #category #fourthCategory #fourthSub li {
	font-size:12px;
	width:100px;
}

nav #category #fifthCategory #fifthSub {
	visibility:hidden;
}
nav #category #fifthCategory #fifthSub li {
	font-size:12px;
	width:100px;
}

nav #category #sixthCategory #sixthSub {
	visibility:hidden;
}
nav #category #sixthCategory #sixthSub li {
	font-size:12px;
	width:100px;
}

#logo img {
	width:250px;
}

footer {
	width: 100%;
	height: 150px;
	background: black;
	color:white;
	display:flex;
	justify-content:center;
	align-items:center;
}
</style>
<script>
	
	// 회원전용 메뉴 보였다 숨기기
	function viewPrivate() {
		document.getElementById("privateSub").style.visibility="visible";
	}
	function hidePrivate() {
		document.getElementById("privateSub").style.visibility="hidden";		
	}
	
	// 카테고리 첫번재
	function viewFirst() {
		document.getElementById("firstSub").style.visibility="visible";
	}
	function hideFirst() {
		document.getElementById("firstSub").style.visibility="hidden";
	}
	
	// 카테고리 두번째
	function viewSecond() {
		document.getElementById("secondSub").style.visibility="visible";
	}
	function hideSecond() {
		document.getElementById("secondSub").style.visibility="hidden";
	}
	
	// 카테고리 세번재
	function viewThird() {
		document.getElementById("thirdSub").style.visibility="visible";
	}
	function hideThird() {
		document.getElementById("thirdSub").style.visibility="hidden";
	}
	
	// 카테고리 네번째
	function viewFourth() {
		document.getElementById("fourthSub").style.visibility="visible";
	}
	function hideFourth() {
		document.getElementById("fourthSub").style.visibility="hidden";
	}
	
	// 카테고리 다섯번째
	function viewFifth() {
		document.getElementById("fifthSub").style.visibility="visible";
	}
	function hideFifth() {
		document.getElementById("fifthSub").style.visibility="hidden";
	}
	
	// 카테고리 여섯번째
	function viewSixth() {
		document.getElementById("sixthSub").style.visibility="visible";
	}
	function hideSixth() {
		document.getElementById("sixthSub").style.visibility="hidden";
	}
	
</script>


<sitemesh:write property="head"/>
</head> 
<body> <!-- default.jsp -->
	<div id="outer">
		<div id="first">
			<div id="greet"> 환영합니다. WeAreGlampers 입니다. </div>
			<div id="close"> <span id="X" onclick="outerClose()"> X </span> </div>
		</div>
	</div>
	
	<div id="newSection">
		<!-- 장바구니 -->
		<a href="../member/cartView"> 장바구니 </a>
		
		<!-- 비로그인 상태 -->
		<c:if test="${userid == null}">
			<a href="../login/login"> 로그인 </a>
			<a href="../member/member"> 회원가입 </a>
		</c:if> 
		
		<!-- 로그인 상태 -->
		<c:if test="${userid != null}">
			<span id="privateMenu" onmouseover="viewPrivate()" onmouseout="hidePrivate()"> ${name} 님 
				<ul id="privateSub">
					<li> 마이페이지 </li>				
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
		<ul id="category">
			<!-- first -->
			<li>
				<span id="firstCategory" onmouseover="viewFirst()" onmouseout="hideFirst()"> GLAMPING & CARAVAN
				 	<ul id="firstSub">
				 		<li> 인사말 </li>
				 		<li> 찾아오시는 길 </li>	
				 	</ul>
				 </span>
			</li>
			
			<!-- first -->
			<li>
				<span id="secondCategory" onmouseover="viewSecond()" onmouseout="hideSecond()"> ROOMS
				  	<ul id="secondSub">
				  		<li> 카라반 </li>
				  		<li> 글램핑 </li>
				  	</ul>
				  </span>
			</li>
			
			<!-- first -->
			<li>
				<span id="thirdCategory" onmouseover="viewThird()" onmouseout="hideThird()"> RESERVATION
					<ul id="thirdSub">
						<li> 예약 종합 안내 </li>
						<li> 온라인 예약 </li>
					</ul>				
				</span>
			</li>
			
			<!-- first -->
			<li>
				<span id="fourthCategory" onmouseover="viewFourth()" onmouseout="hideFourth()"> SPECIALTY
					<ul id="fourthSub">
						<li> 글램핑 </li>
						<li> 카라반 </li>
						<li> 수영장 </li>
						<li> 장작 </li>
						<li> 바베큐 </li>
					</ul>				
				</span>
			</li>
			
			<!-- first -->
			<li>
				<span id="fifthCategory" onmouseover="viewFifth()" onmouseout="hideFifth()"> TOUR
					<ul id="fifthSub">
						<li> 주변 여행지 정보를 알려드립니다. </li>
					</ul>				
				</span>
			</li>
			
			<!-- first -->
			<li>
			<span id="sixthCategory" onmouseover="viewSixth()" onmouseout="hideSixth()"> COMMUNITY TOUR
					<ul id="sixthSub">
						<li> 공지사항 </li>
						<li> 이벤트 </li>
						<li> 게시판 </li>
						<li> Q&A </li>
						<li> 여행후기 </li>
					</ul>				
				</span>
			
			</li>
		</ul>
	</nav>



	<sitemesh:write property="body"/>



	<footer> 글램핑 기타 정보 </footer>
	
</body>
</html>