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

	#answer{
	border-bottom: 1px solid #ddd;
	margin-bottom: 20px;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 20px;
	}

</style>
</head>
<body>

	<div style="margin: 50px 50px;">
		<table class="table table-bordered" style="width: 600px;">
			<caption><b>내용보기</b></caption>
			<tr>
				<td>
					<h2><b>${dto.subject }</b></h2>
						<span style="float: right; margin-left: 20px;">
							조회  ${dto.readcount }&nbsp;&nbsp;&nbsp;&nbsp;
							<fmt:formatDate value="${dto.writeday }"
							pattern="yyyy-MM-dd HH:mm"/>
						</span>
						
						<h5><b>작성자: ${dto.writer }</b></h5>
				</td>
			</tr>
			
			<tr>
				<td>
				<pre style="background-color: white; border: 0px;">${dto.content }</pre>
				<br><br>
				
				<c:if test="${dto.photo!='no' }">
					<c:forTokens var="ps" items="${dto.photo }" delims=",">
						<a href="../photo/${ps }">
						<img alt="" src="../photo/${ps }" style="width: 150px; height: 150px;"
						border="1px solid green;">
						</a>
					</c:forTokens>
				</c:if>
				</td>
			</tr>
			
			<tr>
				<td>
					<div id="answer">
					<b>댓글: ${acount }</b><br><br>
					<c:forEach var="a" items="${alist }">
						${a.nickname }: ${a.content }
						&nbsp;&nbsp;
						<span style="color: gray; font-size: 0.8em;">
						<fmt:formatDate value="${a.writeday }" pattern="yyyy-MM-dd HH:mm"/>
						</span>
						&nbsp;&nbsp;
						<span class="glyphicon glyphicon-pencil small" style="cursor: pointer; color: green;">수정</span>
						<span class="adel glyphicon glyphicon-remove small" style="cursor: pointer; color: red;"
						idx="${a.idx }">삭제</span><br>
					</c:forEach>
					
					</div>
					
					<form action="ainsert" method="post" class="form-inline">
					<!-- hidden -->
					<input type="hidden" name="num" value="${dto.num }">
					<input type="hidden" name="currentPage" value="${currentPage }">
					<b>닉네임: </b>
					<input type="text" name="nickname" class="form-control input-sm" style="width: 100px;"
					required="required">
					<b style="margin-left: 30px;">비밀번호: </b>
					<input type="password" name="pass" class="form-control input-sm" style="width: 100px;"
					required="required">
					<br><br>
					
					<input type="text" name="content" class="form-control input-sm"
					style="width: 500px;" required="required" placeholder="댓글을 입력해주세요.">
					<button type="submit" class="btn btn-info btn-sm">확인</button>
					
					</form>
				</td>
			</tr>
			
			
			
			
			
			
			
			
			
			<tr>
				<td align="right">
					<button class="btn btn-default btn-sm"
					onclick="location.href='writeform'">글쓰기</button>
					<button class="btn btn-default btn-sm"
					onclick="location.href='writeform?num=${dto.num}&regroup=${dto.regroup }&restep=${dto.restep }&relevel=${dto.relevel }&currentPage=${currentPage }'">답글</button>
					<button class="btn btn-default btn-sm"
					onclick="location.href='updatepassform?num=${dto.num}&currentPage=${currentPage }'">수정</button>
					<button class="btn btn-default btn-sm"
					onclick="location.href='deletepassform?num=${dto.num}&currentPage=${currentPage }'">삭제</button>
					<button class="btn btn-default btn-sm"
					onclick="location.href='list?currentPage=${currentPage}'">목록</button>
				
				</td>
			</tr>
			
		</table>
	</div>
	
	<script type="text/javascript">
		
		//댓글 삭제
		$("span.adel").click(function() {
			
			var idx=$(this).attr("idx");
			//alert(idx)
			
			//비번 입력
			var pass=prompt("비밀번호를 입력해주세요");
			//alert(pass);//취소시 null확인
			
			if(pass==null)
				return;//취소시 함수 종료
				
				$.ajax({
					type:"get",
					dataType:"json",
					url:"adelete",
					data:{"idx":idx,"pass":pass},
					success:function(res){
						if(res.check==0){
							alert("비밀번호가 맞지 않아요");
						}else{
							//메세지 후 새로고침
							alert("댓글을 삭제 했어요");
							location.reload();
						}
					}
				})
		});
	</script>
	

</body>
</html>