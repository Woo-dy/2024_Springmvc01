<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<title>Error</title>
</head>
<body>
	<h2 style="text-align: center;">error 페이지</h2>
	
    <form action="${pageContext.request.contextPath}/GuestBook2Controller" method="post">
        <input type="submit" value="GuestBook2">
        <input type="hidden" name="cmd" value="gb2_list">
    </form> 
</body>
</html>