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
	
	<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
	<img alt="" src="${root }/image/airplane_bener.png"style="max-width: 1000px;"><br><br>
	<img alt="" src="${root }/image/jeju_bener.png" style="max-width: 1000px;"><br><br>
	<img alt="" src="${root }/image/bangcok_bener.png"style="max-width: 1000px;">&nbsp;
	<img alt="" src="${root }/image/imbak_bener.png"style="max-width: 1000px;"><br><br>
	<img alt="" src="${root }/image/covid19_bener.png"style="max-width: 1000px;"><br><br>
	<h1><b>Main Page입니다</b></h1>

</body>
</html>