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

<style type="text/css">

	 body{
		font-size: 2em;
		font-family: "Hi Melody";
		
	}
	
	ul.menu{
	list-style: none;
	}
	
	ul.menu li{
		width: 100px;
		float: left;
		border: 1px solid gray;
		height: 60px;
		line-height: 60px;
		margin-right: 10px;
		text-align: center;
		font-size: 20px;
		background-color: lightgray;
		cursor: pointer;
		font-family: 'Hi Melody';
		
	}
	
	ul.menu li a{
	color: black;
	text-decoration: none;
	} 
	
	
	/* #main-menu{
	
	width: 1000px;
	font-size: 25px;
	font-family: 'Hi Melody';
	background-color: black;
	margin-left: 200px;
	} */
	
</style>

</head>
<body>
	<c:set var="root" value="<%=request.getContextPath() %>"/>
		<ul class="menu">
			<li>
				<a href="${root }/">HOME</a>
			</li>
			
			<li>
				<a href="${root }/ipgo/form">상품등록</a>
			</li>
			
			<li>
				<a href="${root }/ipgo/list">상품목록</a>
			</li>
			
			<li>
				<a href="${root }/board/list">게시판</a>
			</li>
			
			<li>
				<a href="${root }/smart/list">스마트게시판</a>
			</li>
			
			<li>
				<a href="${root }/reboard/list">답변형게시판</a>
			</li>
			
			<li>
				<a href="${root }/member/list">회원목록</a>
			</li>
			
			<li>
				<a href="${root }/login/main">로그인</a>
			</li>
			
			
			<li>
				<a href="${root}/member/form">회원가입</a>
			</li>
			
			<li>
				<a href="${root}/member/myinfo">나의 정보</a>
			</li>
			
			<li>
				<a href="${root}/load/map">오시는 길</a>
			</li>
		</ul>
		
		<%-- <ul id="main-menu">
			<li class="current-menu-item"><a href='${root }/'>Home</a></li>
			<li class="parent">
				<a href="#">Shop</a>
				<ul class="submenu">
					<li><a href="${root }/ipgo/form"><i class="icon-gift"></i>상품등록</a></li>
					<li><a href="${root }/ipgo/list"><i class="icon-credit-card"></i>상품목록</a></li>
					<li><a href="#"><i class="icon-wrench"></i>Icons</a></li>
				
				</ul>
			</li>
			
			<li><a href="${root }/board/list">게시판</a></li>
			
			<li class="parent">
				<a href="#">Member</a>
				<ul class="sub-menu">
					<li><a href="${root }/member/form"><i class="icon-gift"></i>회원가입</a></li>
					
					<c:if test="${sessionScope.loginok!=null and sessionScope.myid=='admin'}">
						<li><a href="${root }/mamber/list"><i class="icon-credit-card"></i>회원목록</a></li>
					</c:if>
					
					<li><a href="${root }/member/myinfo"><i class="icon-wrench">나의 정보</i></a></li>
				</ul>
			</li>
			
			<li><a href="${root }/login/main">로그인</a></li>
			<li><a href="${root }/load/map">오시는 길</a></li>
			
			
		
		</ul> --%>
		
		
		
</body>
</html>