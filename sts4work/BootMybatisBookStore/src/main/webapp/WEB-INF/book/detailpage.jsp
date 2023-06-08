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
	
	<h3>디테일 페이지</h3>
	<table class="table table-bordered" >
	
		<tr>
			<td bgcolor="#ddd">
			도서명: ${dto.bookname }<br>
			저자: ${dto.bookwriter }<br>
			가격: ${dto.bookprice }<br>
			출판사: ${dto.bookcompany }<br>
			입고일: ${dto.ipgoday }<br>
			</td>
		</tr>
		
		<tr>
		<td>
		<button type="button" onclick="location.href='updateform?num=${dto.num}'">수정</button>
		<button type="button" onclick="location.href='delete?num=${dto.num}'">삭제</button>
		<button type="button" onclick="location.href='list'">목록으로</button>
		
		</td>
		</tr>
	
	</table>
</body>
</html>