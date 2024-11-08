<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
#bbs table {
	width: 780px;
	margin:0 auto;
	margin-top:20px;
	border: 1px solid black;
	border-collapse: collapse;
	font-size: 14px;
}

#bbs table caption {
	font-size: 20px;
	font-weight: bold;
	margin-bottom: 10px;
}

#bbs table th, #bbs table td {
	text-align: center;
	border: 1px solid black;
	padding: 8px 10px;
}

.no { width: 10% }
.subject { 	width: 45% }
.writer {	width: 10% }
.reg {	width: 20% }
.hit {	width: 15% }
.title {	background: lightsteelblue }
.odd {	background: silver }

/* paging */
table tfoot ol.paging {
	list-style: none;
	margin: 0;
}

table tfoot ol.paging li {
	float: left;
	margin-right: 8px;
	text-align: center;
}

table tfoot ol.paging li a {
	display: block;
	height: 30px;
	line-height: 30px;
	padding: 0 5px;
	border: 1px solid #00B3DC;
	color: #2f313e;
	font-weight: bold;
	text-decoration: none;
}

table tfoot ol.paging li a:hover {
	background: #00B3DC;
	color: white;
	font-weight: bold;
}

.disable {
	height: 30px;
	line-height: 30px;
	padding: 0 5px;
	border: 1px solid silver;
	color: silver;
	cursor: pointer;
}

.num {
	width: 30px;
	height: 30px;
	line-height: 30px;
	border: 1px solid silver;
	cursor: pointer;
}

.now {
	width: 30px;
	height: 30px;
	line-height: 30px;
	border: 1px solid #ff4aa5;
	background: #fff;
	color: #ff4aa5;
	font-weight: bold;
}
</style>
</head>
<body>
	<div id="bbs">
		<table summary="게시판 목록">
			<caption>board 게시판 목록</caption>
			<thead>
				<tr class="title">
					<th class="no">번호</th>
					<th class="subject">제목</th>
					<th class="writer">글쓴이</th>
					<th class="reg">날짜</th>
					<th class="hit">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${empty board_list}">
						<tr>
							<td colspan="5">
								게시물이 존재하지 않습니다.
							</td>
						</tr>
					</c:when>
					
					<c:otherwise>
						<c:forEach var="k" items="${board_list}" varStatus="c">
							<tr>
								<td>${paging.totalRecored - ((paging.nowPage-1) * paging.numPerPage + c.index)}</td>
			  					
			  					<td style="text-align: left;">
			  						<!-- 1부터 0까지니깐 for문이 안 돌아간다. -->
			  						<c:forEach begin="1" end="${k.b_step}">&nbsp; <span>[Re]</span> </c:forEach>
				  					<c:choose>
										<c:when test="${k.active == 1}">
											<span style="color:lightgray">삭제된 게시물 입니다.</span>
										</c:when>
										<c:otherwise>
											<a href="/board_detail?idx=${k.idx }&cPage=${paging.nowPage}"> ${k.title }</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td>${k.writer}</td>
								<td>${k.regdate}</td>
								<td>${k.hit}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
			<tfoot>
				<tr>
					<td colspan="4">
						<ol class="paging">
							<!-- 이전 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock <= paging.pagePerBlock}">
									<li class="disable">이전으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="/board_list?cPage=${paging.beginBlock - paging.pagePerBlock}">이전으로</a></li>
								</c:otherwise>
							</c:choose>
							
							<!-- 페이지번호 -->
							<c:forEach begin="${paging.beginBlock}" end="${paging.endBlock}" step="1" var="k">
								<c:choose>
									<c:when test="${k == paging.nowPage }">
										<li class="now">${k }</li>
									</c:when>
								    <c:otherwise>
								    		<li><a href="/board_list?cPage=${k}">${k }</a></li>
								    </c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음 버튼 -->
							<c:choose>
								<c:when test="${paging.beginBlock >= paging.pagePerBlock}">
									<li class="disable">다음으로</li>
								</c:when>
								<c:otherwise>
									<li><a href="/board_list?cPage=${paging.beginBlock + paging.pagePerBlock}">다음으로</a></li>
								</c:otherwise>
							</c:choose>
						</ol>
					</td>
					<td>
						<input type="button" value="글쓰기" onclick="board_write()"> 
					</td>
				</tr>
			</tfoot>
		</table>
	</div>	
	<script type="text/javascript">
		function board_write() {
			location.href = "/board_write?cPage=" + ${paging.nowPage};
		}
	</script>
</body>
</html>