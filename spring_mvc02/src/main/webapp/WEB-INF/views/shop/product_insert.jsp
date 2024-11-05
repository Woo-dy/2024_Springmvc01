<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style type="text/css">
		table {
			width: 800px;
			border-collapse: collapse;
			font-size: 12pt;
			border-color: navy;
		}

		table, th, td {
			border: 1px solid black;
			padding: 5px;
		}
		
		th {
			background-color: #f8f8f8;
			text-align: center;
		}
		
		td {
			 text-align: left;
		}
		
		div {
			width: 800px;
			margin: 0 auto;
		}
		
		input {padding: 5px; margin: 0px;}
		textarea {width: 80%; margin: 5px;}
	</style>
</head>
<body>
	<form action="/shop_product_insert_ok"  method="post" enctype="multipart/form-data">
	<div>
		<table>
			<caption>
				<h2>상품 등록 페이지</h2>
			</caption>
			<tr>
				<th>분류</th>
				<td>
					<label>
						<input type="radio" name="category" value="com001" checked> 컴퓨터
					</label>
					<label>
						<input type="radio" name="category" value="ele002"> 가전 제품
					</label>
					<label>
						<input type="radio" name="category" value="sp003"> 스포츠
					</label>
				</td>
			</tr>
			<tr>
				<th>제품번호</th>
				<td>
					<input type="text" name="p_num">
				</td>
			</tr>
			<tr>
				<th>제품명</th>
				<td>
					<input type="text" name="p_name" required>
				</td>
			</tr>
			<tr>
				<th>판매사</th>
				<td>
					<input type="text" name="p_company" required>
				</td>
			</tr>
			<tr>
				<th>상품가격</th>
				<td>
					<input type="number" name="p_price" required>
				</td>
			</tr>
			<tr>
				<th>할인가</th>
				<td>
					<input type="number" name="p_saleprice" required>
				</td>
			</tr>
			<tr>
				<th>상품이미지-S</th>
				<td>
					<input type="file" name="file_s" required>
				</td>
			</tr>
			<tr>
				<th>상품이미지-L</th>
				<td>
					<input type="file" name="file_l" required>
				</td>
			</tr>
			<tr>
				<th colspan="2">상품내용</th>
			</tr>
			<tr>
				<td colspan="2">
					<textarea name="p_content" rows="10" cols="50"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="상품등록">
				</td>
			</tr>
		</table>
	</div>
	</form>
</body>
</html>