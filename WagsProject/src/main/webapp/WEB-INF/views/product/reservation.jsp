<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.pagination {
  text-align: center;
  padding: 10px 0;
}

.pagination a {
  display: inline-block;
  padding: 5px 10px;
  margin: 0 3px;
  border-radius: 3px;
  text-decoration: none;
  color: #333;
}

.pagination a:hover {
  background-color: #f5f5f5;
}

.pagination .current {
  background-color: #f0f0f0;
  font-weight: bold;
}

.pagination .nav-btn {
  background-color: #f9f9f9;
  border: 1px solid #eee;
}
section{
	width:1100px;
	margin:auto;
}
.check{
	border-bottom:5px solid #FFF6E0;
	width:400px;
	margin:auto;
	padding-bottom:20px;
	margin-top:20px;
}
b{
	color:#333;
}

#content{
	border:2px solid #FFE08C;
	border-radius:3px;
	height:100px;
	width:400px;
	margin:auto;
	margin-top:20px;
	color:#333;
}
#title{
	line-height:60px;
	font-weight:900px;
	font-size:30px;
	text-align:center;
	border:none;
	outline:none;
	color:#333;
}
#price{
	width:400px;
	margin:auto;
	margin-top:20px;
	color:#333;
}
#price2{
	height:30px;
}
#left{
	float:left;
}
#right{
	float:right;
}
#price3{
  height:40px;
}
#totalPrice{
	color:#333;
	font-size:20px;
	font-weight:800px;
	float:right;
}
hr{
	background:#FFE08C;
	border:1px;
	height:1px;
}
#hr2{
	background:#FFE08C;
    height:2px;
	border:1px;
}
#title2{
	font-size:20px;
	font-weight:800;
	text-align:left;
	height:60px;
	line-height:60px;
	color:#333;
}
#member{
	height:50px;
	text-align:left;
	color:#333;
}
#title3{
	margin-top:15px;
	text-align:left;
	font-size:16px;
	font-weight:700;
	color:#333;
}
#req{
	text-align:left;
	margin-top:10px;
	border:1px solid #333;
	border-radius:3px;
	height:110px;
	margin-bottom:20px;
}
textarea{
	border:none;
	resize:none;
	outline:none;
	border-radius:3px;
	margin-left:3px;
}
#num{
	text-align:right;
	margin-right:10px;
	color:#FFE08C;
}
#pay1{
	height:40px;
	text-align:left;
	color:#333;
}
#useSave{
	text-align:right;
	border:1px solid #333;
	border-radius:3px;
	outline:none;
}
#left2{
	font-size:17px;
	font-weight:700;
	float:left;
}
#totalPriceAll{
	color:red;
	font-size:20px;
	font-weight:800px;
	float:right;
}
.pform{
	display:none;
}
.tdPay{
	text-align:left;
	width:400px;
	color:#333;
}
.pay{
	display:none;
}
#btn{
	margin-top:10px;
	margin-bottom:20px;
}
input[type=button]{
	background:#FFE08C;
	border:1px solid #FFE08C;
	color:#333;
	border-radius:5px;
	font-size:15px;
}
input[type=submit]{
	background:#FFE08C;
	border:2px solid #FFE08C;
	color:#333;
	border-radius:5px;
	font-size:15px;
	width:100px;
	height:30px;
}
select{
	color:#333;
	border:2px solid #FFE08C;
	border-radius:5px;
	outline:none;
}
select option{
	border:2px solid #FFE08C;
	border-radius:5px;
}
</style>
<script>
function upNum(text){
	document.getElementById("num").innerText=text.value.length+"/500";
}
var mySave=${mdto.save};
function calSave(my){
	if(isNaN(my.value) || my.value.length==0){
		alert("숫자를 입력하세요");
		my.value="0";
		document.getElementById("save").innerText=comma(mySave);
		document.getElementById("totalPriceAll").innerText=comma(${totalPriceAll})+"원";
	}
	else{
		if(my.value>mySave){
			my.value="0";
		}
		else{
			var result=mySave-parseInt(my.value);
			document.getElementById("save").innerText=comma(result);
			document.getElementById("totalPriceAll").innerText=comma(${totalPriceAll}-my.value)+"원";
		}
		
	}
	
}
function comma(price) 
{
	return new Intl.NumberFormat().format(price); 
}
var payChk=0;
function viewHide(){
	var pay=document.getElementsByClassName("pay");
	if(payChk%2==0){
		document.getElementsByClassName("tdPay")[1].style.height="120px";
		for(i=1;i<pay.length;i++){
			pay[i].style.display="block";
		}
		document.getElementById("arrow").innerText="▲";
	}
	else{
		document.getElementsByClassName("tdPay")[1].style.height="35px";
		for(i=1;i<pay.length;i++){
			pay[i].style.display="none";
		}
		document.getElementById("arrow").innerText="▼";
	}
	payChk++;
	
}
function chgPay(n){
	var pform=document.getElementsByClassName("pform");
	for(i=0;i<pform.length;i++){
		pform[i].style.display="none";
	}
	pform[n].style.display="block";
}
window.onpageshow=function(){
	document.getElementsByClassName("pform")[0].style.display="block";
	document.getElementsByClassName("pay")[0].style.display="block";
	document.getElementsByClassName("tdPay")[1].style.height="35px";
	document.getElementsByClassName("tdPay")[0].style.height="50px";
}
</script>
</head>
<body>
<section>
 <form method="post" action="reservationOk">
 <b>아래내용이 맞는지 확인해주세요</b>
 <c:forEach items="${clist}" var="cdto" varStatus="sts">
 <input type="hidden" name="pcode" value="${cdto.pcode}">
 <input type="hidden" name="inday" value="${cdto.inday}">
 <input type="hidden" name="outday" value="${cdto.outday}">
 <input type="hidden" name="fireWood" value="${cdto.fireWood}">
 <input type="hidden" name="grill" value="${cdto.grill}"> 
 <input type="hidden" name="fireWoodPrice" value="${cdto.fireWoodPrice}">
 <input type="hidden" name="grillPrice" value="${cdto.grillPrice}"> 
 <input type="hidden" name="totalPrice" value="${cdto.totalPrice}">
 <input type="hidden" name="roomPrice" value="${cdto.roomPrice}">
 <input type="hidden" name="people" value="${cdto.people}">
  <div class="check">
	<div id="content">
		<input type="text" id="title" name="title" value="${cdto.title}" readonly>
		<div id="date">
			일정 ${cdto.inday} ~ ${cdto.outday} ( ${days[sts.index]}박 ${days[sts.index]+1}일 )
		</div> 
	</div>
	<div id="price">  
	  <div id="price2">
		<div id="left">${cdto.title}</div>
		<div id="right"><fmt:formatNumber value="${cdto.roomPrice}" type="number" pattern="#,###"/>원</div>
	  </div>
		<c:if test="${cdto.fireWood>0 || cdto.grill>0 || cdto.people>0}">
			<hr>
			<div id="price2">옵션</div>
			<c:if test="${cdto.people>0}">
			  <div id="price2">
			    <div id="left">추가인원</div>
		        <div id="right"><fmt:formatNumber value="${cdto.people*15000}" type="number" pattern="#,###"/>원</div>
	          </div>
			</c:if>
			<c:if test="${cdto.fireWood>0}">
			  <div id="price2">
				<div id="left">장작 ${cdto.fireWood}</div>
				<div id="right">
					<fmt:formatNumber value="${cdto.fireWoodPrice}" type="number" pattern="#,###"/>원
				</div>
			  </div>
			</c:if>
			<c:if test="${cdto.grill>0}">
			  <div id="price2">	
				<div id="left">바베큐 ${cdto.grill}</div>
				<div id="right">
					<fmt:formatNumber value="${cdto.grillPrice}" type="number" pattern="#,###"/>원
				</div>
			  </div>
			</c:if>
		</c:if>
		<hr id="hr2">
		<div id="price3">
		  <div id="left">결제금액</div>
		  <div id="totalPrice">
			<fmt:formatNumber value="${cdto.totalPrice}" type="number" pattern="#,###"/>원
		  </div>
		</div>
	</div>
  </div>
  </c:forEach>
  <div class="check">
      <div id="title2">예약자 정보</div>
      <div id="member">
        <div id="left">${mdto.name}<br>${mdto.phone}</div>
        <div id="right"><input type="button" value="변경" onclick="location='../member/memberInfo'"></div>
      </div>
      <hr>
      <div>
        <div id="title3">요청사항</div>
        <div id="req">
          <textarea maxlength="500" cols="53" rows="5" onkeyup="upNum(this)" name="req"></textarea>
          <div id="num">0/500</div>
        </div>
      </div>
  </div>
  <div class="check">
    <div id="title2">결제 정보</div>
    <div id="pay1">
      <div id="left">적립금 사용</div>
      <div id="right"><input type="text" name="useSave" value="0" size="4" id="useSave" onblur="calSave(this)">원 사용 ||
        보유: <span id="save"><fmt:formatNumber value="${mdto.save}" type="number" pattern="#,###"/></span>원
      </div>
    </div>
    <div id="pay1">
      <div id="left2">총결제금액</div>
      <div id="totalPriceAll">
        <fmt:formatNumber value="${totalPriceAll}" type="number" pattern="#,###"/>원
      </div>
    </div>
    <hr>
    <b>결제수단</b>
    <div class="tdPay">
      <div class="pay">
        <input type="radio" name="pay" value="0" onclick="chgPay(this.value)" checked>신용/체크카드
        <div class="pform">
          <select name="card1">
            <option value="0">신한카드</option>
            <option value="1">우리카드</option>
            <option value="2">농협카드</option>
            <option value="3">KB카드</option>
          </select>
          <select name="halbu">
            <option value="0">일시불</option>
            <option value="1">2개월</option>
            <option value="2">3개월</option>
            <option value="3">6개월</option>
            <option value="4">12개월</option>            
          </select>
        </div>
      </div>
    </div>
    <div class="tdPay">    
      <div onclick="viewHide()">다른 결제 수단<span id="arrow">▼</span></div>
      <div class="pay">  
        <input type="radio" name="pay" value="1" onclick="chgPay(this.value)">계좌이체
        <div class="pform">
          <select name="bank1">
            <option value="0">신한은행</option>
            <option value="1">우리은행</option>
            <option value="2">농협은행</option>
            <option value="3">KB은행</option>
          </select>
        </div>
      </div>
      <div class="pay">
        <input type="radio" name="pay" value="2" onclick="chgPay(this.value)">법인카드
        <div class="pform">
          <select name="card2">
            <option value="0">신한카드</option>
            <option value="1">우리카드</option>
            <option value="2">농협카드</option>
            <option value="3">KB카드</option>
          </select>
        </div>
      </div>
      <div class="pay">
        <input type="radio" name="pay" value="3" onclick="chgPay(this.value)">휴대폰
        <div class="pform">
          <select name="tel">
            <option value="0">SKT</option>
            <option value="1">KT</option>
            <option value="2">LG</option>
            <option value="3">알뜰통신</option>
          </select>
        </div>
      </div>
      <div class="pay">
        <input type="radio" name="pay" value="4" onclick="chgPay(this.value)">무통장입금
        <div class="pform">
          <select name="bank2">
            <option value="0">신한은행</option>
            <option value="1">우리은행</option>
            <option value="2">농협은행</option>
            <option value="3">KB은행</option>
          </select>
        </div>
      </div>
    </div>
  </div>
  <div id="btn"><input type="submit" value="예약하기"></div>
 </form>
</section>
</body>
</html>