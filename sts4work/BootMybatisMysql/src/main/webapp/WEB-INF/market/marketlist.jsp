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
		<b>저장된 상품 정보가 없습니다</b>
	</div>
	</c:if>
	
	<c:if test="${totalCount>0 }">
	<div class="alert alert-info">
		<h3>총 ${totalCount }개의 ~~~</h3>
	</div>
	</c:if>
	
	<br>
	
	<button type="button" class="btn btn-info btn-xs" onclick="location.href='form'">상품 추가하기</button>
	
	<!-- 이미지형 출력 -->
	<c:forEach var="a" items="${list }">
	<table class="table table-bordered" style="width: 500px;">
		<tr>
			<td>
				<c:if test="${a.photoname==null }"><!-- 이미지가 있으면 null이면 안갖고올게 -->
					<img alt="" src="../upload/noImg.jpg" style="max-width: 150px; "align="left">
				</c:if>
				<c:if test="${a.photoname!=null }"><!-- 이미지가 있으면 null이 아니면~ 갖고올게 -->
					<img alt="" src="../upload/${a.photoname }" style="max-width: 150px; "align="left">
				</c:if>
				
				<h4>상품명: ${a.sang }</h4>
				<h4>단가: <fmt:formatNumber value="${a.dan }" type="currency"/></h4>
				<h4>입고일: <fmt:formatDate value="${a.ipgo }" pattern="yyyy-MM-dd HH:mm"/></h4>
				
				<h4>
					<button type="button" class="btn btn-info btn-xs" onclick="location.href='updateform?num=${a.num}'">수정</button>
					<button type="button" class="btn btn-info btn-xs" onclick="location.href='delete?num=${a.num}'">삭제</button>
				</h4>
			</td>
		</tr>
		
		
		
	</table>
	
	</c:forEach>
	
	

</body>
</html>