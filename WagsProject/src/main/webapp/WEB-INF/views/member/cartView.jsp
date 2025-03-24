<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style>
/* 기존 CSS 유지하면서 수정 */
#allChkDiv {
    width: 800px;
    margin: auto;
    padding: 15px;
    text-align: left;
    margin-bottom: 20px;
    display: flex;
    align-items: center;
}

#allChk {
    margin-right: 15px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* 체크박스 스타일 */
.subChk {
    margin: 10px;
    width: 18px;
    height: 18px;
    cursor: pointer;
}

/* 선택예약 버튼과 선택삭제 버튼 통일 */
#reserveBtn, input[type="button"][onclick="cartDel()"] {
    width: 100px;
    height: 36px;
    background: #FFE08C;
    color: #CC723D;
    font-weight: 600;
    border: #FFE08C;
    border-radius: 8px;
    margin-right: 15px;
    cursor: pointer;
    text-align: center;
}

#reserveBtn:hover, input[type="button"][onclick="cartDel()"]:hover {
    text-decoration: underline;
}

/* allChkDiv 안의 요소들 간격 조정 */
#allChkDiv label {
    display: flex;
    align-items: center;
    cursor: pointer;
    margin-right: auto;
}

/* 상품 항목 스타일 - 상품 구분을 위한 새 스타일 */
.cart-item {
    width: 800px;
    margin: 0 auto 30px;
    padding: 20px;
    border: 1px solid #ddd;
    border-radius: 10px;
    box-shadow: 0 2px 5px rgba(0,0,0,0.1);
    background-color: #fff;
    position: relative;
}

.cart-item-header {
    display: flex;
    align-items: center;
    margin-bottom: 15px;
    border-bottom: 1px solid #eee;
    padding-bottom: 10px;
}

.cart-item-title {
    font-size: 18px;
    font-weight: bold;
    margin-left: 10px;
    color: #333;
}

.cart-item-content {
    display: flex;
}

.cart-item-image {
    flex: 0 0 300px;
    margin-right: 20px;
}

.cart-item-image img {
    border-radius: 8px;
    width: 300px;
    height: 250px;
    object-fit: cover;
}

.cart-item-details {
    flex: 1;
}

.cart-item-info {
    margin-bottom: 10px;
    font-size: 15px;
}

.cart-item-dates {
    font-weight: bold;
    color: #333;
    margin-bottom: 15px;
}

.cart-item-options {
    color: #666;
}

.cart-item-price {
    font-size: 18px;
    font-weight: bold;
    color: #CC723D;
    margin-top: 15px;
    text-align: right;
}

.cart-item-delete {
    margin-top: 15px;
    text-align: right;
}

.delete-btn {
    width: 80px;
    height: 32px;
    background: #FFE08C;
    color: #CC723D;
    font-weight: 600;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

.delete-btn:hover {
    text-decoration: underline;
}

/* 빈 장바구니 메시지 */
.empty-cart {
    text-align: center;
    padding: 50px 0;
    color: #888;
}
</style>
<script>
function allCheck(my) {
	var subChk = document.getElementsByClassName("subChk");
	if (my.checked) {
		for (i = 0; i < subChk.length; i++) {
			subChk[i].checked = true;
		}
	} else {
		for (i = 0; i < subChk.length; i++) {
			subChk[i].checked = false;
		}
	}
}
function subCheck() {
	var subChk = document.getElementsByClassName("subChk");
	var chkNum = 0;
	for ( i = 0; i < subChk.length; i++) {
		if (subChk[i].checked) {
			chkNum++;
		}
	}
	
	if(subChk.length == chkNum) {
		document.getElementById("allChk").checked=true;
	} else {
		document.getElementById("allChk").checked=false;
	}
}

function cartDel() {
	var subChk = document.getElementsByClassName("subChk");
	var ids = "";
	for (i=0;i<subChk.length;i++){
		if (subChk[i].checked) {
			ids = ids + subChk[i].value + ",";
		}
	}
	location="cartDel?ids="+ids;
}

window.onpageshow = function() {
	if (document.getElementsByClassName("subChk").length==0) {
		document.getElementById("allChkDiv").style.display="none";
	}
}
</script>
</head>
<body>  <!-- /member/cartView.jsp -->
<form method="post" action="../product/reservation">
<div id="allChkDiv">
  <label for="allChk">
    <input type="checkbox" id="allChk" onclick="allCheck(this)">
    전체선택
  </label>
  <input type="submit" id="reserveBtn" value="선택예약">
  <input type="button" onclick="cartDel()" value="선택삭제">
</div>

<c:if test="${empty cartMap}">
  <div class="empty-cart">
    <p>장바구니에 상품이 없습니다.</p>
  </div>
</c:if>

<c:forEach items="${cartMap}" var="map">
	<div class="cart-item">
		<div class="cart-item-header">
			<input type="checkbox" name="subChk" class="subChk" onclick="subCheck()" value="${map.id}">
			<div class="cart-item-title">${map.title}</div>
		</div>
		
		<div class="cart-item-content">
			<div class="cart-item-image">
				<img src="../static/product/${map.pimg}" alt="${map.title}">
			</div>
			
			<div class="cart-item-details">
				<div class="cart-item-info cart-item-dates">
					<span class="inday">${map.inday}</span> ~ <span class="outday">${map.outday}</span>
				</div>
				
				<div class="cart-item-info cart-item-options">
					장작 <span class="fireWood">${map.fireWood}</span> | <span class="fireWoodPrice1"><fmt:formatNumber value="${map.fireWoodPrice}" type="number" pattern="#,###"/></span>원
				</div>
				
				<div class="cart-item-info cart-item-options">
					바베큐 <span class="grill">${map.grill}</span> | <span class="grillPrice1"><fmt:formatNumber value="${map.grillPrice}" type="number" pattern="#,###"/></span>원
				</div>
				
				<div class="cart-item-info">
					기준 ${map.standard}명 / 최대 ${map.max}명
				</div>
				
				<div class="cart-item-price">
					<span class="totalPrice1"><fmt:formatNumber value="${map.totalPrice}" type="number" pattern="#,###"/></span>원
				</div>
				
				<div class="cart-item-delete">
					<input type="button" class="delete-btn" value="삭제" onclick="location='cartDel?ids=${map.id}'">
				</div>
			</div>
		</div>
		
		<!-- 필요한 hidden input 필드들 추가 -->
		<input type="hidden" name="pcode" value="${map.pcode}" class="pcode">
		<input type="hidden" name="people" value="${map.standard}" class="people">
		<input type="hidden" name="fireWoodPrice" value="${map.fireWoodPrice}" class="fireWoodPrice">
		<input type="hidden" name="grillPrice" value="${map.grillPrice}" class="grillPrice">
		<input type="hidden" name="roomPrice" value="${map.roomPrice}" class="roomPrice">
		<input type="hidden" name="totalPrice" value="${map.totalPrice}" class="totalPrice">
	</div>
</c:forEach>
</form>

</body>
</html>