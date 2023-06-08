<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">

<style type="text/css">

	body{
		font-size: 1.3em;
		font-family: "Hi Melody";
	}

	div.layout div{
		border: 0px solid gray;
		
	}

	div.layout div.title{
		position: absolute;
		top: 30px;
		left: 200px;
		width: 1000px;
		height: 120px;
	}
	
	div.layout div.menu{
		position: absolute;
		top: 180px;
		left: 180px;
		width: 1200px;
		height: 100px;
	}
	
	div.layout div.info{
		position: absolute;
		top: 300px;
		left: 10px;
		width: 180px;
		height: 200px;
	}
	
	div.layout div.main{
		position: absolute;
		top: 270px;
		left: 200px;
		width: 1000px;
		height: 800px;
	}
	
	

</style>

</head>
<body>
<div class="layout">
   <div class="title">
     <tiles:insertAttribute name="title"/>
   </div>
   <div class="menu">
     <tiles:insertAttribute name="menu"/>
   </div>
   <div class="info">
     <tiles:insertAttribute name="info"/>
   </div>
   <div class="main">
     <tiles:insertAttribute name="main"/>
   </div>
</div>
</body>
</html>