<%@page import="data.Dao.SmartAnswerDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//idx
String idx=request.getParameter("idx");
//dao
SmartAnswerDao dao=new SmartAnswerDao();
//delete
dao.deleteSmartAnswer(idx);
%>