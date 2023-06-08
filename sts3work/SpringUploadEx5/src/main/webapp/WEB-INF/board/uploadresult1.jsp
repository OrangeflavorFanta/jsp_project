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
   <h2>제목 : ${title }</h2>
   <c:if test="${fileName=='NO' }">
      <b>업로드 파일 없음</b>
   </c:if>

   <c:if test="${fileName!='NO' }">
      <img alt="" src="../photo/${fileName }" style="max-width: 300px">
   </c:if>

   <h2>업로드할 이미지명 : ${fileName }</h2>
   <h2>업로드할 실제 경로 : ${path }</h2>

</body>
</html>