<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Anton&family=Edu+VIC+WA+NT+Beginner:wght@600&family=Gamja+Flower&family=Single+Day&family=Jua&family=Nanum+Pen+Script&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>
		<h2>jquery 의 ajax함수를 이용해서 food(xml)_db읽어오기</h2>
		<button type="button" class="btn btn-success" id="btn1">Food</button>
		
		<h2>jquery 의 ajax함수를 이용해서 student(json)_db읽어오기</h2>
		<button type="button" class="btn btn-success" id="btn2">Student</button>
		
		<div id="show"></div>


	<script type="text/javascript">
		$("#btn1").click(function() {
			
			
		$.ajax({
			
				type: "get",
				url:"foodToXml.jsp",
				dataType:"xml",
				success:function(res){
					
				var s="";
				$(res).find("food").each(function(i,ele){
					
				var n=$(ele);
					s+="<div class='alert alert-danger' style='width:300px;'><br>";
					s+="<img src='"+n.find("foodphoto").text()+"' width='100'><br>";
					s+="FoodNo: "+n.attr("num")+"<br>";
					s+=n.find("foodname").text()+"<br>";
					s+="음식가격 : "+n.find("price").text()+"원<br>";
					s+="갯수 : "+n.find("cnt").text()+"개<br>";
					s+="</div>";
					});
					$("#show").html(s);
				
						}
					})
				});
		
		
			$("#btn2").click(function() {
				
				
					$.ajax({
					type: "get",
					url:"studentToJson.jsp",
					dataType:"json",
					success:function(res){
					var s="";
					
					$.each(res,function(i,item){
						
						s+="<div class='alert alert-warning' style='width:300px;'>";
						s+="<img src='"+item.photo+"' width='100'>";
						s+="index: "+i+"<br>";
						s+="num :"+item.num+"<br>";
						s+="학생명: "+item.name+"<br>";
						s+="JAVA 점수: "+item.java+"<br>";
						s+="AJAX 점수: "+item.ajax+"<br>";
						s+="</div><br>";
					
					});
					
					$("#show").html(s);
					
					}
			});
		});
			</script>

</body>
</html>