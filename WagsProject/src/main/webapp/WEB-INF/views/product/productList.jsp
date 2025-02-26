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
#right{
  display:inline-block;
  line-height:30px;
  width:150px;
  float:right;
}
#dateChk{
  display:inline-block;
  float:left;
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
#cal #mainTable{
  border-spacing:0px;
  width:500px;
  height:400px;
  text-align:center;
  background:white;
}
#cal #mainTable > caption{
  border:1px solid black;
  background:white;

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
var start="";
var end="";
var sd=0,sm=0,sy=0;
var ed=0,em=0,ey=0;
var ty=0,tm=0;
function makeCal(y,m){
	if(y==-1){
		var today=new Date();
		y=today.getFullYear();
		m=today.getMonth(); //0~11
		ty=y; tm=m;
	}
	if(m==-1){
		y--;
		m=11;
	}
	if(m==12){
		y++;
		m=0;
	}
	var xday=new Date(y,m,1);
	var yoil=xday.getDay(); // 0~6(일~토)
	var nums=[31,28,31,30,31,30,31,31,30,31,30,31];
	var chong=nums[m];
	if(m==1){ // 윤년인 경우 2월 총 일수
		if( (y%4==0 && y%100!=0) || y%400==0 ){
			chong++;
		}
	}
	var ju=Math.ceil((chong+yoil)/7);
	var calData="<table align='center' border='1' id='mainTable'>";
	calData+="<caption><h3>";
	if((ty==y && tm<m) || ty<y){
		calData+="<a href='javascript:makeCal("+y+","+(m-1)+")'>이전 </a>";
	}
	calData+=y+"년 "+(m+1)+"월 ";
	calData+="<a href='javascript:makeCal("+y+","+(m+1)+")'>다음</a>";
	calData+="</h3></caption>";
	calData+"<tr>";
	calData+="<td>일</td>";
	calData+="<td>월</td>";
	calData+="<td>화</td>";
	calData+="<td>수</td>";
	calData+="<td>목</td>";
	calData+="<td>금</td>";
	calData+="<td>토</td>";
	calData+="</tr>";
	
	var day=1;
	for(i=0;i<ju;i++){
		calData+="<tr>";
		for(j=0;j<7;j++){
			if((i==0 && j<yoil) || day>chong){
				calData+="<td>&nbsp;</td>";
			}
			else if(start!="" && end==""){
				if(start==dateString(y,m,day)){
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay' style='background:pink;'>"+day+"</td>";
					day++;
				}
				else{
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay'>"+day+"</td>";
					day++;
				}
			}
			else if(end!=""){
				if(ey==y && sy==y && em==m && sm==m && day>=sd && day<=ed){
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay' style='background:pink;'>"+day+"</td>";
					day++;
				}
				else if(ey==y && em==m && sm!=m && day<=ed){
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay' style='background:pink;'>"+day+"</td>";
					day++;
				}
				else if(sy==y && sm==m && em!=m && day>=sd){
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay' style='background:pink;'>"+day+"</td>";
					day++;
				}
				else{
					calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay'>"+day+"</td>";
					day++;
				}
			}
			else{
				calData+="<td onclick='dateChk("+y+","+m+","+day+")' class='calDay'>"+day+"</td>";
				day++;
			}
		}
		calData+="</tr>";
	}
	calData+="<tr><td colspan='7'><input type='button' value='완료' onclick='calDel()'></td></tr>"
	calData+="</table>";
	document.getElementById("cal").innerHTML=calData;
	event.stopPropagation();
}
function dateChk(y,m,d){
	var calDay=document.getElementsByClassName("calDay");
	if(start==""){
		start=dateString(y,m,d);
		calDay[d-1].style.background="pink";
		sd=d; sm=m; sy=y;
	}
	else if(end==""){
		if(sy==y){
			if(sm==m){
				for(i=sd-1;i<d;i++){
					calDay[i].style.background="pink";
				}
				ed=d; em=m; ey=y;
				end=dateString(y,m,d);
			}
			else if(sm<m){
				for(i=0;i<d;i++){
					calDay[i].style.background="pink";
				}
				ed=d; em=m; ey=y;
				end=dateString(y,m,d);
			}
			else{
				start=dateString(y,m,d);
				calDay[d-1].style.background="pink";
				sd=d; sm=m; sy=y;
			}
		}
		else if(sy<y){
			for(i=0;i<d;i++){
				calDay[i].style.background="pink";
			}
			ed=d; em=m; ey=y;
			end=dateString(y,m,d);
		}
		else{
			start=dateString(y,m,d);
			calDay[d-1].style.background="pink";
			sd=d; sm=m; sy=y;
		}
		
	}
	else{
		for(i=0;i<calDay.length;i++){
			calDay[i].style.background="white";
		}
		start=dateString(y,m,d);
		end=""; ed=0; em=0; ey=0;
		sd=d; sm=m; sy=y;
		calDay[d-1].style.background="pink";
	}

}
function dateString(y,m,d){
	m++;
	m=m+"";
	m=m.padStart(2,"0");
	d=d+"";
	d=d.padStart(2,"0");
	return y+"-"+m+"-"+d;
}
function calDel(){
	if(start!=""){
		document.getElementById("dateChk").innerText=start+"~"+end;
	}
	document.getElementById("cal").innerHTML="";
}
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
	location="productList?inday="+start+"&outday="+end+"&num="+num;
}
window.onload=function(){
	if("${inday}"!=""){
		document.getElementById("dateChk").innerText="${inday}"+"~"+"${outday}";
	}
	if("${num}"!=""){
		document.getElementById("chk").innerText="${num}"+"명";
	}
	
}

</script>
</head>
<body>
<section>
  <div id="cal">
  </div>
  <div id="first">
    <div id="outer">
      <div id="left" onclick="makeCal(-1,-1)">
        <div id="dateChk">일정선택</div> 
        <div id="down">∨</div>
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
</body>
</html>