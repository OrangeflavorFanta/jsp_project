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
	<h2>상품 정보 출력</h2>
	<div style="color: ${dto.color};">
		상품명: ${dto.sang }<br>
		수량: <fmt:formatNumber value="${dto.su}" pattern="#,##0"></fmt:formatNumber><br>
		단가:  <fmt:formatNumber value="${dto.dan}" type="currency"></fmt:formatNumber><br>
		총금액: <fmt:formatNumber value="${dto.su*dto.dan}" type="currency"></fmt:formatNumber><br>
	</div>
	
</body>
</html>