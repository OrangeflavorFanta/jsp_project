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
.day {
	color: gray;
	margin-left: 50px;
	margin-right: 30px;
	font-size: 0.9em;
}

.amod, .adel {
	cursor: pointer;
	font-size: 0.7em;
	color: gray;
}
</style>

<script type="text/javascript">
   $(function() {
	 //num값은 전역변수로 선언해놓고 시작
      num = $("#num").val();//var만 안붙이면 전역임
      loginok = "${sessionScope.loginok}";
      myid = "${sessionScope.myid}"

      //alert(loginok + "," + myid + "," + num)
      list();
      // insert
      $("#btnansweradd").click(function() {
         var content = $("#content").val();

         if (content.trim().length == 0) {//trim: 글자의 공백을 제거해주는 기능
            alert("댓글 입력하세요")
            return;
         }

         $.ajax({
            type : "post",//불러올 때만 get getMapping의 그 get
            dataType : "text", //불러올 때만 json
            url : "ainsert",//매핑주소
            data : {
               "num" : num,//주소창에보면 게시글의 번호가 9번 글이라 그 글에 대한 댓글임을 알려주기 위해 num을 갖고옴
               "content" : content
            },
            success : function() {
               alert("성공!!")

               // 입력값 지우기
               location.reload();
            }

         })
      });
      
      
      // 수정창 띄우기(모달)
      $(document).on("click","span.amod",function(){
    	 
    	  idx=$(this).attr("idx");
    	  
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
      //----------------------------------------------------------------------수정 창 띄우기 끝
      
      
      // 수정
	$(document).on("click","#btnupdate",function(){
		
		var content=$("#ucontent").val();//ucontent 안에 있는 value값을 가져오겠다
		//alert(idx+","+content);
		
		$.ajax({
			type:"post",
			dataType:"html",
			url:"aupdate",
			data:{
				"idx":idx,
				"content":content
			},
			success:function(res){
				
				
				list();
			}
		})
	});
      
      
   });

   
   
   
   // 사용자 함수 list
   function list() {

      $.ajax({
               type : "get",
               dataType : "json",
               url : "alist",
               data : {
                  "num" : num//num 값에 해당하는 댓글만 가져옴
               },
               success : function(res) {

                  $("span.acount").text(res.length);

                  var s = "";

                  $.each(res,function(i, dto) {
                                 s += "<b>" + dto.name + "</b>:"
                                       + dto.content;
                                 s += "<span class='day'>"
                                       + dto.writeday + "</span>";
                                 if (loginok == 'yes'
                                       && myid == dto.myid) {
                                    s += "<span class='glyphicon glyphicon-pencil amod' idx='"+dto.idx+"'></span>";
                                    s += "&nbsp;";
                                    s += "<span class='glyphicon glyphicon-trash adel' idx='"+dto.idx+"'></span>";
                                 }
                                 s += "<br>";
                              })
                  $("div.alist").html(s);
               }
            });
            

      // 삭제
      $(document).on("click", "span.adel", function() {
         var idx = $(this).attr("idx");
         //alert(idx)

         var a = confirm("해당 댓글 삭제??")

         if (a == true) {
            $.ajax({
               type:"get",
               dataType:"text",
               url:"adelete",
               data:{"idx":idx},
               success:function(){
                  list();
               }
            })
         }
      });
   }
</script>


</head>
<body>


	<table class="table table-bordered" style="width: 600px;">
		<tr>
			<td>
				<h3>
					<b>${dto.subject }</b>
					<span style="color: gray; float: right; font-size: 12pt;">
						<fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd" />
					</span>
				</h3> <span>작성자: ${dto.name }(${dto.myid })</span>
				<c:if test="${dto.uploadfile!='no' }">
					<span style="float: right;">
						<a href='download?clip=${dto.uploadfile }'> <!-- 다운로드 되는 태그..? 누르면 다운로드 됨 -->
						<span class="glyphicon glyphicon-download-alt"></span> 
						<b>${dto.uploadfile }</b> <!-- //다운로드 파일 이름 -->
						</a>
					</span>

				</c:if>
			</td>
		</tr>

		<tr>
			<td><c:if test="${bupload==true}">
					<h3>업로드 파일이 이미지입니다</h3>
					<img src="../photo/${dto.uploadfile }" style="max-width: 400px;">
				</c:if> <br> <br> 
				<pre style="background-color: white; border: 0px;">
					<!-- 배경색이랑 선 없애고 싶으면 -->
			${dto.content }
		</pre> <br> <b>조회: ${dto.readcount }</b>&nbsp; 
		<b>댓글: <span class="acount"></span></b>
		</td>
		</tr>

		<tr>
			<td>
				<!-- 리스트 출력 -->
				<div class="alist"></div>
					<c:if test="${sessionScope.loginok!=null }">
						<div class="aform">
							<div class="form-inline">
								<input type="hidden" id="num" value="${dto.num }">
								<input type="text" class="form-control" placeholder="댓글을 입력하세요" id="content">
								<button type="button" class="btn btn-info" style="width: 60px;" id="btnansweradd">등록</button>
							</div>
						</div>
					</c:if>
			</td>
		</tr>

		<!-- 버튼들 -->
		<tr>
			<td align="left">
				<!-- 글쓰기는 로그인 중일 때만 --> <c:if test="${sessionScope.logonok!=null }">
					<!-- 로그인 중일 때 -->
					<button type="button" class="btn btn-default" onclick="location.href='form'" style="width: 80px;">글쓰기</button>
				</c:if>
				<button type="button" class="btn btn-default" onclick="location.href='list?currentPage=${currentPage}'" style="width: 80px;">목록</button> 
				<!-- 로그인 중이면서 자기글만 수정, 삭제 버튼 보이게 --> <c:if test="${sessionScope.loginok!=null and sessionScope.myid==dto.myid}">
					<button type="button" class="btn btn-default" onclick="location.href='updateform?num=${dto.num}&currnetPage=${currentPage}'" style="width: 80px;">수정</button>
					<button type="button" class="btn btn-default" onclick="location.href='delete?num=${dto.num}&currentPage=${currentPage }'" style="width: 80px;">삭제</button>
				</c:if>
			</td>
		</tr>
	</table>
	
	
	<!-- Modal -->
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