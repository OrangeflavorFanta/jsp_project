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
	<button type="button" style="width: 100px;"
	class="btn btn-info" onclick="location.href='writeform'">고객 정보 입력</button>
	
	<hr>
	
	<table class="table table-bordered" style="width:  700px;">
		<tr  bgcolor="gray">
			<th width="60">성함</th>
			<th width="60">전화번호</th>
			<th width="60">주소</th>
			<th width="60">가입 날짜</th>
			<th width="60">수정|삭제</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr>
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.hp }</td>
				<td>${dto.addr }</td>
				<td>${dto.gaipday }</td>
				
				
				<td>
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href=''">수정</button>
				<button type="button" class="btn btn-info btn-xs"
				onclick="location.href=''">삭제</button>
				</td>
				
			</tr>
		
		</c:forEach>
	
	
	
	</table>
	
</body>
</html>