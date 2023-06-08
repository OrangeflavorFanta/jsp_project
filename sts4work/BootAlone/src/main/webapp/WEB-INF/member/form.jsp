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
	
	<h3>회원 정보 입력</h3>
	<form action="insert" method="post">
	<table class="table table-bordered" style="width: 400px;">
		<tr>
		<th>이름</th>
		<td >
		<input type="text" name="name" required="required" >
		</td>
		</tr>
		
		<tr>
		<th>id</th>
		<td >
		<input type="text" name="id" required="required" >
		</td>
		</tr>
		
		<tr>
		<th>pass</th>
		<td >
		<input type="text" name="pass" required="required" >
		</td>
		</tr>
		
		<tr>
		<th>전화전호</th>
		<td >
		<input type="text" name="hp" required="required" >
		</td>
		</tr>
		
		<tr>
		<th>주소</th>
		<td >
		<input type="text" name="addr" required="required" >
		</td>
		</tr>
		
		<tr>
		<th>email</th>
		<td >
		<input type="text" name="email" required="required" >
		</td>
		</tr>
	
		<tr>
		<td colspan="2">
			<button type="submit" class="btn btn-success">저장</button>
			<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
		</td>
		</tr>
	</table>
	</form>

</body>
</html>