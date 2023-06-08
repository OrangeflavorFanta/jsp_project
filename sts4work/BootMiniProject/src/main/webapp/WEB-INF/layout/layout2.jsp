<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script>
<style type="text/css">
  body{
  	
  	font-family: 'Hi Melody';
  }
  
  div.layout div{
  	border: 0px solid gray;
  }
  
  div.layout div.title{
      position: absolute;
      top: 10px;
      left: 500px;
      height: 100px;
  }
  
  div.layout div.menu{
      position: absolute;
      top: 150px;
      left: 300px;
      width: 1200px;
      height: 100px;
  }
  
  
  
  div.layout div.main{
      position: absolute;
      top: 280px;
      left: 500px;
      width:1500px;
      height: 800px;
  }
</style>
</head>
<body>
<div class="layout">
   <div class="title">
     <tiles:insertAttribute name="title2"/>
   </div>
   <div class="menu">
     <tiles:insertAttribute name="menu2"/>
   </div>
   
   <div class="main">
     <tiles:insertAttribute name="main"/>
   </div>
</div>
</body>
</html>
</head>
<body>

</body>
</html>