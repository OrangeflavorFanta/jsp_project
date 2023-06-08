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

<div class="searcharea" style="width: 800px; margin: 10px 100px;">
  <!-- 검색창 -->
  <form action="list" class="form-inline" style="width: 600px; margin-left: 100px;">
  		<div>
  		   <select class="form-control" style="width: 150px;" name="searchcolumn">
  		     <option value="subject">제목</option>
  		     <option value="name">작성자</option>
  		     <option value="content">내용</option>
  		   </select>
  		   &nbsp;&nbsp;&nbsp;&nbsp;
  		   <input type="text" name="searchword" class="form-control" style="width: 200px;"
  		   placeholder="검색어를 입력하세요">
  		   <button type="submit" class="btn btn-success">검색</button>
  		</div>
  </form>
</div>



<div style="margin: 30px 30px;">
  <table class="table table-bordered" style="width: 800px; margin: 10px 100px;">
    
      <span style="float: right;"><button type="button" class="btn btn-default"
      onclick="location.href='form'">글쓰기</button></span>
    </caption>
      
      <tr bgcolor="#ddd" align="center">
         <td width="60"><b>번호</b></td>
         <td width="360"><b>제목</b></td>
         <td width="120"><b>작성자</b></td>
         <td width="160"><b>작성일</b></td>
         <td width="100"><b>조회</b></td>
      </tr>
      
      <c:if test="${totalCount==0 }">
        <tr>
          <td colspan="5" align="center">
            <b>등록된 게시글이 없습니다</b>
          </td>
        </tr>
      </c:if>
      
      <c:if test="${totalCount>0 }">
         <c:forEach var="dto" items="${list }">
           <tr>
             <td align="center">${no }</td>
              <c:set var="no" value="${no-1 }"/>  <!-- 출력후 감소(증감식이안되므로) -->
              
              <!--제목  -->
              <td>
                  <!-- relevel만큼 공백 -->
                  <c:forEach begin="1" end="${dto.relevel }">
                    &nbsp;&nbsp; <!-- 2칸..원글이면 0이므로 안돈다 -->
                  </c:forEach>
                  
                  <!-- 답글이면 re이미지출력 -->
                  <c:if test="${dto.relevel>0 }">  <!-- restep도 됨 -->
                    <img alt="" src="../photo/re.png">
                  </c:if>
                  
                  <!--제목..여기통해서 내용보기로...  -->
                  <a href="content?num=${dto.num }&currentPage=${currentPage}">${dto.subject }</a>
                  
                  
                  <!-- 이미지가 있을경우 아이콘 표시 -->
                  <c:if test="${dto.photo!='no' }">
                    <span class="glyphicon glyphicon-picture" style="color: gray; font-size: 0.8em;"></span>
                  </c:if>
              </td>
              <td align="center">${dto.name }</td>
              <td align="center">
                 <fmt:formatDate value="${dto.writeday }" pattern="yyyy-MM-dd HH:mm"/>
              </td>
              <td align="center">${dto.readcount }</td>
           </tr>
         </c:forEach>
      </c:if>
  </table>
  
  <!--페이징  -->
  
     <div style="width: 800px; text-align: center;">
        <ul class="pagination">
            <!-- 이전 -->
            <c:if test="${startPage>1 }">
              	<li>
    	    		<a href="list?currentPage=${startPage-1 }">이전</a>
    	  		</li>
            </c:if>
            
            <c:forEach var="pp" begin="${startPage }" end="${endPage }">
                <c:if test="${currentPage==pp }">
                    <li class="active">
    		    		<a href="list?currentPage=${pp }">${pp }</a>
    		  		</li>
                </c:if>
                
                <c:if test="${currentPage!=pp }">
                    <li>
    		    		<a href="list?currentPage=${pp }">${pp }</a>
    		  		</li>
                </c:if>
            </c:forEach>
            
            <!-- 다음 -->
            <c:if test="${endPage<totalPage}">
              	<li>
    	    		<a href="list?currentPage=${endPage+1}">다음</a>
    	  		</li>
            </c:if>
        </ul>
     </div>
 
  
</div>

</body>
</html>