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
	
	<div class="alert alert-info" style="width: 800px;">
	<b>총 ${totalCount }개의 상품이 있습니다</b>
	</div>
	
	<table class="table table-bordered" style="width: 800px;">
		<caption>
			<span style="float: right;">
				<button type="button" class="btn btn-default" onclick="location.href='form'">상품추가</button>
			</span>
		</caption>
		
		<c:forEach var="dto" items="${list }"><!-- //var로 데이터를 배열 형태로 갖고오는거임 -->
			<tr>
				<td width="400" rowspan="4" >
					<c:if test="${dto.photoname!='no' }"><!-- photoname이 no가 아니면 -->
						<%-- <c:forTokens var="pp" items="${dto.photoname }" delims="">
							<a href="#"><!-- a태그-실제 이미지 크기 보기 위함+등등 각종 이유로 해줌 -->
							<img alt="" src="../photo/${pp }" style="max-width: 150px;">
							</a>
						</c:forTokens> --%>
						
						<img alt="" src="../photo/${dto.dimage }" style="max-width: 150px;"><!-- 대표 이미지 갖고오기 -->
					</c:if>
					
					<c:if test="${dto.photoname=='no' }"><!-- photoname이 no면 noimage -->
						<img alt="" src="../image/noImg.jpg" style="max-width: 150px;">
					</c:if>
				</td>
				
				<td>
					<b>상품명: ${dto.sangpum }</b>
				</td>
			</tr>
			
			<tr>
				<td>
					<b>단가: <fmt:formatNumber value="${dto.price }" type="currency"></fmt:formatNumber></b>
				</td>
			</tr>
			
			<tr>
				<td>
					<b>입고일: <fmt:formatDate value="${dto.ipgoday }" pattern="yyyy-MM-dd HH:mm"/></b>
				</td>
			</tr>
			
			<tr>
				<td>
					<button type="button" class="btn btn-info" onclick="location.href=''">수정</button>
					<button type="button" class="btn btn-info" onclick="location.href=''">삭제</button>
				</td>
			</tr>
			
			
			
			
		</c:forEach>
		
		
		
		
		
		
		
		
		
		
		
	</table>

</body>
</html>