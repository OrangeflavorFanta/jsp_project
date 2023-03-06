<%@page import="data.Dao.MemberDao"%>
<%@page import="data.Dto.MemberDto"%>
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
//id읽어오기
String id=request.getParameter("id");

//dao
MemberDao dao=new MemberDao();

//아이디에 따른 이름 얻기
String name =dao.getName(id);

%>

<div>
<img alt="" src="image2/s6>jpg">
<h3><%=name %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;님의 회원가입을 축하합니다</h3>
<br><br>

<button type="button" class="btn btn-success"
onclick="location.href='index.jsp?main=login/loginmain.jsp'">로그인</button>

<button type="button" class="btn btn-success"
onclick="location.href='index.jsp'">HOME</button>

</div>
</body>
</html>