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
section{
  width:1100px;
  margin:auto;
  position:relative;
}
#first{
  width:1100px;
  height:30px;
  text-align:center;
}
#outer{
  border:1px solid black;
  border-radius:3px;
  width:500px;
  height:30px;
  margin:auto;
}
#left{
  display:inline-block;
  line-height:30px;
  width:250px;
  text-align:left;
  float:left;
  padding-left:50px;
}
#datepicker{
  width:240px;
  height:25px;
  outline:none;
  border:none;
  font-size:16px;
}
#right{
  display:inline-block;
  line-height:30px;
  width:150px;
  float:right;
}
#chk{
  display:inline-block;
  float:left;
}
#down{
  display:inline-block;
  width:20px;
  float:right;
  margin-right:5px;
}
#line{
  display:inline-block;
  margin-left:0px;
  line-height:30px;
  float:left;
}
#second{
  margin-top:10px;
  width:1100px;
}
#room{
  width:500px;
  height:400px;
  border:1px solid black;
  border-radius:3px;
  margin:auto;
  margin-bottom:10px;
}
#room #title{
  font-size:25px;
  font-weight:500;
  padding-left:15px;
}
#room #price{
  font-size:20px;
  font-weight:600;
  padding-left:15px;
  padding-bottom:10px;
}
#room #won{
   font-size:17px;
   font-weight:100;
}
#room #people{
  padding-left:15px;
  padding-bottom:3px;
}
#room #content{
  padding-left:15px;
}
#cal{
  position:absolute;
  width:1100px;
  margin-top:40px;
}
#su{
  width:20px;
  text-align:center;
  border:none;
  outline:none;
  font-weight:600;
}
#number{
  display:inline-block;
  width:74px;
  height:28px;
  border:1px solid #005ae0;
  padding-top:2px;
  border-radius:3px;
  margin-bottom:10px;
}
#chkPeople{
  border:1px solid black;
  width:500px;
  height:200px;
  text-align:center;
  background:white;
  margin:auto;
  padding-top:40px;
}

</style>
<script>
function showChk(){
	var calData="<div id='chkPeople'>";
	calData+="<div style='margin-bottom:10px;'><b>인원을 선택하세요</b></div>";
	calData+="인원  <div id='number'>";
	calData+="<img src='../static/minus.png' valign='middle' onclick='downSu()'>";
	calData+="<input type='text' name='su' value='1' id='su' readonly>";
	calData+="<img src='../static/plus.png' valign='middle' onclick='upSu()'>";
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
window.onload=function(){
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
  <div id="first">
    <div id="outer">
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
      <div id="room" onclick="location='productContent?pcode=${pdto.pcode}'">
        <img src="../static/product/${pdto.pimg}" width="500" height="270">
        <div id="title">${pdto.title}</div>
        <div id="price">
          <fmt:formatNumber value="${pdto.price}" type="number" pattern="#,###"/><span id="won">원</span>
        </div>
        <div id="people">기준 ${pdto.standard}명 ( 최대 ${pdto.max}명 )</div>
        <div id="content">${pdto.content}</div>
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