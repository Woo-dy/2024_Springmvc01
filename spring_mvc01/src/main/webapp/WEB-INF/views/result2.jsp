<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>결과 : result2.jsp</h1>
	
	<h2>dogName</h2>
	<c:forEach var="dog" items="${dogName}"> 
		<h3>${dog}</h3>
	</c:forEach>
	
	<h2>catName</h2>	
	<c:forEach var="cat" items="${catName}"> 
		<h3>${cat}</h3>
	</c:forEach>
	
</body>
</html>