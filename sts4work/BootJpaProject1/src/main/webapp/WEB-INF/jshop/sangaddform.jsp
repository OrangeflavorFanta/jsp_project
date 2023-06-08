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
	<form action="insert" method="post">
	<table>
	<caption>상품목록</caption>
		<tr>
			<th width="200">상품명</th><td><input type="text" name="sangpum"></td>
		</tr>
		
		<tr>
			<th width="100">단가</th><td><input type="text" name="price"></td>
		</tr>
		
		<tr>
		<th width="150">사진</th>
			<td>
				<select name="photo">
					<option value="1.png">1번사진</option>
					<option value="2.png">2번사진</option>
					<option value="3.png">3번사진</option>
					<option value="4.png">4번사진</option>
					<option value="5.png">5번사진</option>
				</select>
			</td>
		</tr>
			
		<tr>
			<th width="150">입고일</th><td><input type="text" name="ipgoday"></td>
		</tr>
		
		<tr>
			<td>
				<button type="submit" >저장</button>
			</td>
		</tr>
			
			
	</table>
	</form>
</body>
</html>