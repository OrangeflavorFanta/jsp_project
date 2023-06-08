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

	<form action="update" method="post" enctype="multipart/form-data">
		<table class="table table-bordered" style="width: 500px;">
			<caption><b>상품정보 입력</b></caption>
			<tr>
			<th bgcolor="#ddd">상품명</th>
			<td>
				<input type="text" name="sang" class="form-control" style="width: 200px;" required="required" value="${dto.sang }">
			</td>
			</tr>
			
			<tr>
			<th bgcolor="#ddd">단가</th>
			<td>
				<input type="text" name="dan" class="form-control" style="width: 200px;" required="required" value="${dto.dan }">
			</td>
			</tr>
			
			<tr>
			<th bgcolor="#ddd">사진</th>
			<td>
				<input type="file" name="photo" class="form-control" style="width: 250px;" value="${dto.photoname }">
			</td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-info" style="width: 100px;">수정</button>
					<button type="button" class="btn btn-info" style="width: 100px;"
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		</table>
		
	</form>

</body>
</html>