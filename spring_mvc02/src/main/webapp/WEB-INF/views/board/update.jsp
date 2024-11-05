<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">
<style type="text/css">
tr {
	text-align:center;
	padding:4px 10px;
	background-color: #F6F6F6;
}
	
th {
	width:120px;
	text-align:center;
	padding:4px 10px;
	background-color: #B2CCFF;
}
</style>

	<script type="text/javascript">
	<c:if test="${pwdchk == 'fail'}">
		alert("비밀번호 틀림");
	</c:if>
	</script>
</head>
<body>
	<div align="center">
	<form method="post" encType="multipart/form-data">
		
		<table summary="게시판 수정">
			<caption>게시판 수정</caption>
			<tbody>
				<tr>
					<th>작성자</th>
					<td align="left">
						<input type="text" name="writer" value="${bovo.writer}" required>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td align="left"> 
						<input type="text" name="title" value="${bovo.title}" required>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td align="left">
						<textarea rows="10" cols="60" id="content" name="content">${bovo.content}</textarea>
					</td>
				</tr>
				<tr>
					<th>첨부파일</th>
					<td align="left">
						<c:choose>
							<c:when test="${empty bovo.f_name}">
								<td>
									<input type="file" name="file_name"><b>이전 파일 없음</b>
									<input type="hidden" name="old_file_name" value="">
								</td>
							</c:when>
							<c:otherwise>
							<td>
								<input type="file" name="file_name"><b>이전 파일 있음<br>${bovo.f_name}</b>
								<input type="hidden" name="old_file_name" value="${bovo.f_name}">
							</td>
							</c:otherwise>
						</c:choose>
					</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td align="left">
						<input type="password" name="pwd">
					</td>
				</tr>
				<tr>
					<td colspan="2"> 
						<input type="text" name="cPage" value="${cPage}" /> 
						<input type="text" name="idx" value="${idx}" /> 
						
						<input type="button" value="수정완료" onclick="board_update_ok(this.form)" /> 
						<input type="button" value="목록" onclick="board_list_go(this.form)" /> 
						<input type="reset" value="취소" />
					</td>
				</tr>
	    	</tbody>
		</table>
	</form>
	</div>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js" ></script>
	<script src="resources/js/lang/summernote-ko-KR.js" ></script>
	
	<script type="text/javascript">
		$(function() {
			$("#content").summernote({
				lang : 'ko-KR',
				height : 300,
				focus : true,
				placeholder : "최대 3000자까지 쓸 수 있습니다.",
				callbacks : {
		        	onImageUpload : function(files, editor) {
						for (let i = 0; i < files.length; i++) {
							sendImage(files[i], editor);
						}
					}
		        }
			});
		});
		
		function sendImage(file, editor) {
			// FormData 객체를 전송할 때 , JQuery 가 설정
			let frm = new FormData();
			frm.append("s_file", file);
			$.ajax({
				url : "/saveImg",
				data: frm,
				method: "post",
			  	contentType : false,
			  	processData : false,
				cache : false,
				dataType : "json",
				success : function(data) {
					const path = data.path;
					const fname = data.fname;
					$("#content").summernote("editor.insertImage", path+"/"+fname);
				},
				error : function() {
					alert("읽기 실패");
				}
			});	
		}
	</script>
	
	
	<script type="text/javascript">
		function board_update_ok(f) {
			// alert("클릭 되었습니다.");
			/* for (var i = 0; i < f.elements.length; i++) {
				if (f.elements[i].value == "") {
					if (i == 3) continue;
					alert(f.elements[i].name + "를 입력하세요");
					f.elements[i].focus();
					return;
				}
			} */
			f.action = "/board_update_ok";
			f.submit();
		}
		
		function board_list_go(f) {
			f.action = "/board_list";
			f.submit();
		}
	</script>
</body>
</html>