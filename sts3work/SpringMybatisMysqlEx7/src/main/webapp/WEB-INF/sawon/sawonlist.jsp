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

	<br><br>
	
	<button type="button" class="btn btn-info" onclick="location.href='form'">데이터 입력</button>
	
	
	<div style="width: 800px; text-align: center;">
		<form action="list" class="form-inline"><!-- 이름, 부서, 운전면허 중 검색하면 나오게 -->
			<select name="title" class="form-control" style="width: 120px;">
				<option value="name" ${title=='name'?"selected":"" }>이름</option>	
				<option value="buseo" ${title=='buseo'?"selected":"" }>부서</option>	
				<option value="driver" ${title=='driver'?"selected":"" }>운전면허</option>	
			</select>
			<input type="text" name="search" class="form-control" placeholder="검색단어"
			style="width: 150px;" value="${search }">
			
			<button type="submit" class="btn btn-success">검색</button>
		</form>
	</div>
	
	<br>
	<br>
	
	<table class="table" style="width: 700px;">
		<tr bgcolor="lightgray">
		<td width="200">No.</td>
		<td width="200">사원명</td>
		<td width="200">부서</td>
		<td width="200">운전면허</td>
		<td width="200">사진</td>
		<td width="320">입사일</td>
		<td width="200">수정|삭제</td>
		
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
			<tr align="center">
				<td>${i.count }</td>
				<td>${dto.name }</td>
				<td>${dto.buseo }</td>
				<td>${dto.driver }</td>
				<td>
				<c:if test="${dto.photo!='no' }">
					<img alt="" src="../photo/${dto.photo }" width="50" height="50" class="img-circle">
				</c:if>
				<c:if test="${dto.photo=='no' }">
					<img alt="" src="../res/no.PNG" width="50" height="50" class="img-circle">
				</c:if>
				</td>
				<td>
					<fmt:formatDate value="${dto.ipsaday }" pattern="yyyy년  MM월 dd일"/>
				</td>
				<td>
					<button type="button" class="btn btn-info btn-xs"
					onclick="location.href='updateform?num=${dto.num}'">수정</button>
					<button type="button" class="btn btn-danger btn-xs"
					onclick="location.href='delete?num=${dto.num}'">삭제</button>
				</td>
			</tr>
		</c:forEach>
	</table>
	
	
	<span class="alert alert-info"> 
		<b>총 ${totalCount }명의 사원이 있습니다</b>
	</span>
	

</body>
</html>