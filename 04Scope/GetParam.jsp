<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>GetParam.jsp</title>
</head>
<body>
<%
String paramName = request.getParameter("paramName");
request.setAttribute("paramName", paramName);
%>
getParameter값 받아오기 : <%=request.getParameter("paramName") %>
<br />
getAttribute값 받아오기 : <%=request.getAttribute("paramName") %>
</body>
</html>