<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section {
	width: 1100px;
	margin: auto;
	text-align: center;
	padding-bottom: 80px;
	height: 800px;
}

section h3, h4 {
	color: #CC723D;
}

section div {
	margin-top: 10px;
}

section .txt {
	width: 420px;
	height: 42px;
	border: 2px solid #FFE08C;
	border-radius: 8px;
	outline: none;
	padding-left: 10px;
}

section #submit {
	width: 435px;
	height: 46px;
	background: #FFE08C;
	font-weight: 900;
	color: #CC723D;
	border: #FFE08C;
	border-radius: 8px;
}

section #submit:hover {
	text-decoration: underline;
	cursor: pointer;
}

section textarea {
	width: 411px;
	height: 150px;
	border: 2px solid #FFE08C;
	border-radius: 8px;
	outline: none;
	padding: 10px;
	resize: none;
}

section .info {
	color: #555;
	margin: 5px 0;
}

section .star {
	width: 30px;
	height: 30px;
	cursor: pointer;
	margin: 0 3px;
}

section hr {
	border: 1px solid #FFE08C;
	width: 80%;
	margin: 20px auto;
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
	var title = document.reviewForm.title.value;
	var content = document.reviewForm.content.value;
        
	if (star == "") {
		alert("별점을 입력해주세요.");
		return false;
	} else if(title.trim() == "") {
		alert("제목을 입력해주세요.");
		return false;
	} else if(content.trim() == "") {
		alert("내용을 입력해주세요.");
		return false;
	} else {
		return true;
	}
}
	
window.onpageshow = function() {
	var sco = ${rdto.star};
	var star = document.getElementsByClassName("star");

	for (i=0;i<sco;i++){
		star[i].src="../static/star1.png";
	}
}
</script>
</head>
<body>
	<!-- /member/reviewUpdate.jsp -->
	<section>
		<div>
			<h3>${map.ptitle}</h3>
		</div>

		<div>이용 날짜 : ${map.inday} ~ ${map.outday}</div>
		<div>이용 상품 : ${map.title}</div>
		<div>이용 옵션 : 장작 ${map.fireWood} | 바베큐 ${map.grill}</div>
		<hr>
		<form name="reviewForm" method="post" action="reviewUpdateOk"
			onsubmit="return submitChk()">
			<input type="hidden" name="rid" value="${map.id}"> <input
				type="hidden" name="star" value="${rdto.star}"> <input
				type="hidden" name="pcode" value="${rdto.pcode}">
			<div>
				<input type="text" name="title" class="txt" value="${rdto.title}">
			</div>
			<div>
				<textarea name="content" rows="10" cols="50">${rdto.content}</textarea>
			</div>
			<div>
				<span
					style="color: #CC723D; font-weight: bold; display: block; margin-bottom: 10px">별점을
					선택해주세요</span> <img src="../static/star2.png" onclick="chgStar(0)"
					class="star"> <img src="../static/star2.png"
					onclick="chgStar(1)" class="star"> <img
					src="../static/star2.png" onclick="chgStar(2)" class="star">
				<img src="../static/star2.png" onclick="chgStar(3)" class="star">
				<img src="../static/star2.png" onclick="chgStar(4)" class="star">
			</div>
			<div>
				<input type="submit" value="리뷰 작성" id="submit">
			</div>
		</form>
	</section>

</body>
</html>