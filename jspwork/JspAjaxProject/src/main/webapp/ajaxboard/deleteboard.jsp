<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	String num=request.getParameter("num");
	AjaxBoardDao dao=new AjaxBoardDao();
	dao.deleteBOard(num);

%>