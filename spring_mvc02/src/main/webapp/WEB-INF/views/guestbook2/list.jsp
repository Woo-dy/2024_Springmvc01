<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
<style type="text/css">
	a {text-decoration: none; color: #222;}
	table{width: 600px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 5px;}
	table thead tr th {background-color: #99ccff;}
	div{width: 600px; margin:auto; text-align: center;}
	input[type="submit"] {margin-bottom: 8px;}
</style>
</head>
<body>
	<div>
		<h2> 방 명 록 </h2>
		<hr>
		<%-- <form action="${pageContext.request.contextPath }/GuestBookController" method="post">
			<input type="submit" value="방명록 쓰기">
			<input type="hidden" name="cmd" value="g_write">
		</form>  --%>
		
		<p><a href="/gb2_write">[방명록 쓰기]</a></p>
		<table>
			<colgroup>
				<col width="10%">
				<col width="15%">
				<col width="55%">
				<col width="20%">
			</colgroup>
			<thead>
				<tr>
					<th>번호</th>
					<th>작성자</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<%--  
						GuestBookListCommand 에서 저장한 => list == request.setAttribute("list", list);
					--%>
					<c:when test="${empty gb2_list}">
						<tr>
							<td colspan="4">데이터가 없습니다.</td>
						</tr>
					</c:when>
				
					<c:otherwise>
						<%-- 
							배열이나 리스트는 무조건 items 사용
							변수(var)은 k 
							varStatus => for 문이 돌아가는 숫자를 세준다.
						--%>
						<c:forEach items="${gb2_list}" var="k" varStatus="c">
							<tr>
								<td>${c.count}</td>
								<td>${k.gb_name}</td>
								<td style="text-align: left; padding: 0 20px;">
									<a href="/gb2_detail?gb_idx=${k.gb_idx}">
										${k.gb_subject}
									</a>
								</td>
								<td>${k.gb_regdate.substring(0,10)}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>
</body>
</html>




