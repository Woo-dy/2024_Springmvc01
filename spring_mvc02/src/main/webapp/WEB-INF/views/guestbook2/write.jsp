<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 방 명 록 </title>
<link rel="stylesheet" href="resources/css/summernote-lite.css">

<style type="text/css">
	a {text-decoration: none; color: #222;}
	table{width: 800px; border-collapse:collapse; text-align: center;}
	table,th,td{border: 1px solid black; padding: 3px; }
	table tr td:nth-child(2) {text-align: left; padding: 5px 10px;}
	div{width: 800px; margin:0 auto;}
	input[type="text"] {height: 22px;}
	input[type="password"] {height: 22px;}
	input[type="submit"] {margin-bottom: 8px;}
	
	
	.note-btn-group {width: auto;}
	.note-editor {width: auto;}
	.note-toolbar {width: auto;}
	.note-editing-area {width: auto; text-align: left;}
	.note-statusbar  {width: auto;}
	.note-editor.note-frame .note-editing-area .note-editable, 
	.note-editor.note-airframe .note-editing-area .note-editable {width: auto;}
</style>

</head>
<body>
	<div>
		<h2>방명록 : 작성화면</h2>
		<hr>
		<%-- <form action="${pageContext.request.contextPath }/GuestBookController" method="post">
			<input type="submit" value="목록으로 이동">
			<input type="hidden" name="cmd" value="g_list">
		</form> --%>
		<p style="text-align: center;"><a href="/gb2_list">[목록으로 이동]</a></p>
		<form action="/gb2_write_ok" method="post" enctype="multipart/form-data">
			<table>
				<colgroup>
					<col width="20%">
					<col width="80%">
				</colgroup>
				<tr align="center">
					<td bgcolor="#99ccff">작성자 <span style="color: red;">*</span></td>
					<td><input type="text" name="gb_name" size ="20" required></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">제  목 <span style="color: red;">*</span></td>
					<td><input type="text" name="gb_subject" size ="20" required></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">email <span style="color: red;">*</span></td>
					<td><input type="text" name="gb_email" size ="20" required></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">첨부파일</td>
					<td><input type="file" name="gb_file_name" size ="20"></td>
				</tr>
				<tr align="center">
					<td bgcolor="#99ccff">비밀번호 <span style="color: red;">*</span></td>
					<td><input type="password" name="gb_pw" size ="20" required></td>
				</tr>
				<tr align="center">
					<td colspan="2">
						<textarea rows="10" cols="60" id="gb_content" name="gb_content"></textarea>
					</td>
				</tr>
				<tfoot>
					<tr align="center">
						<td colspan="2">
							<input type="submit" value="저장">
							<input type="reset" value="취소">
						</td>
					</tr>
				</tfoot>
			</table>
			<p style="font-size: 14px; text-align: right;"><span style="color: red;">*</span> 표시된 항목은 필수항목이므로 작성해주셔야 합니다.</p>
		</form>
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js" crossorigin="anonymous"></script>
	<script src="resources/js/summernote-lite.js" ></script>
	<script src="resources/js/lang/summernote-ko-KR.js" ></script>
	
	<script type="text/javascript">
		$(function() {
			$("#gb_content").summernote({
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
					$("#gb_content").summernote("editor.insertImage", path+"/"+fname);
				},
				error : function() {
					alert("읽기 실패");
				}
			});	
		}
	</script>
</body>
</html>