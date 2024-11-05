<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
    <h2>Ajax(json) 연습하는 장소</h2>
    <button id="btn1">테스트</button>
    <button id="btn2">테스트(markup)</button>
    <button id="btn3">테스트(공공데이터)</button>
    
    <hr>
    <div id="result"></div>
    
    <script type="text/javascript">
	$("#btn1").click(function() {
		$("#result").empty();
		$.ajax({
			url : "/test05", // 서버 주소
			method : "post", // 전달 방식
			dataType : "json", // 가져오는 결과 데이터 타입

			// data : "", // 서버에 갈 때 가져갈 데이터(파라미터)
			// async : "", // true 또는 false 비동기 = (기본, 생략, true), 동기 = false
			success : function(data) {
				// AjaxTestController 에서 return 값이 이쪽에서 출력
				// cosole.log(data);
				let table = "<table>";
				table += "<thead><tr><th>name</th><th>scope</th></tr></thead>";
				table += "<tbody>";
				
				$each(data, function(index, obj){
					let name = obj.name;
					let scope = obj.scope;
					
					table += "<tr>";
					table += "<td>" + name + "</td>";
					table += "<td>" + scope + "</td>";
					table += "</tr>";
				});
				
				table += "</tbody>";
				table += "</table>";
				
				$("#result").append(table);
			},
		   	error:function() {
				alert("읽기실패")
		   	}
		});
	});
	

	$("#btn2").click(function() {
		$("#result").empty();
		$.ajax({
			url : "/test06", // 서버 주소
			method : "post", // 전달 방식
			dataType : "json", // 가져오는 결과 데이터 타입

			success : function(data) {
				let table = "<table>";
				table += "<thead><tr><th>id</th><th>brand</th><th>name</th><th>price</th></tr></thead>";
				table += "<tbody>";
				
				
				$each(data, function(index, obj){
					// 최대 5개만 표시
					if (index >= 5) {
						return false; // 반복 종료
					}
					
					let id = obj.id;
					let brand = obj.brand;
					let name = obj.name;
					let price = obj.price;
					let img = obj.image_link;
					
					table += "<tr>";
					table += "<td>" + id + "</td>";
					table += "<td>" + brand + "</td>";
					table += "<td>" + name + "</td>";
					table += "<td>" + price + "</td>";
					table += "<td><img src='" + img + "' widht='100px'></td>";
					table += "</tr>";
				});
				
				table += "</tbody>";
				table += "</table>";
				
				$("#result").append(table);
			},
		   	error:function() {
				alert("읽기실패")
		   	}
		});
	});
	
	$("#btn3").click(function() {
		$("#result").empty();
		$.ajax({
			url : "/test07", // 서버 주소
			method : "post", // 전달 방식
			dataType : "json", // 가져오는 결과 데이터 타입

			success : function(data) {
				let items = data.response.body.items.item;
				table += "<thead><tr><td>제목</td><td>제목</td><td>제목</td></tr></thead>";
			},
		   	error:function() {
				alert("읽기실패")
		   	}
		});
	});
    </script>
</body>
</html>