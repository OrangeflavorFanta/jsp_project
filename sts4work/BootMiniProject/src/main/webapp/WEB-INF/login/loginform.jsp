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
	<div style="margin: 100px 100px;">
	<form action="loginprocess" method="post">
		<table class="table table-bordered" style="width: 300px;">
			<caption><b>회원로그인</b></caption>
				<tr>
					<td>
						<input type="text" name="id" class="form-control" placeholder="아이디입력" 
						required="required" autofocus="autofocus" style="width: 200px;"
						value="${sessionScope.saveok==null?'':sessionScope.myid}">
					</td>
				</tr>
				
				<tr height="60">
					<td>
						<input type="password" name="pass" class="form-control" placeholder="비밀번호입력" 
						required="required" autofocus="autofocus" style="width: 200px;">
					</td>
				</tr>
				
				<tr>
					<td>
					<input type="checkbox" name="cbsave" 
					${sessionScope.saveok==null?"":"checked" }> 아이디저장 &nbsp;&nbsp;
					<button type="submit" class="btn btn-success">로그인</button>
					</td>
				</tr>
		</table>
	</form>
</div>
</body>
</html>