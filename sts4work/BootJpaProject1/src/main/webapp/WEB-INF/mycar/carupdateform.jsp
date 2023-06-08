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

	<h1>차 정보 수정</h1>
	<form action="update" method="post">
	
	<input type="hidden" name="num" value="${dto.num }"><!-- 이거 안해주면 추가가 됨 insert됨 -->
		<table class="table table-bordered" style="width: 300px;">
			<tr>
				<th width="100">자동차명</th>
				<td>
					<input type="text" name="carname" class="form-control" value="${dto.carname }" required="required">
				</td>
			</tr>
			
			<tr>
				<th width="100">단가</th>
					<td>
						<input type="text" name="carprice" class="form-control" value="${dto.carprice }"  required="required">
					</td>
			</tr>
			
			<tr>
				<th width="100">색상</th>
					<td>
						<input type="color" name="carcolor" class="form-control" value="${dto.carcolor }"  required="required">
					</td>
			</tr>
			
			<tr>
				<th width="100">구입날짜</th>
					<td>
						<input type="date" name="carguip" class="form-control" value="${dto.carguip }"  required="required">
					</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">,
					<button type="submit" class="btn btn-success btn-sm"  onclick="location.href='carlist'">수정</button>
					<button type="button" class="btn btn-success btn-sm" onclick="location.href='carlist'">목록으로</button>

				</td>
			</tr>
			
		</table>
	</form>
	
</body>
</html>