<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.Dao.GuestDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//num
	String num=request.getParameter("num");
	
	//dao
	GuestDao dao=new GuestDao();
	
	//num에 해당하는 chu 1증가
	dao.updateChu(num);
	
	//num에 해당하는 chu값 json형식으로 변환
	int chu=dao.getData(num).getChu();
	
	JSONObject  =new JSONObject();
	ob.put("chu",chu);

%>