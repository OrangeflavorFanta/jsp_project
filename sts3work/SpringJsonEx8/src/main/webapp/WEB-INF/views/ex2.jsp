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

	<h3 class="alert alert-warnig">Ex2 예제</h3>
	<br>
	
	<button type="button" id="btn2" class="btn btn-warning">list2 json배열 대이터 출력하기</button>
	<div id="out2"></div>
	
	<script type="text/javascript">
	
	$("#btn2").click(function () {
		$.ajax({
		
			type:"get",
			dataType:"json",
			url:"list2",
			success:function(res){//베열형태로 넘어오는 값의/  배열 개념의 each문 사용
				
				var s="";
				$.each(res, function(i,elt){
					
					
					s+="<img src='upload/"+elt.photo+"' width=150>";
					s+="<figcaption><b>"
					s+=elt.name;
					s+="</b><figcaption>"
					s+="</figure>";
				});
			
				$("#out2").html(s);
			}
		});
		
	});
	
	
	
	
		
	</script>

</body>
</html>