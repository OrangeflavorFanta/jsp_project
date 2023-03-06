<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>

<script type="text/javascript">

	$(function(){
		
		//id중복체크
		$("#btncheck").click(function(){
			//id읽기
			var id=$("#id").val();
			//alert(id);
			
			$.ajax({
				type:"get",
				url:"member/idsearch.jsp",
				dataType:"json",
				data:{"id":id},
				success:function(res){
					
					//consol.log(res.count);
					if(res.count==1){
						//alert("이미가입된 아이디입니다 \n 다시 입력해 주세요");
						$("span.idsuccess").text("가입불가");
						$("#id").val('');
						$("#id").focus();
						
						}else{
							//alert("가입이 가능한 아이디입니다");
							$("span.idsuccess").text("가입가능");
						}
					
				}
				
			});
		});
		
		
		
		
		
		//---------------------id중복체크
		
		
		//이메일
		$("#selEmail").change(function() {
			if($(this).val()=='-'){
				$("#email2").val('');
			}else{
				$("#email2").val($(this).val());
			}
			
		});
		
		
	});
		//--------------------이메일
	
	
	//비밀번호 확인
	function passcheck(f){
		
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 서로 다릅니다");
			
			f.pass.value="";
			f.pass2.value="";
			
			return false;//액션이 호출되지 않게 하는거
		}
		
	}

</script>
</head>
<body>

	<form action="member/addaction.jsp" method="post" class="form-inline"
	onsubmit="return passcheck(this)" name="f">
	
		<table class="table table-bordered" style="width: 500px;">
			<caption>
				<b>회원가입</b>
			</caption>
			<tr>
				<th width="100" bgcolor="#aaa">아이디</th>
				<td><input type="text" name="id" id="id" class="form-control"
				required="required" style="width: 120px;">
				
				<button type="button" class="btn btn-danger" id="btncheck">중복체크</button>
				<span class="idsuccess"></span>
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#aaa">비밀번호</th>
				<td>
				<input type="password" name="pass" id="pass" class="form-control"
				required="required" style="width: 120px;" placeholder="비밀번호">
				
				<input type="password" name="pass2" id="pass2" class="form-control"
				required="required" style="width: 120px;" placeholder="비밀번호 확인">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">이름</th>
				<td>
				<input type="text" name="name" id="name" class="form-control"
				required="required" style="width: 120px;">
				</td>
			</tr>
			
			<tr>
				<th width="100" bgcolor="#aaa">핸드폰</th>
				<td>
				<input type="text" name="hp" id="hp" class="form-control"
				required="required" style="width: 200px;">
				</td>
			</tr>
			
			
			<tr>
				<th width="100" bgcolor="#aaa">주소</th>
				<td>
				<input type="text" name="addr" id="addr" class="form-control"
				required="required" style="width: 400px;">
				</td>
			</tr>
			
			<tr>
			<th width="100" bgcolor="#aaa">이메일</th>
			<td>
				<input type="text" name="email" id="email" class="form-control"
				required="required" style="width: 120px;"> @ 
				
				<input type="text" name="email2" id="email2" class="form-control"
				required="required" style="width: 120px;">	
				
				<select id="selEmail" class="form-control">
				<option value="-">직접입력</option>
				<option value="naver.com">naver.com</option>
				<option value="gmail.net">gmail.net</option>
				<option value="hanmail.net">hanmail.net</option>
				<option value="nate.com">nate.com</option>
				</select>
			</td>
			</tr>
			
			<tr>
			<td colspan="2" align="center">
			<button type="submit" class="btn btn-default"
			style="width: 100px;">저장하기</button>
			<button type="reset" class="btn btn-default"
			style="width: 100px;">초기화</button>
			</td>
			</tr>
		</table>
	</form>

</body>
</html>