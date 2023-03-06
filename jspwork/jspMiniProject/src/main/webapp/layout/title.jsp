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
<%
	//프로젝트 경로 구하기
	String root=request.getContextPath();
%>

<body>
	<a href="<%=root%>" style="color: black">
	<img alt="" src="">
	<h3>JSP&Jquery 미니프로젝트</h3>
	</a>
	
	<div style="float: right; padding-right: 100px;">
	<%
	//로그인세션얻기
	String loginok=(String)session.getAttribute("loginok");
	
	//아이디 얻기
	String myid=(String)session.getAttribute("myid");
	MemberDao dao=new MemberDao();
	String name=dao.getName(myid);
	if(loginok==null){
		%><button type="button" class="btn btn-success"
		style="width: 100px;" onclick="location.href='index.jsp?main=login/loginmain.jsp'">Login</button>
		<% }else{%>
		
		<b style="font-size: 12pt;"><%=name %>님 로그인중...</b>
		<button type="button" class="btn btn-danger"
		style="width: 100px;" onclick="location.href='index.jsp?main=login/logoutaction.jsp'">Logout</button>
	<%}
	
	
	%>
	</div>
</body>
</html>