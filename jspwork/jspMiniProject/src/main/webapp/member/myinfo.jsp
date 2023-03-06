<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>
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

<%
MemberDao dao=new MemberDao();
List<MemberDto> list=dao.getAllMembers();
SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");

//세션
String loginok=(String)session.getAttribute("loginok");
String myid=(String)session.getAttribute("myid");
%>
<body>
	나의 개인정보
	<table class="table table-bordered" style="width: 1000px;">
	<%
	for(MemberDto dto:list){
	%>	
	
	<%
	//로그인중이면서 로그인한 아이디와 같은 사람만 보기
	if(loginok!=null && dto.getId().equals(myid)){%>
	<tr align="center">
	<td><%=dto.getName() %></td>
	<td><%=dto.getId() %></td>
	<td><%=dto.getHp() %></td>
	<td><%=dto.getAddr() %></td>
	<td><%=dto.getEmail()%></td>
	<td><%=sdf.format(dto.getGaipday()) %></td>
	
	<td>
	<button type="button"class="btn btn-danger btn-xs"
	onclick="defaunc(<%=dto.getNum()%>)">삭제</button>
	
	</td>
	</tr>
		
	<%}
	%>
	
	<%}
	%>
	
	
	
	</table>



</body>
</html>