<%@page import="data.Dao.smartDao"%>
<%@page import="data.Dto.smartDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
</head>
<body>
<%
	//엔코딩
 	request.setCharacterEncoding("utf-8");
	
	//데이터 읽어서 dto읽기
	smartDto dto = new smartDto();
	
	String writer = request.getParameter("writer");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	
	
	dto.setWriter(writer);
	dto.setSubject(subject);
	dto.setContent(content);
	
	
	//dao선언 후 insert호출
	smartDao dao = new smartDao();
	dao.insertSmart(dto);
	

	//방금 추가 된 num값 얻기
	int num=dao.getMaxnum();
	
	
	
	//gaipsuccess페이지로 이동
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?id=");
%>
</body>
</html>