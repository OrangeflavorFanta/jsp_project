<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
</head>
<body>
	<h3 class="alert alert-info">Ex1 예제</h3>
	<br>
	
	<button type="button" id="btn1" class="btn btn-info">list1 Json데이터 출력</button>
	<div id="out1"></div>
	
	<script type="text/javascript">
	
		$("#btn1").click(function () {//json처리 후 브라우저로 바로 출력
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"list1",
				success:function(res){
			
					$("#out1").empty();
					$("#out1").append("이름: "+res.name+"<br>");
					$("#out1").append("핸드폰: "+res.hp+"<br>");
					$("#out1").append("주소: "+res.addr+"<br>");
				}
			
			});
		
		});
		
	</script>
	
	
</body>
</html>