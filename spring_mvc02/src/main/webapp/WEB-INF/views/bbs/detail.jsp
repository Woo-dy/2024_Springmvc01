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
	#bbs table {
	    width:800px;
	    margin:0 auto;
	    margin-top:20px;
	    border:1px solid black;
	    border-collapse:collapse;
	    font-size:14px;
	    
	}
	
	#bbs table caption {
	    font-size:20px;
	    font-weight:bold;
	    margin-bottom:10px;
	}
	
	#bbs table th {
	    text-align:center;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	#bbs table td {
	    text-align:left;
	    border:1px solid black;
	    padding:4px 10px;
	}
	
	.no {width:15%}
	.subject {width:30%}
	.writer {width:20%}
	.reg {width:20%}
	.hit {width:15%}
	.title{background:lightsteelblue}
	.odd {background:silver}
	
	fieldset {margin: 0;}
</style>

</head>
<body>
	<div id="bbs">
	<form method="post" encType="multipart/form-data">
		<table summary="게시판 상세보기">
			<caption>게시판 상세보기</caption>
			<tbody>
				<tr>
					<th>제목:</th>
					<td>${bvo.subject}</td>
				</tr>
				<tr>
					<th>이름:</th>
					<td>${bvo.writer}</td>
				</tr>
				<tr>
					<th>내용:</th>
					<td>${bvo.content}</td>
				</tr>
				<tr>
					<th>첨부파일:</th>
					<c:choose>
						<c:when test="${empty bvo.f_name}">
							<td>첨부파일 없음</td>
						</c:when>
						<c:otherwise>
							<td>
								<a href="bbs_down?f_name=${bvo.f_name}">
									<img src="resources/upload/${bvo.f_name}" style="width: 80px">
								</a> <br>
								${bvo.f_name}
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td colspan="2">
					    <input type="text" name="b_idx" value="${bvo.b_idx}">
					    <input type="text" name="cPage" value="${cPage}">
						<input type="button" value="수정" onclick="bbs_update(this.form)">
						<input type="button" value="삭제" onclick="bbs_delete(this.form)">
						<input type="button" value="목록" onclick="bbs_list(this.form)">
					</td>
				</tr>
			</tbody>
		</table>
	</form>
	</div>
	
	<%-- 댓글 입력 창 --%>
	<div style="padding: 10px; width: 800px; margin: 0 auto;">
		<form action="/comment_insert" method="post">
			<fieldset>
				<p>
					<div>이름</div>
					<input type="text" name="writer">
				</p>
				<p>
					<div>내용</div>
					<textarea rows="3" cols="40" name="content"></textarea>
					<!-- 댓글 저장 시 어떤 댓글이 원글인지 저장해야 한다. -->
					<input type="hidden" name="b_idx" value="${bvo.b_idx}">
					<input type="hidden" name="cPage" value="${cPage}">
					<input type="submit" value="등록">
				</p>
			</fieldset>
		</form>
	</div>
	<%-- 댓글 출력 창 --%>
	<div style="display: table; width: 800px; margin: 0 auto;">
		<%-- <div>${clist}</div> --%>
		<c:forEach var="k" items="${clist}">
			<form action="/comment_delete" method="post">
				<div style="border-bottom: 1px solid #cc00cc; width: 800px; margin: 5px; padding: 5px;">
					<p>이름 : ${k.writer}</p>
					<p>내용 : ${k.content}</p>
					<p>날짜 : ${k.write_date}</p>
					<%-- 실제는 로그인 성공 후 관리자이거나 글쓴 본인인 경우만 삭제 가능 --%>
					<input type="submit" value="삭제">
					<%-- 컨트롤러 가서 DB 삭제 후 다시 이곳으로 와야 한다. (나중에 ajax로 변경하자) --%>
					<input type="text" name="c_idx" value="${k.c_idx}">
					<input type="text" name="b_idx" value="${k.b_idx}">
					<input type="text" name="cPage" value="${cPage}">
				</div>
			</form>
		</c:forEach>
	</div>
	

	<script type="text/javascript">
		function bbs_update(f) {
			f.action = "/bbs_update";
			f.submit();
		}
		
		function bbs_delete(f) {
			f.action = "/bbs_delete";
			f.submit();
		}
		
		function bbs_list(f) {
			f.action = "/bbs";
			f.submit();
		}
	</script>
</body>
</html>

