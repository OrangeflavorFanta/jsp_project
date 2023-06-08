<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예은이랑 crud 복습</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
</head>
<body>

	<h3 class="alert alert-info">총 ${totalcount }개의 정보가 있습니다</h3>
	
	<table class="table table-bordered" style="width: 800px;">
		<tr>
		<th width="60">No.</th>
		<th width="60">차종</th>
		<th width="60">판매가</th>
		<th width="60">색상</th>
		<th width="60">carguip</th>
		<th width="60">guipday</th>
		<th width="100">수정|삭제</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<!-- 원래 foreach문의 자바형식은 for( MycarDto dto:list)이다. 그거를 여기서 쓰려면 이렇게 쓰는 것이고,
			list에서 dto를 불러오는 것이기에 단순히 출력 역할이다. 결국 forech문이기 때문에 items에 list를 써주는 것이다
			반면, totalcount는 안써주고 그냥 사용할 수 있음 -->
		<tr>
		<td>${i.count }</td>
		<td>${dto.carname }</td>
		<td><fmt:formatNumber value="${dto.carprice }" type="currency"></fmt:formatNumber> </td>
		<td>
		<div style="width: 20px; height: 20px; border-radius: 100%; background-color: ${dto.carcolor }" ></div>${dto.carcolor }</td>
		<td>${dto.carguip }</td>
		<td><fmt:formatDate value="${dto.guipday }" pattern="yyyy-MM-dd"/> </td>
		<td>
		<button type="button" class="btn btn-success" onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<!-- num에 해당하는 dto를 불러와서 그 dto를 수정해줘야 하니까 num갖고와야함 -->
		<button type="submit" class="btn btn-danger" onclick="location.href='delete?num=${dto.num}'">삭제</button>
		</td>
		</tr>
		
		</c:forEach>
		
		<tr>
		<td colspan="7" align="center">
		<button type="button" class="btn btn-info" onclick="location.href='insertform'">차량 정보 추가</button>
		</td>
		</tr>
	
	</table>

</body>
</html>