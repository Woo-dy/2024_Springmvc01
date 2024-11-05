<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		input[type="text"] {height: 22px;}
		input[type="password"] {height: 22px;}
		input[type="submit"] {margin-bottom: 8px;}
	</style>
</head>
<body>
	<div>
		<h2>방명록 : 상세보기화면</h2>
		<hr>
		<%-- <form action="${pageContext.request.contextPath }/GuestBookController" method="post">
			<input type="submit" value="목록으로 이동">
			<input type="hidden" name="cmd" value="g_list">
		</form> --%>
		<p><a href="/gb2_list">[목록으로 이동]</a></p>
		<form method="post">
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr align="center">
					<td bgcolor="#99ccff">작성자</td>
					<td>${gb2vo.gb_name}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목</td>
					<td>${gb2vo.gb_subject}</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email</td>
					<td>
						${gb2vo.gb_email}
					</td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<c:choose>
						<c:when test="${empty gb2vo.gb_f_name}">
							<td>
								첨부파일 없습니다.
							</td>
						</c:when>
						<c:otherwise>
							<td>
								<span style="text-align: left; display: inline-block;">
									<a href="/guestbook2_down?gb_f_name=${gb2vo.gb_f_name}">
										<img src="resources/upload/${gb2vo.gb_f_name}" alt="${gvo2.gb_f_name}" style="height: 100px;">
									</a>${gb2vo.gb_f_name}
									<p style="font-size: 12px; margin: 0; padding: 0;">※ 이미지를 클릭하시면 다운됩니다.</p>
								</span>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr align="center">
					<td colspan="2">
						${gb2vo.gb_content}
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="hidden" name="gb_idx" value="${gb2vo.gb_idx}">
							<input type="hidden" name="gb_pw" value="${gb2vo.gb_pw}">
							<input type="button" value="수정" onclick="update_go(this.form)">
							<input type="button" value="삭제" onclick="delete_go(this.form)">
						</td>
					</tr>
				</tfoot>
			</table>
		</form>
	</div>
	
	<script type="text/javascript">
		function update_go(f) {
			f.action="/gb2_update";
			f.submit();
		}
		function delete_go(f) {
			f.action="/gb2_delete";
			f.submit();
		}
	</script>
</body>
</html>