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
		
	}

</style>
<script>
	function chgStar(n) {
		var star = document.getElementsByClassName("star");
		for (i=0;i<=n;i++) {
			star[i].src="../static/star1.png";
		}
		for (i=n+1;i<star.length;i++) {
			star[i].src="../static/star2.png";
		}
		document.reviewForm.star.value=n+1;
	}
	function submitChk() {
		var star = document.reviewForm.star.value;
		if (star == "") {
			alert("별점을 입력해주세요.");
			return false;
		} else {
			return true;
		}
		
	}
</script>
</head>
<body>  <!-- /member/reviewWrite.jsp -->
<section>
<div> <h3>${map.title}</h3> </div>

<div> 이용 날짜 : ${map.inday} ~ ${map.outday}</div>
<div> 이용 상품 : ${map.title} </div>
<div> 이용 옵션 : 장작 ${map.fireWood} | 바베큐 ${map.grill}</div>
<hr>
<form name="reviewForm" method="post" action="reviewWriteOk" onsubmit="return submitChk()">
<input type="hidden" name="rid" value="${map.id}">
<input type="hidden" name="userid" value="${userid}">
<input type="hidden" name="star">
<input type="hidden" name="pcode" value="${map.pcode}">
<div> 제목 : <input type="text" name="title"> </div>
<div> 내용 : <textarea name="content" rows="10" cols="50"></textarea></div>
<div>
	<img src="../static/star2.png" onclick="chgStar(0)" class="star">
	<img src="../static/star2.png" onclick="chgStar(1)" class="star">
	<img src="../static/star2.png" onclick="chgStar(2)" class="star">
	<img src="../static/star2.png" onclick="chgStar(3)" class="star">
	<img src="../static/star2.png" onclick="chgStar(4)" class="star">
</div>
<div><input type="submit" value="리뷰 작성"></div>
</form>
</section>
</body>
</html>