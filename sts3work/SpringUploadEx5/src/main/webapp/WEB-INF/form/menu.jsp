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
	
	<div style="margin-left: 200px; margin-top: 50px;">
		<button type="button" class="btn btn-warning" onclick="location.href='shop/form1'">각각 읽기</button>
		<button type="button" class="btn btn-warning" onclick="location.href='shop/form2'">DTO 읽기</button>
		<button type="button" class="btn btn-warning" onclick="location.href='shop/form3'">MAP 읽기</button>
		
		<button type="button" class="btn btn-warning" onclick="location.href='board/uploadform1'">이미지 1개 업로드</button>
		<button type="button" class="btn btn-warning" onclick="location.href='board/uploadform2'">이미지 여러개 업로드</button>
	</div>
</body>
</html>