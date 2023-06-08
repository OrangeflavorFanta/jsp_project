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
	<form action="update" method="post" enctype="multipart/form-data">
	
		<table class="table table-bordered" style="width: 400px;" >
			<caption><b>사원 데이터 수정</b></caption>
			<input type="hidden" name="num" value="${dto.num }">
			<tr>
				<th bgcolor="#ffc">사원명</th>
					<td>
						<input type="text" name="name" class="form-data"
						style="width: 120px;" value="${dto.name }">						
					</td>
			</tr>
			
			<tr>
				<th bgcolor="#ffc">부서명</th>
					<td>
						<input type="text" name="buseo" class="form-data"
						style="width: 120px;" value="${dto.buseo }">						
					</td>
			</tr>
			
			<tr>
				<th bgcolor="#ffc">사진</th>
					<td>
						<input type="file" name="upload" class="form-data"
						style="width: 180px; " >						
					</td>
			</tr>
			
			<tr>
				<th bgcolor="#ffc">운전면허</th>
					<td>
						<input type="radio" name="driver" value="있음"
						${dto.driver=="있음"?"checked":"" }>있음
						<input type="radio" name="driver" value="없음"
						${dto.driver=="없음"?"checked":""}>없음
					</td>
			</tr>
			
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-default" >수정</button>
					<button type="button" class="btn btn-default" 
					onclick="location.href='list'">목록</button>
				</td>
			</tr>
		
		</table>
	
	</form>
</body>
</html>