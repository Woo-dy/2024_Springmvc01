<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<style type="text/css">
		h1 {
			text-align: center;
		}
		
		h2 {
			width: 750px;
			margin: 0 auto;
			text-align: right;
		}
	
		table {
			border-collapse: collapse;
			width: 750px;
			margin: 0 auto;
		}
		
		table tr th {
			background-color: lightgreen;
		}
		
		table tbody tr {
			cursor: pointer;
		}
		
		table tbody tr:hover {
			background-color: #f6f6f6;
		}
		
		table tr:nth-child(even) {
			background-color: #f8f8f8;
		}
		
		table tr th,
		table tr td {
			border: 1px solid #aaa;
			padding: 5px;
			text-align: center;
		}
	</style>
</head>
<body>
	<c:choose>
		<c:when test="${idx == 1}"><h1>사번 검색 결과 결과</h1></c:when>
		<c:when test="${idx == 2}"><h1>이름 검색 결과 결과</h1></c:when>
		<c:when test="${idx == 3}"><h1>직종 검색 결과 결과</h1></c:when>
		<c:when test="${idx == 4}"><h1>부서 검색 결과 결과</h1></c:when>
	</c:choose>
	<h2>인원 : (${list.size()} 명)</h2>
	<table>
		<thead>
			<tr>
				<th>번호</th>
				<th>사번</th>
				<th>이름</th>
				<th>직종</th>
				<th>부서</th>
			</tr>
		</thead>
		
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5">자료가 존재하지 않습니다.</td>
					</tr>
				</c:when>
				
				<c:otherwise>
					<c:forEach var="k" items="${list}" varStatus="vs">
						<tr>
							<td>${vs.count}</td>
							<td>${k.empno}</td>
							<td>${k.ename}</td>
							<td>${k.job}</td>
							<td>${k.deptno}</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
	</table>

</body>
</html>