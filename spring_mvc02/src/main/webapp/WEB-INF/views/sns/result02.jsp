<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>네이버 로그인</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
</head>
<body>
	<h2>로그인 성공</h2>
	
	<div id="result"></div>
	
	<!-- 네이버는 별도의 로그아웃이 없다. -->
	<a href="/naverLogout">로그아웃</a>
	
	<script type="text/javascript">
		$(function() {
			$("#result").empty();
			$.ajax({
				url: "/naverUserInfo",
				method: "post",
				dataType: "json",
				success: function(data) {
					console.log(data);
					alert("읽기 성공");
					
					let name = data.response.name;
					let nickname = data.response.nickname;
					let email = data.response.email;
					let profile_image = data.response.profile_image;
					
					let str = "<li>이름 : " + name + "</li>";
					    str += "<li>닉네임 : " + nickname + "</li>";
					    str += "<li>이메일 : " + email + "</li>";
					    str += "<li>프로필 사진 : <img src=" + profile_image + " style='width: 100px;'></li>";
					
					$("#result").append(str);    
				}, error : function() {
					alert("읽기 실패");
				}
			});
		});
	</script>
</body>
</html>