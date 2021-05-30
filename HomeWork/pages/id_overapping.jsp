
<%@page import="homework.MembershipDTO"%>
<%@page import="homework.MembershipDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("user_id");
MembershipDAO dao = new MembershipDAO(application);

int joongbok = dao.joongbok(id);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
      function idUse() {
    	  /*
    	  팝업창에서 재입력한 아이디를 부모창으로 전달하기 위해
    	  opener속성을 사용한다.
    	  팝업창이 열릴때 부모쪽에서는 readonly속성이 부여되어 
    	  사용자는 수정할 수 없게되지만
    	  JS에서는 값을 수정할 수 있다.
    	  */
        opener.document.loginFrm.user_id.value =
          document.overlapFrm.retype_id.value;
        self.close();
      }
    </script>
  </head>
  <body>
    <h2>아이디 중복확인하기</h2>
    
    <!-- JSP의 request내장객체의 getParameter()를 통해 파라미터를 받아온다. -->
    <h3>입력한 아이디 : <%=id %> </h3>
    <%
    if(joongbok==1){
    %>
    <h3 style="color:red">아이디가 중복됩니다.</h3>
    <form name="overlapFrm">
      <input type="text" name="retype_id" size="20" value=""/>
      <input type="button" value="아이디사용하기" onclick="idUse();" />
    </form>
    <%
    }
    else {
    %>
    <h3 style="color:blue">사용가능한 아이디입니다.</h3>
    <form name="overlapFrm">
      <input type="text" name="retype_id" size="20" value="<%=request.getParameter("user_id")%>"/>
      <input type="button" value="아이디사용하기" onclick="idUse();" />
    </form>
    <%    
    }
    %>
  </body>
</html>

