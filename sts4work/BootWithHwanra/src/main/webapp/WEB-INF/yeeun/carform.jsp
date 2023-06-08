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

	<form action="insert" method="post">
		<table style="width:200px;" class="table table-bordered">
			<tr>
			<td width="100px;">차종</td>
			<td>
			<input type="text" style="width: 100px;" name="carname" required="required">
			</td>
			</tr>
			
			<tr>
			<td width="100px;">판매가</td>
			<td>
			<input type="text" style="width: 100px;"name="carprice" required="required">
			</td>
			</tr>
			
			<tr>
			<td width="100px;">색상</td>
			<td>
			<input type="color" style="width: 100px;" name="carcolor"required="required">
			</td>
			</tr>
			
			<tr>
			<td width="100px;">carguip</td>
			<td>
			<input type="date" style="width: 100px;" name="carguip"required="required">
			</td>
			</tr>
			
			
			<tr>
			<td colspan="2" width="100px;">
			<button type="submit" style="width: 80px;" >저장</button>
			<button type="button" style="width: 80px;" 
			onclick="location.href='list'">목록</button>
			</td>
			</tr>
			
				
		</table>
	</form>

</body>
</html>