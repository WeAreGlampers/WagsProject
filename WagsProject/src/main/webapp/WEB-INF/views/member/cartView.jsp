<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script>

	var chk = $('#allChk').is(':checked');
	if(chk) {
		$('input[id=subChk]').prop('checked', true);
	};
</script>
</head>
<body>  <!-- /member/cartView.jsp -->
<input type="checkbox" id="allChk">
<input type="button" onclick="reservation()">
<c:forEach items="${cartMap}" var="map">
	<div>
		<input type="checkbox" name="subChk" onclick="subChk()">
		<div>${map.title}</div>
		<div>${map.pimg}</div>
		<div>${map.inday} ~ ${map.outday}</div>
		<div>기준 ${map.standard}명 / 최대 ${map.max}명 </div>
		<div>${map.totalPrice}원</div>
	</div>
</c:forEach>


</body>
</html>