<%@page import="org.json.simple.JSONObject"%>
<%@page import="data.Dto.SmartAnswerDto"%>
<%@page import="data.Dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//idx에 해당하는 dto
	String idx=request.getParameter("idx");
	SmartAnswerDao adao=new SmartAnswerDao();
	SmartAnswerDto dto=adao.getAnswerData(idx);
	
	JSONObject ob=new JSONObject();
	ob.put("idx",dto.getIdx());
	ob.put("nickname",dto.getNickname());
	ob.put("content",dto.getContent());
	

%>
<%=ob.toString()%>