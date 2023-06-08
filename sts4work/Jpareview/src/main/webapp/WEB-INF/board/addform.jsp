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

	<div style="margin: 50px 200px;">
		<form action="insert" method="post" >
			<table class="table table-bordered" style="width: 500px;">
			
				<tr>
					<th width="120" bgcolor="lightgray">작성자</th>
					<td>
						<input type="text" required="required " class="form-control" name="writer"
						style="width: 150px;">
					</td>
				</tr>
				
				<tr>
					<th width="120" bgcolor="lightgray">제목</th>
					<td>
						<input type="text" required="required " class="form-control" name="subject"
						style="width: 350px;">
					</td>
				</tr>
				
				<tr>
					<th width="120" bgcolor="lightgray">내용</th>
					<td>
						<input type="text" required="required " class="form-control" name="content"
						style="width: 350px;">
					</td>
				</tr>

				
				<tr>
					<td colspan="2" align="center">
						<button type="submit" class="btn btn-info btn-sm" >저장</button>
						<button type="button" class="btn btn-info btn-sm" onclick="location.href='list'">목록</button>
					</td>
				</tr>
			
			</table>
		</form>
	
	
	</div>

</body>
</html>