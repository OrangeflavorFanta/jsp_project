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

	<h1 class="alert alert-info">${totalcount }개의 상품이 등록되었습니다</h1>
	
	<button type="button" class="btn btn-info"
	onclick="location.href='form'">상품추가</button>
	
	<!-- 번호, 상품명, 색상, 가격, 입고일 -->
	
	<table class="table table-bordered" style="width: 1000px;">
	<caption>상품 목록</caption>
		<tr bgcolor="orange">
		<th width="80">No.</th>
		<th width="180">상품명</th>
		<th width="100">색상</th>
		<th width="120">가격</th>
		<th width="120">입고일</th>
		<th width="80">수정|삭제</th>
		</tr>
		
		<c:forEach var="dto" items="${list }" varStatus="i">
		<tr>
		<td  width="80">${i.count }</td>
		<td width="180"><a>${dto.sangname }</a></td> 
		<td width="100">${dto.color }</td> 
		<td width="120">${dto.price }</td> 
		<td width="120">${dto.ipgoday }</td> <!-- ipgoday를 timestamp로 해주지 않고 String이라 fmt안됨 -->
		<td width="80">
		<button type="button" class="btn btn-success" onclick="location.href=''">수정</button>
		<button type="button" class="btn btn-danger" onclick="location.href=''">삭제</button>
		</td>
		</tr>
		</c:forEach>
	</table>
	
	
	
	<!-- 페이징 -->
	<c:if test="${totalcount>0 }">
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
            <c:if test="${endPage<totalPage }">
               <li>
                  <a href="list?currentPage=${endPage+1}">다음</a>
               </li>
            </c:if>
         </ul>
      </div>
   </c:if>

</body>
</html>