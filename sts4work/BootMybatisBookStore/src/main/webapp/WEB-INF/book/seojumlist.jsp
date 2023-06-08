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

	<c:if test="${totalCount==0 }">
	<div class="alert alert-info">
		<h3>등록된 상품이 없습니다</h3>
	</div>
	</c:if>
	
	<c:if test="${totalCount>0 }">
	<div class="alert alert-info">
		<h3>총 ${totalCount }개의 상품</h3>
	</div>
	</c:if>

	<br>
	
	<button type="button" class="btn btn-info"
	onclick="location.href='form'">상품 추가</button>
	<table class="table table-bordered" style="width: 500px;">
		<tr>
		<th>No.</th>
		<th>도서명</th>
		<th>저자</th>
		<th>가격</th>
		<th>출판사</th>
		<th>입고일</th>
		</tr>
		
	<c:forEach var="dto" items="${list }" varStatus="i">
	
		<tr>
		<td>${i.count}</td>
		<td><a href="detail?num=${dto.num }">${dto.bookname }</a></td>
		<td>${dto.bookwriter }</td>
		<td><fmt:formatNumber value="${dto.bookprice }" type="currency"/></td>
		<td>${dto.bookcompany }</td>
		<td><fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd"/></td>
		</tr>
	</c:forEach>
	</table>
	
	
	
	
	
	
	
	

	

</body>
</html>