<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
section{
	width:500px;
	margin:auto;
	margin-bottom:30px;
}
</style>
</head>
<body>
<section>
  <div><h3>찾아오시는 길</h3></div>
  <div id="map" style="width:500px;height:400px;"></div>
</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=fb1652b70a810bdfa8a256b7f520e412"></script>
<script>
		var container = document.getElementById('map');
		var options = {
			center: new kakao.maps.LatLng(37.5860451, 127.6776874),
			level: 3
		};

		var map = new kakao.maps.Map(container, options);
		
		var markerPosition  = new kakao.maps.LatLng(37.5860451, 127.6776874); 

		var marker = new kakao.maps.Marker({
		    position: markerPosition
		});

		marker.setMap(map);
</script>
</body>
</html>