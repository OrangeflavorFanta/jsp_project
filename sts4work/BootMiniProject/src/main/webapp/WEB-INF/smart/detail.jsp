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

<style type="text/css">

	.day{
	color: gray;
	font-size: 14px;
	float: right;
	}
	
	.box{
		width: 30px;
		height: 30px;
		border: 1px solid gray;
		border-radius: 100px;
		float: right;
	}


</style>
</head>
<body>

	<div style="width: 600px; margin: 100px 100px;">
	<b style="font-size: 20px;">${dto.sangname}</b>	
	<span class="day">입고일: ${dto.ipgoday }</span>
	<br><br>
	
	<b style="font-size: 18px;">
	<fmt:formatNumber value="${dto.price }" pattern="currency"></fmt:formatNumber>
	</b>
	<b>${dto.color }</b>
	<div class="box" style="background-color: ${dto.color}"></div>
	<br><br>
	<hr>
	
	${dto.content }
	<br><br>
	
	<button type="button" class="btn btn-danger"
	onclick="location.href=''">삭제</button>
	<button type="button" class="btn btn-info"
	onclick="location.href='list?&currentPage=${currentPage}'">목록</button>
	</div>

</body>
</html>