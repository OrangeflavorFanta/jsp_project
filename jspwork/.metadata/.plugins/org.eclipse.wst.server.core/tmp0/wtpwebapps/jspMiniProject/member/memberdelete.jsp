<%@page import="data.Dao.MemberDao"%>
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
    //num 읽기
    String num=request.getParameter("num");
    
    //dao 선언
    MemberDao dao=new MemberDao();
    
    //delete메서드 호출
    dao.deleteMember(num);
    
    response.sendRedirect("../index.jsp?main=member/memberlist.jsp");
    %>
</body>
</html>