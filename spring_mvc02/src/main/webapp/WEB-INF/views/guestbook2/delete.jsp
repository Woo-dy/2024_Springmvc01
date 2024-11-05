<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		a {text-decoration: none; color: #222;}
		table{width: 600px; border-collapse:collapse; text-align: center;}
		table,th,td{border: 1px solid black; padding: 3px}
		table tr td:nth-child(2) {text-align: left; padding: 5px 10px;}
		div{width: 600px; margin:auto; text-align: center;}
		input[type="text"], 
		input[type="password"] {height: 22px;}
		input[type="submit"] {margin-bottom: 8px;}
	</style>
</head>
<body>
	<div>
		<h2>방명록 : 삭제화면</h2>
		<hr>
		<p><a href="${pageContext.request.contextPath}/GuestBook2Controller?cmd=gb2_list">[목록으로 이동]</a></p>
		<form action="${pageContext.request.contextPath}/GuestBook2Controller" method="post">
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="gb_pw" size ="20"></td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2" style="text-align: right; padding: 5px 10px;">
							<input type="hidden" name="gb_idx" value="${gb_idx}">
							<input type="hidden" name="cmd" value="gb2_delete_ok">
							<input type="button" value="삭제" onclick="delete_ok(this.form)">
						</td> 
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function delete_ok(f) {
			const pwd = "${gb_pw}"; // command 에서 가져온 비밀번호
			const pwd2 = f.gb_pw.value; // form 안에 있는 gb_pw 비밀번호
			
			if(pwd == pwd2) {
				const conf = confirm("정말 삭제할까요?");
				if (conf) {
					f.action="${pageContext.request.contextPath}/GuestBook2Controller";
					f.submit();
				} else {
					history.go(-1); // 이전화면으로 이동
				}
			} else {
				// password 가 틀릴 때
				alert("비밀번호가 틀립니다.");
				f.gb_pw.value="";
				f.gb_pw.focus();
				return;
			}
		}
	</script>
</body>
</html>