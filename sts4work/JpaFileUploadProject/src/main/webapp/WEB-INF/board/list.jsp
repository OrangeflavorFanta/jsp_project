<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Spring JPA 게시판</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
</head>
<body>

	<div style="margin: 50px 50px;">
		<h2 class="alert alert-info">총 ${count }개의 글이 있습니다</h2>
		<br>
		<button type="button" class="btn btn-info"
		onclick="location.href='writeform'">글쓰기</button>
	</div>
	
	<table class="table table-bordered" style="width: 800px; margin: 50px 50px;">
		<tr bgcolor="#ddd" align="center">
			<th width="20">No.</th>
			<th width="170">제목</th>
			<th width="60">작성자</th>
			<th width="60">작성일</th>
		</tr>		
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr align="center">
			<td>${i.count }</td>
			<td><a onclick="location.href='datailpage'">${dto.subject }</a></td>
			<td>${dto.writer }</td>
			<td><fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/></td>
			
		</tr>
		</c:forEach>
		
		
		
	</table>
	
	

</body>
</html>