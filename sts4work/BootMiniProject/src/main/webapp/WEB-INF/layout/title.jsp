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
</head>
<body>
	
	
	<c:set var="root" value="<%=request.getContextPath()%>"></c:set>
	<a href="${root }/">
		<img alt="" src="${root}/image/jejuair.png " style="width: 150px; height: 80px; "><br>
		<b>SpringBootMyBatis+Titles</b>
	</a>
	
	<br>
	
	<div class="container" style=" width: 1000px; float: right;" >
	<c:if test="${sessionScope.loginok==null }">
		<button type="button" class="btn btn-info btn-sm" style="float: right;"
		data-toggle="modal" data-target="#myModal" id="btnlogin">로그인</button>
	</c:if>
	
	<c:if test="${sessionScope.loginok!=null }">
		<b style="margin-left: 400px;">${sessionScope.loginname }님 로그인 중...</b>
		<button type="button" class="btn btn-danger btn-sm" id="btnlogout">로그아웃</button>
	</c:if>
	
	<!-- Modal -->
	<div class="modal fade" id="myModal" role="dialog">
		<div class="modal-dialog modal-sm">
		
			<!-- Modal content -->
			<div class="modal-content">
			
			<!-- header -->
			<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<h4 class="modal-title">로그인</h4>
			</div>
			
			
			<!-- body -->
			<div class="modal-body">
				<span class="glyphicon glyphicon-user">LoginId</span><br>
				<input type="text" class="form-control" id="loginid">
				<span class="glyphicon glyphicon-lock">LoginPass</span><br>
				<input type="text" class="form-control" id="loginpass">
			</div>			
			
			
			<!-- footer -->
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" id="btnloginok">로그인</button>
				<button type="button" class="btn btn-default" data-dismiss="modal" >취소</button>
			</div>
			
			
			</div>
		</div>
	</div>
	
	</div>
	
	<!-- 로그인에 대한 ajax 스크립트 처리 -->
	<script type="text/javascript">
	
		//팝업창에 있는 로그인 버튼
		$("#btnloginok").click(function(){
		
			//아이디 비번 얻기
			var id=$("#loginid").val();
			var pass=$("#loginpass").val();
			var root='${root}';
			console.log("root"+root);
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url: root+"/member/login",
				data:{"id":id, "pass":pass},
				success:function(res){
					
					if(res.result=='fail'){
						alert("id나 pw가 맞지 않습니다.");
					}else{
						alert("성공")
						location.reload();
					}
				}
				
			});
			
		});
		
		
		//로그아웃
		$("#btnlogout").click(function(){
			
			var root='${root}';
			$.ajax({
				
				type:"get",
				url:root+"/member/logout",
				dataType:"text",
				success:function(res){
					alert("로그아웃성공")
					location.reload();
			}
				
			})
		});
		
		
		
	
	</script>
	
	
	
	
</body>
</html>