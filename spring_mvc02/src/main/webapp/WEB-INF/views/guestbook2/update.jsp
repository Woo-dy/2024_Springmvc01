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
	table,th,td{border: 1px solid black; padding: 3px; }
	table tr td:nth-child(2) {text-align: left; padding: 5px 10px;}
	div{width: 600px; margin:auto; text-align: center;}
	input[type="text"] {height: 22px;}
	input[type="password"] {height: 22px;}
	input[type="submit"] {margin-bottom: 8px;}
</style>

</head>
<body>
	<div>
		<h2>방명록 : 수정화면</h2>
		<hr>
		<%-- <form action="${pageContext.request.contextPath }/GuestBookController" method="post">
			<input type="submit" value="목록으로 이동">
			<input type="hidden" name="cmd" value="g_list">
		</form> --%>
		<p><a href="${pageContext.request.contextPath }/GuestBook2Controller?cmd=gb2_list">[목록으로 이동]</a></p>
		<form action="${pageContext.request.contextPath }/GuestBook2Controller" method="post" enctype="multipart/form-data">
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td><input type="text" name="gb_name" size ="20" value="${gvo2.gb_name }"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td><input type="text" name="gb_subject" size ="20" value="${gvo2.gb_subject}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td><input type="text" name="gb_email" size ="20" value="${gvo2.gb_email}"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<c:choose>
						<c:when test="/${empty gvo2.gb_f_name}">
							<td>
								<input type="file" name="gb_f_name"> <span>이전 파일 없음</span>
								<input type="hidden" name="old_f_name" value="">
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<input type="file" name="gb_f_name"> <span>이전 파일 : ${gvo2.gb_f_name}</span>
								<input type="hidden" name="old_f_name" value="${gvo2.gb_f_name}">
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호</td>
					<td><input type="password" name="gb_pw" size ="20" value="${gvo2.gb_pw}"></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<textarea rows="10" cols="60" name="gb_content">${gvo2.gb_content}</textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="gb_idx" value="${gvo2.gb_idx}">
							<input type="hidden" name="cmd" value="gb2_update_ok">
							<input type="submit" value="수정완료" onclick="update_ok_go(this.form)">
							<input type="reset" value="취소">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function update_ok_go(f) {
			const pwd = "${gvo2.gb_pw}"; // command에서 가져온 비밀번호 
			const pwd2 = f.gb_pw.value;
			
			if(pwd == pwd2) {
				// alert("완료");
				f.action="${pageContext.request.contextPath}/GuestBook2Controller";
				f.submit();
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