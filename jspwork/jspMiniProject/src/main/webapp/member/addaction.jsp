<%@page import="data.Dao.MemberDao"%>
<%@page import="data.Dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
//한글엔코딩
request.setCharacterEncoding("utf-8");

//데이터 읽어서 dto읽기
MemberDto dto = new MemberDto();

String name = request.getParameter("name");
String id = request.getParameter("id");
String pass = request.getParameter("pass");
String hp = request.getParameter("hp");
String addr = request.getParameter("addr");
String email = request.getParameter("email") + "@" + request.getParameter("email2");

dto.setName(name);
dto.setId(id);
dto.setPass(pass);
dto.setHp(hp);
dto.setAddr(addr);
dto.setEmail(email);

//dao선언 후 insert호출
MemberDao dao = new MemberDao();
dao.insertMember(dto);

//gaipsuccess페이지로 이동
response.sendRedirect("../index.jsp?main=member/gaipsuccess.jsp?id=" + id);
%>