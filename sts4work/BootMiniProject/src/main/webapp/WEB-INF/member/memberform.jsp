<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap"
	rel="stylesheet">
	
	<style type="text/css">
		#showing{
		border: 1px solid gray;
		width: 130px;
		height: 160px;
		
		}
	</style>
	
	<script type="text/javascript">
		$(function(){
			
			
			
			//버튼 클릭 시 사진 불러오는 이벤트 추가
			$("#btnphoto").click(function(){
				$("#myphoto").trigger("click");
			});
			
		//사진 불러오면 이미지 미리보기 하기
		//사진 불러오면 미리보기 하기
		$("#myphoto").change(function(){
			
			if($(this)[0].files[0]){
				var reader=new FileReader();
				reader.onload=function(e){
					$("#showing").attr("src",e.target.result);
				}
				reader.readAsDataURL($(this)[0].files[0]);
			}
		});
			
/* 		//아이디 입력시 idsuccess값 지움
		$("#loginid").keydown(function(){
			
			$("span.idsuccess").text("");
		});
		 */
			
		//중복체크 버튼 클릭 시 아이디에 체크 ajax
		$("#btnidcheck").click(function(){
			var id=$("#inputid").val();
			//alert(id); 
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"idcheck",
				data:{"id":id},
				success:function(res){
					if (res.count==0) {
						  $("span.idsuccess").text("가입 가능합니다 :)");
					  }else{
						  $("span.idsuccess").text("가입 불가합니다 :(");
					  }
				}
			});
		});
		
		//2번째 비밀번호 입력 시 체크
		$("#pass2").keyup(function(){
			var p1=$("#pass").val();
			var p2=$(this).val();
			
			if(p1==p2){
				$("span.passsuccess").text("가입 가능합니다 :)");
			}else{
				$("span.passsuccess").text("가입 불가합니다 :(");
			}
			
		});
		
	});		
		
	
		//submit 전체 호출
		function check(){
				
				//사진
				if ($("#myphoto").val()==''){
					alert("사진을 넣어주세요");
					return false;
				}
				
				
				//중복체크
				if ($("span.idsuccess").text()!='가입 가능합니다 :)') {
					alert("아이디 중복체크를 해주세요");
					return false;
				}
				
				
				//비밀번호
				if ($("span.passsuccess").text()!='가입 가능합니다 :)') {
					 alert("비밀번호가 서로 다릅니다");
					  return false;
				}
				
				
				
		}
		
	</script>
	
	
</head>
<body>

	<button type="button" class="btn btn-info"
		onclick="location.href='list'">전체 회원 목록</button>

	<form action="insert" method="post" enctype="multipart/form-data"
		onsubmit="return check()">
		<table class="table table-bordered" style="width: 600px;">
			<caption><b>회원가입</b></caption>
			<tr>
				<td style="width: 200px;" rowspan="4" align="center">
				<input type="file" id="myphoto" name="myphoto" style="display: none;">
					<img id="showing">
					<br> 
					<button type="button" id="btnphoto" class="btn btn-success">사진선택</button>
				</td>
				
				<td>
				<div class="form-inline">
						<input type="text" placeholder="아이디 입력" id="inputid" name="id"
							class="form-control" style="width: 120px;" required="required">
							
						<button type="button" class="btn btn-danger" id="btnidcheck">중복체크</button>	
						&nbsp;<span class="idsuccess" style="width: 60px; color: green"></span>
					</div>
				</td>
			</tr>
			
			<tr>
				<td>
				<div class="form-inline">
				<input type="password" style="width: 120px;" class="form-control"
				name="pass" id="pass" placeholder="숫자4자리"  required="required"><!-- maxlength=""-> 자리 제한 -->
				
				
				<input type="password" style="width: 120px;" class="form-control"
				 id="pass2" placeholder="숫자4자리" required="required">
				
				&nbsp; <span class="passsuccess" style="width: 60px;"></span>
				</div>
				</td>
			</tr>
			
			<tr>
			<td>
			<input type="text" name="name" class="form-control" style="width: 130px;"
			placeholder="이름 입력" required="required">
			</td>
			</tr>
			
			<tr>
			<td>
			<input type="email" name="email" class="form-control" style="width: 130px;"
			placeholder="이메일 입력" required="required">
			</td>
			</tr>
			
			<tr>
			<td colspan="2">
			<div class="form-inline">
			<input type="text" name="hp" class="form-control" style="width: 200px;"
			placeholder="(-) 없이 숫자만 입력" required="required">
			
			<input type="text" name="addr" class="form-control" style="width: 300px;"
			placeholder="간단주소 입력" required="required">
			</div>
			</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-info">회원가입</button>
			</td>
			</tr>

		</table>
	</form>

</body>
</html>