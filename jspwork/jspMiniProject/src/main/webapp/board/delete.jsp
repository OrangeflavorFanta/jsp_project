<%@page import="data.Dao.smartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//프로젝트의 경로
	String  num=request.getParameter("num");
	String currentPage=request.getParameter("currentPage");
	
	//dao
	smartDao dao= new smartDao();
	
	dao.deleteSmart(num);
	
	
	//목록
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?currentPage="+currentPage);
	
%>