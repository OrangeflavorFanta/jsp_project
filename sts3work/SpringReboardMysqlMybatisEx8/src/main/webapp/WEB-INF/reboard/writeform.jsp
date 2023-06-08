<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
</head>
<body>

	<div style="margin: 30px 30px;">
		<form action="insert" method="post" enctype="multipart/form-data">
			<!-- hidden 5개 -->
			<input type="hidden" name="num" value="${num }"> <input
				type="hidden" name="currentPage" value="${currentPage }"> <input
				type="hidden" name="regroup" value="${regroup }"> <input
				type="hidden" name="restep" value="${restep }"> <input
				type="hidden" name="relevel" value="${relevel }">

			<table class="tablr table-bordered" style="width: 500px;">
				<caption>
					<b> <c:if test="${num==0 }">새글 쓰기</c:if>
					<c:if test="${num==1 }">답글 쓰기</c:if>
					</b>
				</caption>

				<tr>
					<th width="100" bgcolor="#ddd">작성자
					<td><input type="text" name="writer" class="form-control"
						required="required" style="width: 150px;"></td>
				</tr>

				<tr>
					<th width="100" bgcolor="#ddd">비밀번호
					<td><input type="password" name="pass" class="form-control"
						required="required" style="width: 150px;"></td>
				</tr>

				<tr>
					<th width="100" bgcolor="#ddd">제목
					<td><input type="text" name="subject" class="form-control"
						required="required" style="width: 250px;"></td>
				</tr>

				<tr>
					<th width="100" bgcolor="#ddd">사진
					<td><input type="file" name="upload" class="form-control"
						multiple="multiple" style="width: 250px;"></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><textarea
							style="width: 480px; height: 150px" name="content"
							class="form-data" required="required"></textarea></td>
				</tr>

				<tr>
					<td colspan="2"align="center">
						<button type="submit" class="btn btn-info">저장</button>
						<button type="button" class="btn btn-info"
						onclick="location.href='list'">목록</button>
					</td>
				</tr>

			</table>
		</form>
	</div>
</body>
</html>