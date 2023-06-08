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

	<div style="width: 800px; text-align: right; margin: 50px;50px; font-size: 2em;">
		<span class="glyphicon glyphicon-th-large" style="cursor: pointer;"></span>
		<span class="glyphicon glyphicon-th-list" style="cursor: pointer;"></span>
	</div>
	
	<div class="restlist" style="margin-top: 50px; margin-left: 50px;">
	
	</div>
	
	<script type="text/javascript">
		//1번째 아이콘
		$("span.list1").click(function(){
			
			$("span.list1").css("color","red");
			$("span.list2").css("color","black");
			
			//$("restlist").html("출력_1");
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"list1",
				success:function(res){
					var tag="";
					tag+="<table class='table' style='width:800px;'>";
					
					$.each(res,function(i.elt){
						tag+="<tr height='110'><td>";
						tag+="<h3><b>"+elt.subject+"</b></h3>";
						tag+=elt.content="<br>";
						
						if(elt.pjoto!='no'){
							tag+="<span style='float: right'>"
							tag+="<img width:'100' height='100' src='../photo/"+elt.photo+"'><br>";
							tag+="</span>";
						}
					});
					
					tag+="</table>";
					$(".restlist").html(tag);
				}
			});
		});
		
		//2번째 아이콘
	
	</script>

</body>
</html>