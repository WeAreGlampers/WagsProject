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
	margin: 0px;
	font-family: 'GongGothicMedium';
}

#firstLine {
	width: 1100px;
	height: 40px;
	margin: auto;
	background: purple;
}

header {
	width: 1100px;
	height: 70px;
	margin: auto;
	background:yellow;
}

nav {
	width: 1100px;
	height: 60px;
	margin: auto;
	background: blue;
}

footer {
	width: 1100px;
	height: 150px;
	margin: auto;
	background: pink;
}
</style>
<sitemesh:write property="head"/>
</head>
<body>
	<div id="firstLine"></div>

	<header></header>

	<nav></nav>

	<sitemesh:write property="body"/>

	<footer></footer>
	<!--  -->
</body>
</html>