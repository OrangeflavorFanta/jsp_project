<%@page import="data.Dao.SmartAnswerDao"%>
<%@page import="data.Dto.smartDto"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.Dto.smartDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.smartDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>


<style type="text/css">
a:link,a:visited {
   text-decoration: none;
   color: black;
}
</style>

<script type="text/javascript">

	$(function(){
		
		//전체 체크 클릭 시 체크값 얻어서 모든 체크 값에 전달
		$(".alldelcheck").click(function(){
			
			var chk=$(this).is(":checked"); //ture,false반환
			
			//전체 체크 값을 글 앞의 체크에 일괄전달
			$(".alldel").prop("checked", chk);
		});
		
			//삭제버튼 클릭 시 삭제
			$("#btndel").click(function(){
				
				//체크된 길이
				var len=$(".alldel:checked").length();
				//alert(len);
				
				if(len==0){
					alert("최소 1개 이상의 글을 선택해 주세요");
				}else{
					var a=confirm(len+"개의 글을 삭제하려면 [확인] 을 눌러주세요");
					//체크된 곳의 value(num) 얻기
					
					var n="";
					$(".alldel:checked").each(function(idx){
						n+=$(this).val()+",";
					});
					
					//마지막 컴마 제거하기
					n=n.substring(0,n.lenrgth-1));
					//alert(n);
					
					//삭제 파일로 전송
					location.href="board/alldelete.jsp?nums="+n ;
					
					
				}
				
			});
	
	
			
	});


</script>

</head>
<%
smartDao dao = new smartDao();

int totalCount;
int totalPage; //총 페이지수
int startPage; //각블럭의 시작페이지
int endPage; //각 블럭의 마지막페이지
int start; //각페이지 시작번호
int perPage = 3; //현제페이지 보여질 글의 갯수
int perBlock = 5; //한블럭당 보여지는 페이지개수
int currentPage; //현재페이지
int no;

//총갯수
totalCount = dao.getTotalCount();

//현재 페이지번호 읽기
if (request.getParameter("currentPage") == null)
   currentPage = 1;
else
   currentPage = Integer.parseInt(request.getParameter("currentPage"));

//총 페이지 갯수
totalPage = totalCount / perPage + (totalCount % perPage == 0 ? 0 : 1);

//각 블럭의 시작페이지
startPage = (currentPage - 1) / perBlock * perBlock + 1;
endPage = startPage + perBlock - 1;

//총페이지가 8... (6-10... endpage를 8로 수정)
if (endPage > totalPage)
   endPage = totalPage;

//각페이지에서 불러올 시작번호
start = (currentPage - 1) * perPage;

//각 페이지 에서 필요한 개시글 가져오기
List<smartDto> list = dao.getList(start, perPage);

SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");

no = totalCount - (currentPage - 1) * perPage;

//댓글에 관한 dao
SmartAnswerDao adao=new SmartAnswerDao();

for(smartDto dto:list)
{
	//댓글변수에 총갯수 넣기
	int acount=adao.getAllAnswers(dto.getNum()).size();
	dto.setAnswercount(acount);
}







%>
<body>

   <div style="margin: 30px 30px; width: 800px;">
      <br>
      <h6>
         <b>
            총
            <%=totalCount%>개의 게시글
         </b>

      </h6>
      <table class="table table-bordered">
         <caption>
            <b>스마트 게시판 목록</b>
         </caption>
         <tr>
            <th width="40">번호</th>
            <th width="200">제목</th>
            <th width="50">작성자</th>
            <th width="50">작성일</th>
            <th width="30">조회</th>
         </tr>
         <%
         if (totalCount == 0) {
         %>
         <tr>
            <td colspan="5" align="center">
               <h3>등록된 게시판이 없음</h3>

            </td>
         </tr>
         <%
         } else {
         for (smartDto dto : list) {
         %>
         <tr>
            <td align="center">
               <input type="checkbox" class="alldel" value="<%=dto.getNum()%>">
               &nbsp;&nbsp;
               <%=no--%>
            </td>
            
            <td>
            
           
            	<% 
            	if(dto.getAnswercount()>0)
            	{%>
            		<a href="index.jsp?main=board/dataileview.jsp>num=<%=dto.getNum()%>&currentPage=<%=currentPage%>">
            		<%=dto.getSubject() %><%=dto.getAnswercount()%></a>
            	<%}
            	%>
            
            </td>
            
            <td>
               <a href="index.jsp?main=board/detailview.jsp?num=<%=dto.getNum()%>&currentPage=<%=currentPage%>"><%=dto.getSubject()%></a>
            </td>
            <td align="center"><%=dto.getWriter()%></td>
            <td><%=sdf.format(dto.getWriteday())%></td>
            <td><%=dto.getReadcount()%></td>
         </tr>
         <%
         }
         }
         %>

         <tr>
            <td colspan="5">
               <input type="checkbox" class="alldelcheck">
               전체선택
               <span style="float: right">
                  <button type="button" class="btn btn-danger btn-sm" id="btndel">
                     <span class="glyphicon glyphicon-remove">삭제</span>
                  </button>

                  &nbsp;
                  <button type="button" class="btn btn-success btn-sm" onclick="location.href='index.jsp?main=board/smartform.jsp">
                     <span class="glyphicon glyphicon-pencil">글쓰기</span>
                  </button>

               </span>
            </td>

         </tr>
      </table>

   </div>
   <div style="width: 500px; text-align: center;">
      <ul class="pagination">
         <%
         //이전
         if (startPage > 1) {
         %>
         <li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=startPage - 1%>">이전</a></li>
         <%
         }

         for (int pp = startPage; pp <= endPage; pp++) {

         if (pp == currentPage) {
         %>
         <li class="active"><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         } else {
         %>
         <li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=pp%>"><%=pp%></a></li>
         <%
         }

         }

         //다음
         if (endPage < totalPage) {
         %>
         <li><a href="index.jsp?main=board/boardlist.jsp?currentPage=<%=endPage + 1%>">다음</a></li>
         <%
         }
         %>
      </ul>
   </div>
</body>
</html>