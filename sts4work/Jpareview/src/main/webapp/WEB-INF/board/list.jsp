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

	<button id="abc" type="button" onclick="location.href='board/write'">addfrom으로</button>
	
	<c:if test="${fcount==0 }">
		등록된 게시글이 없습니다
	</c:if>
	
	<c:if test="${fcount!=0 }"> <!-- if는 있는데 else가 없음 -->
	
	<h3 class="alert alert-info">총 ${fcount }개의 글이 있습니다</h3>
	
	<table class="table table-bordered" style="width: 800px;">
	<caption>게시판</caption>
	<tr>
	<th>idx</th>
	<th>작성자</th>
	<th>제목</th>
	<th>작성일</th>
	</tr>
	
	<c:forEach var="form" items="${f }" varStatus="p"> <!-- c:foreach: 반복문임 -->
	<!-- dto(dao.list)를 form이라고 해줄게, f는 controller에서 form을 f라고 해주기로 함 -->
	
	<tr>
		<td >${p.index }</td> <!-- index면 0부터 시작, count면 1부터 시작 -->
		<td>${form.writer }</td>
		<td>${form.subject }</td>
		<td><fmt:formatDate value="${form.writeday }" pattern="yyyy-MM-dd"/></td>
	
	</tr>
	
	</c:forEach>
	</table>
	</c:if>
	
	



</body>
</html>