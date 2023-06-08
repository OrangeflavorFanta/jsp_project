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
	
	<form action="read" method="post">
		<table class="table table-bordered" style="width: 400px;">
		<caption><b>사원정보입력</b></caption>
		
			<tr>
				<th>사원명</th>
					<td>
					<input type="text" name="name" size="10">
					</td>
			</tr>
			
			<tr>
				<th>부서명</th>
					<td>
					<input type="text" name="depart" size="10">
					</td>
			</tr>
		
			<tr>
				<th>급여</th>
					<td>
					<input type="text" name="money" size="10">
					</td>
			</tr>
			
			<tr>
				<th>나이</th>
					<td>
					<input type="text" name="age" size="10">
					</td>
			</tr>
		
			<tr>
				<th>혈액형</th>
					<td>
					<input type="text" name="blood" size="10">
					</td>
			</tr>
			
			
			<tr>
				<td>
				<input type="submit" value="전송" class="" size="10">
				</td>
			</tr>
		
		</table>
		
	</form>
	
</body>
</html>