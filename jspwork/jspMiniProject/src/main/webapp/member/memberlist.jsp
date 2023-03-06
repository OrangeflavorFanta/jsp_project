<%@page import="java.text.SimpleDateFormat"%>
<%@page import="data.Dto.MemberDto"%>
<%@page import="java.util.List"%>
<%@page import="data.Dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://fonts.googleapis.com/css2?family=Gaegu&family=Gowun+Batang&family=Hi+Melody&family=Noto+Serif+KR:wght@300&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.6.3.js"></script>
<title>Insert title here</title>
<style type="text/css">
th, td {
	text-align: center;
}
</style>

<script type="text/javascript">
	function defunc(num){
		var yes=confirm("정말 강퇴 처리 하시겠습니까?");
		
		if(yes)
			location.href='member/memberlist.jsp';
	}

</script>


</head>

<%
//전체 멤버 정보 가져오기
MemberDao dao = new MemberDao();
List<MemberDto> list = dao.getAllMembers();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
int no = 1;
%>
<body>

	<table class="table table-bordered" style="width: 1000px;">
		<caption>
			<b>전체회원목록</b>
		</caption>
		<tr bgcolor="#fff0f5">
			<th width="80">번호</th>
			<th width="120">회원명</th>
			<th width="100">아이디</th>
			<th width="220">핸드폰</th>
			<th width="480">주소</th>
			<th width="260">이메일</th>
			<th width="220">가입일</th>
			<th width="160">편집</th>
		</tr>

		<%
		for (MemberDto dto : list)

		{
		%>

		<tr>
			<td <%=no++%>></td>
			<td><%=dto.getName()%></td>
			<td><%=dto.getId()%></td>
			<td><%=dto.getHp()%></td>
			<td><%=dto.getAddr()%></td>
			<td><%=dto.getEmail()%></td>
			<td><%=sdf.format(dto.getGaipday())%></td>

			<td>
				<button type="button" class="btn btn-danger btn-xs"
				onclick="delfunc(<%=dto.getNum()%>)">삭제</button>
			</td>
		</tr>
		<%
		}
		%>

	</table>

</body>
</html>