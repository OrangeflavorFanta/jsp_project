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
	
	<h1>어디로 갈래</h1>
		<button type="button" class="btn btn-info btn-large"
		onclick="location.href='car'">자동차 폼</button>
		<button type="button" class="btn btn-info btn-large"
		onclick="location.href='shop'" >쇼핑몰 폼</button>
		
		<!-- <a href="carlist">자동차몰</a>
		<a href="jshoplist">쇼핑몰</a> -->

</body>
</html>