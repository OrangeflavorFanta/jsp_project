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

	<button type="button" class="btn btn-info " 
	onclick="location.href='sangaddform'">상품등록</button>

	<h3 class="alert alert-info"> 총 ${count}개의 상품이 있습니다</h3>
	<table>
	<caption>상품목록</caption>
		<tr bgcolor="gray">
			<th width="60">No.</th>
			<th width="200">상품명</th>
			<th width="100">단가</th>
			<th width="100">사진</th>
			<th width="150">입고일</th>
			<th width="150">등록일</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.coun }</td>
				<td>${dto.sangpum }</td>
				<td>${dto.price }</td>
				<td>
					<img alt="" src="/photo/${dto.photo }">
				</td>
				<td>${dto.ipgoday }</td>
				<td>${dto.writeday }</td>
			</tr>
		</c:forEach>
		
		
	
	</table>

</body>
</html>