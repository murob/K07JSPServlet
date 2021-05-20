<%@page import="model1.board.BoardDTO"%>
<%@page import="model1.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file = "./isLogin.jsp" %><!-- 로그인 확인 -->
<%
String num = request.getParameter("num");//파라미터 받기
//DAO객체 생성 후 게시물 조회
BoardDAO dao = new BoardDAO(application);
BoardDTO dto = dao.selectView(num);
//작성자 본인만 수정하기 페이지에 들어올 수 있다.
String session_id = session.getAttribute("USER_ID").toString();
if(!session_id.equals(dto.getId())){
	//작성자가 아니라면 경고창을 띄우고 뒤로 이동한다.
	JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
	return;
}
dao.close();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit.jsp</title>
<script type="text/javascript">
	//쓰기폼에 빈값이 있는지를 확인해주는 함수
	function formValidate(f) {
		if(f.title.value==""){
			alert("제목을입력하세요");
			f.title.focus();
			return false;
		}
		if(f.content.value==""){
			alert("제목을입력하세요");
			f.content.focus();
			return false;
		}
	}
</script>
</head>
<body>
	<h2>회원제 게시판 - 수정하기(Edit)</h2>
	<form name="writeFrm" method="post" action="EditProcess.jsp" onsubmit="return CheckValidate(this);">
		<!-- 
			특정 게시물 하나를 수정해야 하므로 수정폼을 전송할 때
			반드시 게시물의 일련번호도 전달되어야 한다.
			따라서 화면상에서는 보이지 않는 hidden입력상자를
			사용한다.
		 -->
		<input type="hidden" name="num" value="<%=dto.getNum() %>" />
		<table border="1" width="90%">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="title" style="width:90%;" value="<%=dto.getTitle() %>" />
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="content" style="width:90%;height:100px;"><%=dto.getContent() %></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<button type="submit">작성완료</button>
					<button type="reset">RESET</button>
					<button type="button" onclick="location.href='List.jsp';">리스트바로가기</button>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>