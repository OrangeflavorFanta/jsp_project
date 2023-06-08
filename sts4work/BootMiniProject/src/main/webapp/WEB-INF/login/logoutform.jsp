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
<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
<body>

	<div style="margin-left: 100px; margin-top: 100px;">
		<img alt="" src="${root }/image/jejuair.png" width="200" align="left" hspace="20">
		<br>
		<br>
		<!-- id통한 이름 받아서 표시 -->
		<b>${name }님 로그인 중...</b>
		<button type="button" class="btn btn-danger"
			onclick="location.href='logoutprocess'">로그아웃</button>
	</div>


</body>
</html>