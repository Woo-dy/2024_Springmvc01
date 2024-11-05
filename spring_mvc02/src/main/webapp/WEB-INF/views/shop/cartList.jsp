<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table {
	margin: 10px auto;
	width: 800px;
	border-collapse: collapse;
	font-size: 12pt;
	border-color: navy;
}

table, th {
	border: 1px solid black;
	padding: 5px 0;
}

td {
	border: 1px solid black;
	padding: 5px 10px;
}
</style>
</head>
<body>
	<jsp:include page="top.jsp" />
	<table>
		<caption>
			<h2>:: 장바구니 내용 ::</h2>
		</caption>
		<thead>
			<tr bgcolor="#dedede">
				<th width="5%">
					<input type="checkbox" name="chk">
				</th>
				<th width="10%">제품번호</th>
				<th width="20%">제품명</th>
				<th width="20%">단가</th>
				<th width="20%">수량</th>
				<th width="15%">금액</th>
				<th width="10%">삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty cart_list}">
					<tr align="center">
						<td colspan="7">
							<b>장바구니가 비었습니다.</b>
						</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach var="k" items="${cart_list}">
						<tr align="center">
							<td>
								<input type="checkbox" name="chk">
							</td>
							<td>${k.p_num}</td>
							<td>${k.p_name}</td>
							<td>
								정가: <fmt:formatNumber value="${k.p_price}" pattern="#,##0"/>
								<br> 
								<font color="red"> 
									세일가격: <fmt:formatNumber value="${k.p_saleprice}" pattern="#,##0"/>
								</font>
							</td>
							<td>
								<form action="/cart_edit" method="post">
									<input type="number" name="p_su" min="1" value="${k.p_su}"
									style="width: 50px;">
									<input type="hidden" name="cart_idx" value="${k.cart_idx}"> 
									<input type="submit" value="수정">
								</form>
								<%-- <fmt:formatNumber value="${k.p_su}" pattern="#,##0"/> --%>
							</td>
							<td>
								<fmt:formatNumber value="${k.p_price * k.p_su}" pattern="#,##0"/>
							</td>
							<td>
								<input type="button" value="삭제"
								style="border: 1 solid black; cursor: pointer"
								onclick="cart_del(${k.cart_idx})">
							</td>
						</tr>
						<!-- c:set : jsp 에서 변수 선언 -->
						<!-- 누적 계산 방법 : cartTotal + (k.price * p_su) -->
						<c:set var="cartTotal" value="${cartTotal = cartTotal + (k.p_price * k.p_su)}" />
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="6" align="right">총 결재액 : <fmt:formatNumber value="${cartTotal}" pattern="#,##0"/></td>
				<td>
					<input type="button" value="전체삭제" style="border: 1 solid black; cursor: pointer">
				</td>
			</tr>
		</tfoot>
	</table>
	
	<script type="text/javascript">
		function cart_del(cart_idx) {
			location.href = "/cart_delete?cart_idx="+cart_idx;
		}
	</script>
</body>
</html>