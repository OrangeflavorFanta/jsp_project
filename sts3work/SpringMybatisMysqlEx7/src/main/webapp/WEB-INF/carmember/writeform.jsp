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

	<form action="write" method="post">
		<table class="table table-bordered" style="width: 350px;">
		<caption><b>고객 정보 입력</b></caption>
			<tr>
				<th bgcolor="gray" width="100">고객 명</th>
					<td>
						<input type="text" name="name" size="10" required="required">
					</td>
			</tr>
			
			<tr>
				<th bgcolor="gray" width="100">전화번호</th>
					<td>
						<input type="text" name="hp" size="10" required="required">
					</td>
			</tr>
			
			<tr>
				<th bgcolor="gray" width="100">주소</th>
					<td>
						<input type="text" name="addr" size="10" required="required">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
				<button type="submit" class="btn btn-info" >저장</button>
				<button type="button" class="btn btn-info" onclick="location.href='list'">목록</button>
				</td>
			</tr>
			
			
		</table>
	</form>
	
	
</body>
</html>