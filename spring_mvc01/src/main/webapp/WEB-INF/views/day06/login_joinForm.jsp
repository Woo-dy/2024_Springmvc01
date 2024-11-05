<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원가입 form</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	
	<style type="text/css">
		span {width: 150px; color: green;}
		input {border: 1px solid green;}
		table {width: 80%; margin: 0 auto; border-collapse: collapse;}
		table, th, td {border: 1px solid #ddd; text-align: center;}
	</style>
	
	<script type="text/javascript">
		<c:if test="${result == '1'}">
			alert("회원가입 성공");
		</c:if>
		<c:if test="${result == '0'}">
			alert("회원가입 실패");
		</c:if>
		<c:if test="${loginchk == '0'}">
			alert("로그인 실패");
		</c:if>
	</script>
</head>
<body>
	<h2>회원가입</h2>
	<form action="login_join_ok" method="post" id="myForm">
		<table>
			<thead>
				<tr>
					<th>아이디</th>
					<th>패스워드</th>
					<th>이름</th>
					<th>나이</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
						<input type="text" size="14" name="m_id" required>
					</td>
					<td>
						<input type="password" size="14" name="m_pw" required>
					</td>
					<td>
						<input type="text" size="14" name="m_name" required>
					</td>
					<td>
						<input type="text" size="14" name="m_age" required>
					</td>
				</tr>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4" align="center">
						<input type="submit" value="가입하기">
					</td>
				</tr>
			</tfoot>
		</table>
	</form>
</body>
</html>