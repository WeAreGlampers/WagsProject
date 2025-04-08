<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 목록</title>
<style>
section {
  width: 1100px;
  margin: auto;
  position: relative;
  padding: 20px 0;
}

#firs {
  width: 1100px;
  height: 40px;
  text-align: center;
  margin-bottom: 20px;
}

#fouter {
  border: 2px solid #FFE08C;
  border-radius: 6px;
  width: 500px;
  height: 40px;
  margin: auto;
  color: #CC723D;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  background-color: #FFF6E0;
}

#left {
  display: inline-block;
  line-height: 40px;
  width: 250px;
  text-align: left;
  float: left;
  padding-left: 50px;
}

#datepicker {
  width: 240px;
  height: 30px;
  outline: none;
  border: none;
  font-size: 16px;
  color: #CC723D;
  background-color: transparent;
  cursor: pointer;
}

#right {
  display: inline-block;
  line-height: 40px;
  width: 150px;
  float: right;
  cursor: pointer;
}

#chk {
  display: inline-block;
  float: left;
}

#down {
  display: inline-block;
  width: 20px;
  float: right;
  margin-right: 5px;
}

#line {
  display: inline-block;
  margin-left: 0px;
  line-height: 40px;
  float: left;
  color: #FFE08C;
}

#second {
  margin-top: 10px;
  width: 1100px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
}

#room {
  width: 500px;
  height: 420px;
  border: 2px solid #FFE08C;
  border-radius: 6px;
  margin: 0 auto 20px auto;
  color: #333;
  box-shadow: 0 2px 5px rgba(0,0,0,0.1);
  overflow: hidden;
  transition: transform 0.2s;
  cursor: pointer;
}

#room:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

#room img {
  width: 100%;
  height: 270px;
  object-fit: cover;
}

#room #title {
  padding-top: 10px;
  font-size: 22px;
  font-weight: 500;
  padding-left: 15px;
  margin-bottom: 5px;
}

#room #price {
  font-size: 20px;
  font-weight: 600;
  padding-left: 15px;
  padding-bottom: 10px;
}

#room #won {
  font-size: 17px;
  font-weight: 100;
}

#room #people {
  padding-left: 15px;
  padding-bottom: 3px;
  font-size: 14px;
}

#cal {
  position: absolute;
  width: 1100px;
  margin-top: 40px;
  z-index: 100;
}

#su {
  width: 20px;
  text-align: center;
  border: none;
  outline: none;
  font-weight: 600;
  color: #CC723D;
  font-size: 15px;
  background: transparent;
}

#number {
  display: inline-block;
  width: 74px;
  height: 30px;
  border: 1px solid #FFE08C;
  padding-top: 2px;
  border-radius: 3px;
  margin-bottom: 10px;
  background: white;
}

#chkPeople {
  border: 2px solid #FFE08C;
  width: 500px;
  height: 200px;
  text-align: center;
  background: white;
  margin: auto;
  padding-top: 40px;
  color: #CC723D;
  border-radius: 6px;
  box-shadow: 0 5px 15px rgba(0,0,0,0.1);
}

input[type=button] {
  background: #FFE08C;
  border: 1px solid #FFE08C;
  color: #CC723D;
  border-radius: 5px;
  font-size: 15px;
  padding: 8px 20px;
  cursor: pointer;
  margin-top: 15px;
  transition: background-color 0.2s;
}

input[type=button]:hover {
  background: #FFC107;
}

#operator {
  font-size: 20px;
  font-weight: 800;
  cursor: pointer;
  user-select: none;
}

.review-badge {
  display: inline-block;
  padding: 3px 8px;
  margin-left: 15px;
  font-size: 14px;
  color: #CC723D;
  background-color: #FFE08C;
  border-radius: 4px;
}
</style>
<script>
function showChk(){
	var calData="<div id='chkPeople'>";
	calData+="<div style='margin-bottom:10px;'><b>인원을 선택하세요</b></div>";
	calData+="인원  <div id='number'>";
	calData+="<span onclick='downSu()' id='operator'> - </span>";
	calData+="<input type='text' name='su' value='1' id='su' readonly>";
	calData+="<span onclick='upSu()' id='operator'> + </span>";
	calData+="</div><div><input type='button' value='검색' onclick='productList()'></div></div>";
	document.getElementById("cal").innerHTML=calData;	
}
function downSu(){
	var num=document.getElementById("su").value;
	if(num>1){
		document.getElementById("su").value=--num;
	}
}
function upSu(){
	var num=document.getElementById("su").value;
	document.getElementById("su").value=++num;
}
function productList(){
	var num=document.getElementById("su").value;
	var datepicker=document.getElementById("datepicker").value;
	if(datepicker.length>23){
		location="productList?num="+num;
	}
	else{
		location="productList?date="+datepicker+"&num="+num;
	}
}
window.onpageshow=function(){
	if("${date}"!=""){
		document.getElementById("datepicker").value="${date}";
	}
	if("${num}"!=""){
		document.getElementById("chk").innerText="${num}"+"명";
	}
	
}
</script>
<script src="https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.umd.min.js"></script>
</head>
<body>
<section>
  <div id="cal">
  </div>
  <div id="firs">
    <div id="fouter">
      <div id="left">
        <input type="text" id="datepicker" readonly value="일정선택                                    ∨"> 
        <input type="hidden" id="inday">
        <input type="hidden" id="outday">
      </div>
      <div id="line">|</div>
      <div id="right" onclick="showChk()">
        <div id="chk">인원선택</div>
        <div id="down">∨</div>
      </div>
    </div>
  </div>
  <div id="second">
    <c:forEach items="${plist}" var="pdto">
      <div id="room" onclick="location='productContent?pcode=${pdto.pcode}&date=${date}'">
        <img src="../static/product/${pdto.pimg}" alt="${pdto.title}">
        <div id="title">${pdto.title}</div>
        <div id="price">
          <fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/><span id="won">원</span>
        </div>
        <div id="people">기준 ${pdto.standard}명 ( 최대 ${pdto.max}명 )</div>
        <div class="review-badge">리뷰 ${pdto.review}</div>
      </div>
    </c:forEach>
  </div>
</section>
<script>
      const picker = new easepick.create({
        element: document.getElementById('datepicker'),
        css: [
          'https://cdn.jsdelivr.net/npm/@easepick/bundle@1.2.1/dist/index.css',
        ],
        plugins: ['RangePlugin','LockPlugin'],
        format: 'YYYY-MM-DD',
        RangePlugin: {
          tooltipNumber(num) {
            return num - 1;
          },
        },
        LockPlugin: {
            minDate: new Date(),
        }
      });
</script>
</body>
</html>
방금 편집됨