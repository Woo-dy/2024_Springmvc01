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
	<h1>카카오 로그인 성공</h1>
	<div id="result"></div>
	
	<!-- 계정과 함께 로그아웃 -->
	
	
	<a href="https://kauth.kakao.com/oauth/logout?client_id=93cab3abc27954ed3c0b279f51e70a49&logout_redirect_uri=http://localhost:8080/kakaologout">
		로그아웃
	</a>
	
	<script type="text/javascript">
		// 기본형
		// $(document).ready(function() { });
		// 축약형
		// $(function() { });
		
		$(function() {
			$("#result").empty();
			
			$.ajax({
				url: "/kakaoUserInfo",
				method: "post",
				dataType: "json",
				success: function(data) {
					console.log(data);
					alert("읽기 성공");
					
					let nickname = data.properties.nickname;
					let profileImage = data.properties.profile_image;
					let email = data.kakao_account.email;
				
					
					// ajax json 이용 데이터를 받아서 처리
					// let name = data.properties.nickname;
             		// let img = data.properties.profile_image;
             		
             		// let str  = "<li>닉네임 : "+ name +" </li>";
                    //     str += "<li>이미지 : <img src= " + img +"> </li>";
             		
             		// 세션 이용
					let str = "<li>닉네임 : " + nickname + "</li>";
						str += "<li>프로필 사진 : <img src=" + profileImage + " style='width: 100px;'></li>";
						str += "<li>이메일 : " + email + "</li>";
					
					$("#result").append(str);
					
				}, error : function() {
					alert("읽기 실패");
				}
			});
		});
	</script>
</body>
</html>