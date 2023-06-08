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
	
		<button type="button" class="btn btn-info" style="width: 200px;"
		onclick="location.href='samsung/list'">차량입고</button>
		<button type="button" class="btn btn-info" style="width: 200px;"
		onclick="location.href='member/list'">고객명단</button>
		<button type="button" class="btn btn-info" style="width: 200px;"
		onclick="location.href='sawon/list'">사원명단</button>
		<%-- <c:redirect url="samsung/list"></c:redirect> --%>
		
		
</body>
</html>