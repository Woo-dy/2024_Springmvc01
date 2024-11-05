<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h1>city : ${city}</h1>
	<c:forEach var="k" items="${carName}">
		<h2>${k}</h2>
	</c:forEach>
</body>
</html>