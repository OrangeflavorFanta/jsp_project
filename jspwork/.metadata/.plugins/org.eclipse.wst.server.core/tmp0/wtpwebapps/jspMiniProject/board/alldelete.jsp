<%@page import="data.Dao.smartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

	//nums를 읽는다
	String nums=request.getParameter("nums");

	//,로 분리해서[]
	String []	num=nums.split(",");
	
	///배열의 갯수만큼 delete한 후
	smartDao dao=new smartDao();
	
	for(String n:num){
		
		dao.deleteSmart(n);
		
	}
	
	//목록에 다가 넘기면 됨(으로 이동)
	response.sendRedirect("../index.jsp?main=board/boardlist.jsp?");



%>