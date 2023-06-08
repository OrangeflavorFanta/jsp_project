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

	<input type="text" name="name" id="name" placeholder="이름"><br>
	<input type="text" name="hp" id="hp" placeholder="번호"><br>
	<input type="text" name="addr" id="addr" placeholder="주소"><br>
	<button type="button" id="btninsert">ajax로 저장</button><br><br>
	
	
	
	<div class="babo">
	최보현 바보<br><br><br><br>
	<%-- <b class="alert alert-info">${totalCount }개의 정보</b> --%>
	</div>
	
	<script type="text/javascript">
	
		babo();
		
		$("#btninsert").click(function(){
			//alert("얍");
			

			var name=$("#name").val();
			var hp=$("#hp").val();
			var addr=$("#addr").val();

			//insert
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"ainsert",
				data:{
					"name":name,
					"hp":hp,
					"addr":addr
				},
				success:function(res){
					
					alert("얍얍");
					babo();
				}
			});
		});
		
		//updateModal
		// 수정창 띄우기(모달)
      $(document).on("click","#btnupfrom",function(){
    	 
    	  num=$(this).attr("num");
    	  
    	  $.ajax({
    		 
    		  type:"get",
    		  dataType:"json",
    		  url:"adata",
    		  data:{
    			  "idx":idx
    		  },
    		  success:function(res){
    			  
    			  $("#ucontent").val(res.content);    			  
    		  }
    	  });
    	  
    	  $("#myuModal").modal();
    	  
      });
		

		//update
		/* $(document).on("click","#btnup",function(){
			
			//alert("얍얍얍얍");
			num=$(this).attr("num");
			
			var name=$("#name").val();
			var hp=$("#hp").val();
			var addr=$("#addr").val();
			
			$.ajax({
				
				type:"post",
				dataType:"html",
				url:"aupdate",
				data:{
					"name":name,
					"hp":hp,
					"addr":addr
				},
				success:function(res){
					alert("수정 성공!!")
					location.reload();
				}
			}) 
			
			 
		});*/
		
		
		
		//delete
		$(document).on("click","#btndel",function(){
			//alert("얍얍");
			num=$(this).attr("num");
			
			$.ajax({
				type:"get",
				dataType:"html",
				url:"adeletefunc",
				data:{
					"num":num
				},
				success:function(res){
					alert("삭제 성공!!"),
					location.reload();
				}
			});
			
		});
		
		
		
		function babo(){
			
			$.ajax({
				
				type:"get",
				dataType:"json",
				url:"alist",
				success:function(res){
					
					var b="<table class='table table-bordered' style='width:1000px;>'"
					b+="<tr><th>No.</th><th>이름</th><th>전화번호</th><th>주소</th><th>수정|삭제</th></tr>";
					
					$.each(res,function(i,ele){
						b+="<tr>";
						b+="<td>"+(i+1)+"</td>";
						b+="<td>"+ele.name+"</td>";
						b+="<td>"+ele.hp+"</td>";
						b+="<td>"+ele.addr+"</td>";
						b+="<td>";
						b+="<button type='button' id='btnupform'>수정</button>";
						b+="<button type='button' id='btndel'num='"+ele.num+"'>삭제</button>";
						b+="</td>";
						b+="</tr>";
					})
					
					b+="</table>";
					
					$(".babo").html(b);
				}
				
			});			
		};
	
	
	</script>
	
	
	<!-- UpdateModal -->
  <div class="modal fade" id="myuModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">댓글수정</h4>
        </div>
        
        
        <div class="modal-body">
          <input type="text" id="ucontent" class="form-control">
        </div>
        
        
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" id="btnupdate">수정</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" >닫음</button>
        </div>
      </div>
      
    </div>
  </div>
	
	
	
	
	
	
	
</body>
</html>