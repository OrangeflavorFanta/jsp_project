<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
</head>
<body>

	<h2>jquery의 ajax 함수를 이용해서 person(xml)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn1">persontoxml
		읽기</button>
	<h2>jquery의 ajax 함수를 이용해서 info(json)_db읽어오기</h2>
	<button type="button" class="btn btn-success" id="btn2">infotojson
		읽기</button>

	<div id="show"></div>

	<script type="text/javascript">
		$("#btn1").click(function() {
			$.ajax({
				type:"get",
				url:"persontoxml.jsp",
				dataType:"xml",
				success:function(res){
					var s="";
					$(res).find("person").each(function(i,ele){
						var n=$(ele);
						
						s+="<div class='alert alert-info' style='width: 400px;'>";
						s+="No: "+n.attr("num")+",";
						s+="이름: "+n.find("name").text()+"<br>";
						s+="나이: "+n.find("age").text()+"<br>";
						s+="핸드폰: "+n.find("hp").text()+"<br>";
						s+="</div>";
						
					});
					
					$("#show").html(s);
				}
			});
		});
		
		

		$("#btn2").click(function() {
			$.ajax({
				type:"get",
				url:"infotojson.jsp",
				dataType:"json",
				success:function(res){
					var s="";
					
					$.each(res,function(i,item){
						s+="<div class='alert alert-warning' style='width: 300px;'>";
						s+="index: "+i+"<br>";
						s+="num: "+item.num+"<br>";
						s+="이름: "+item.name+"<br>";
						s+="핸드폰: "+item.hp+"<br>";
						s+="나이: "+item.age+"<br>";
						s+="<img src='"+item.photo+"' width='100'>";
						s+="</div><br>";
						
					});
					$("#show").html(s);
				}
			});
		});
	</script>

</body>
</html>