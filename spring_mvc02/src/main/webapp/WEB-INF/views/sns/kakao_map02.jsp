<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>카카오 지도 연습-2 (내위치)</title>
	<script type="text/javascript">
		navigator.geolocation.getCurrentPosition(function(position) {
			const lat = position.coords.latitude;
			const lng = position.coords.longitude;
			
			alert(lng);
			
			geo_map(lat, lng);
		});
	</script>
</head>
<body>
	<h1>kakao_map02</h1>
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:100%; height:350px;"></div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf89de22bd35e32edd59edcd3baf74da"></script>
	<script>
	
	function geo_map(lat, lng) {
		
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		
	    mapOption = { 
	        center : new kakao.maps.LatLng(lat, lng), // 지도의 중심좌표
	    	// 지도의 확대 레벨 (1-14)
			level : 2
	    };
	
		// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
		var map = new kakao.maps.Map(mapContainer, mapOption);
	}
	
	</script>
</body>
</html>