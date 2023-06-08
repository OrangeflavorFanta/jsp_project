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
	<h4>회원 정보 수정</h4>
	
	<form action="update2" method="post" >
		<input type="hidden" name="num" value="${dto.num}">
		<table class="table table-bordered" style="width: 500px;">
		<tr>
		<th>회원명</th>
		<td>
		<input type="text" name="name" class="form-comtrol" style="width: 200px; " value="${dto.name }">
		</td>
		</tr>
		
		<tr>
		<th>아이디</th>
		<td>
		<input type="text" name="id" class="form-comtrol" style="width: 200px; " value="${dto.id }">
		</td>
		</tr>
		
		<tr>
		<th>이메일</th>
		<td>
		<input type="text" name="email" class="form-comtrol" style="width: 200px; " value="${dto.email }">
		</td>
		</tr>
		
		<tr>
		<th>번호</th>
		<td>
		<input type="text" name="hp" class="form-comtrol" style="width: 200px; " value="${dto.hp }">
		</td>
		</tr>
		
		<tr>
		<th>주소</th>
		<td>
		<input type="text" name="addr" class="form-comtrol" style="width: 200px; " value="${dto.addr }">
		</td>
		</tr>
		
		<tr>
		<td colspan="2" >
			<button type="submit" class="btn btn-info" >수정</button>
			<button type="button" class="btn btn-info" onclick="location.href='myinfo'">목록</button>
		</td>
		</tr>
		
		</table>
	
	</form>

</body>
</html>