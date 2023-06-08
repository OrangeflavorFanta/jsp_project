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

	<div>
	<c:if test="${totalcount==0 }">
		회원정보가 없습니다
	</c:if>	
	
	<c:if test="${totalcount!=0 }">
	<h3 class="alert alert-info">총 ${totalcount}명의 회원이 있습니다</h3>
	</c:if>
	</div>
	
	<div>
	<button type="button" class="btn btn-info" onclick="location.href='insertform'">회원정보 추가</button>
	<button type="button" class="btn btn-info" onclick="location.href='ajaxinsertform'">ajax로 회원정보 추가</button>
	</div>
	
	
	<table class="table table-bordered" style="width: 1200px;">
	<tr>
	<th>No.</th>
	<th>이름</th>
	<th>id</th>
	<th>pass</th>
	<th>전화번호</th>
	<th>주소</th>
	<th>email</th>
	<th>가입일</th>
	</tr>
	
	<c:forEach var="dto" items="${list }" varStatus="i">
	<tr>
	<td style="width: 50px;">${i.count}</td>
	<td style="width: 50px;"><a href='detail?num=${dto.num }'>${dto.name }</a></td>
	<td style="width: 70px;">${dto.id }</td>
	<td style="width: 50px;">${dto.pass }</td>
	<td style="width: 80px;">${dto.hp }</td>
	<td style="width: 150px;">${dto.addr }</td>
	<td style="width: 100px;">${dto.email }</td>
	<td style="width: 100px;"><fmt:formatDate value="${dto.gaipday }" pattern="yyyy-MM-dd"/> </td>
	<td style="width: 100px;">
	<button type="button" class="btn btn-success" onclick="location.href='updateform?num=${dto.num}'">수정</button>
	<button type="button" class="btn btn-danger" onclick="location.href='delete?num=${dto.num}'">삭제</button>
	</td>
	</tr>
	
		
	
	</c:forEach>
	
	
	</table>

</body>
</html>