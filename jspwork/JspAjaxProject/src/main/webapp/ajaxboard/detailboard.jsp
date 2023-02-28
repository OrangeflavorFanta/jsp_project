<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="ajaxboard.model.AjaxBoardDto"%>
<%@page import="ajaxboard.model.AjaxBoardDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%
	//num
	String num=request.getParameter("num");

	//dao
	AjaxBoardDao dao=new AjaxBoardDao();
	
	//dto
	AjaxBoardDto dto=dao.getData(num);
	
	//dto를 json 반환
	JSONObject ob=new JSONObject();
	
	//날짜타입 문자열 지정
	SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
	
	//json에 데이터 추가하기	
	ob.put("num",dto.getNum());
	ob.put("writer",dto.getWriter());
	ob.put("subject",dto.getSubject());
	ob.put("content",dto.getContent());
	ob.put("avata",dto.getAvata());
	ob.put("writeday",sdf.format(dto.getWriteday()));
	

%>
<%=ob.toString()%>