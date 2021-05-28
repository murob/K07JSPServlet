<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@page import="model1.board.BoardDAO"%>
<%@page import="model1.board.BoardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//파라미터 받기
String id = request.getParameter("id");//일련번호
String searchField = request.getParameter("searchField");//검색필드
String searchWord = request.getParameter("searchWord");//검색어

String queryStr = "";
if(searchWord!=null){
	//검색 파라미터 추가하기
	queryStr = "&searchField="+searchField+"&searchWord="+searchWord;
}

MembershipDAO dao = new MembershipDAO(application);
//조회수 증가
// dao.updateVisitCount(num);
//파라미터로 전달된 일련번호를 조회
MembershipDTO dto = dao.memberView(id);
dao.close();
String address = dto.getAddress1() + dto.getAddress2();
%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원제 게시판</title>
<script>
/*
	Javascript를 통한 폼값 전송으로 삭제처리
*/
function isDelete() {
	var c = confirm("정말로 삭제하시겠습니까?");
	if(c) {
		var f = document.writeFrm;
		f.method = "post";
		f.action = "DeleteProcess.jsp";
		f.submit();
	}	
}
</script>
</head>
<body>
<h2>회원제 게시판 - 상세보기(View)</h2>
<!--  
	회원제 게시판에서 게시물 삭제를 위해 상세보기에
	게시물의 일련번호를 hidden 입력상자를 삽입한다. 
-->
<form name="writeFrm">
<input type="hid den" name="id" value="<%=id %>" />
<table border="1" width="90%">
	<tr>
		<td>아이디</td>
		<td><%=dto.getId() %></td> 
		<td>이름</td>
		<td><%=dto.getName() %></td>
	</tr>
	<tr>
		<td>비밀번호</td>
		<td><%=dto.getPassword() %></td>
		<td>생년월일</td>
		<td><%=dto.getBirthday() %></td>
	</tr>
	<tr>
		<td>우편번호</td>
		<td><%=dto.getZipcode() %></td>
		<td>전체주소</td>
		<td><%=address %></td>
	</tr>
	<tr>
		<td>이메일</td>
		<td><%=dto.getEmail() %></td>
		<td>휴대폰번호</td>
		<td><%=dto.getPhone() %></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=dto.getTellnum() %></td>		
		<td>회원가입일</td>
		<td><%=dto.getRegistdate() %></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<%
		/*
		로그인이 되었고, 동시에 해당 글을 작성한 작성자이면
		수정, 삭제 버튼을 보이게 처리한다. 
		*/
		if(session.getAttribute("USER_ID")!=null &&
			session.getAttribute("USER_ID").toString().equals(dto.getId())){
		%>			
			<button type="button" 
				onclick="location.href='Edit.jsp?num=<%=dto.getId()%><%=queryStr %>';">
					수정하기</button>							
			<button type="button" onclick="isDelete();">삭제하기</button>
		<%
		}
		%>	
			<button type="button" onclick="location.href='memberList.jsp?<%=queryStr %>';">
				리스트바로가기
			</button>
		</td>
	</tr>
</table>	
</form>
</body>
</html>


