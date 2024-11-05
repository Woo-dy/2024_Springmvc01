<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<%--  
		카카오 디벨로퍼 로그인 후 내 애플리케이션에서 애플리케이션 선택 후 javascript 키 복사
		카카오 디벨로퍼 > 내 애플리케이션 > 앱 설정 > 앱 키
		JavaScript 키 : bf89de22bd35e32edd59edcd3baf74da
		
		카카오 디벨로퍼 > 제품 > 지도/로컬 선택 > 문서보기 > 왼쪽 메뉴에 지도 선택 (https://apis.map.kakao.com/)
		> Web >  시작하기 클릭 > Sample 정보에 모든것이 다 있다.
	--%>
	<h1>kakao_map01</h1>
	
	<!-- 지도를 표시할 div 입니다 -->
	<div id="map" style="width:100%;height:350px;"></div>
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bf89de22bd35e32edd59edcd3baf74da"></script>
	<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨 (1-14)
	    };
	
	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	</script>
	
</body>
</html>