<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<style type="text/css">
		a.kakao_login {
			cursor: pointer;
		}
		
		a:link {  text-decoration: none;   color: navy }
		a:visited {    text-decoration: none;    color: navy }
		a:hover {    text-decoration: none;    color: red }
		body {    text-align: center  }
		hr {
		    width: 600px;
		    border: 1px;
		    color: navy;
		}
		div#header, div#nav {
		    width: 600px;
		    margin: 10px auto;
		    text-align: center;
		}
		div#wrap {   margin: 0 auto;  }
		div#log {    float: right;  }
	</style>
</head>
<body>
	<h1>일반 로그인</h1>
	
    <div id="login" style="margin: 30px;">
        <form action="/member_login" method="post">
            <p>    ID : <input type="text" name="m_id" required>    </p>
            <p>    PW : <input type="password" name="m_pw" required></p>
            <input type="submit" value="로그인">
        </form>
    </div>
    
    
	<h1>SNS 로그인</h1>
	
	<!-- 인가코드 받기 요청 -->
	<a href="https://kauth.kakao.com/oauth/authorize?client_id=93cab3abc27954ed3c0b279f51e70a49&redirect_uri=http://localhost:8080/kakaologin&response_type=code" claas="kakao_login">
		<img src="resources/images/kakao_login_large_wide.png" alt="카카오 로그인 버튼">
	</a>
	

	<hr>
	
	<a href="https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=AQTXliUsR7gpZbhrjxKM&state=STATE_STRING&redirect_uri=http://localhost:8080/naverlogin">
		<img src="resources/images/btnG.png" alt="네이버 로그인 버튼" style="height: 90px;">
	</a>
	
	<hr>
	
	<button type="button" onclick="kakao_map01()">카카오 지도 연습01</button>
	<button type="button" onclick="kakao_map02()">카카오 지도 연습02</button>
	<button type="button" onclick="kakao_map03()">카카오 지도 연습03</button>
	<button type="button" onclick="kakao_map04()">카카오 지도 연습04</button>
	<button type="button" onclick="daum_addr_Form()">다음주소API</button>
	
	<script type="text/javascript">
		function kakao_map01() {
			location.href = "/kakao_map01";
		}
		
		function kakao_map02() {
			location.href = "/kakao_map02";
		}
		
		function kakao_map03() {
			location.href = "/kakao_map03";
		}
		
		function kakao_map04() {
			location.href = "/kakao_map04";
		}
		
		function daum_addr_Form() {
			location.href = "/daum_addr_Form";
		}
	</script>
</body>
</html>