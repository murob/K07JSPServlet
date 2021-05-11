<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
include 지시어 : 공통으로 사용할 JSP파일을 생성한 후
	현재문서에 포함시킬 때 사용한다. 각각의 JSP파일 상단에는
	반드시 page 지시어가 삽입되어야 한다.
	단, 하나의 JSP파일에서 page지시어가 중복선언되면 안된다.
 --%>
<%@ include file = "IncludePage.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IncludeMain.jsp</title>
<link rel="stylesheet" href="./css/div_layout.css" />
</head>
<body>
	<div class="AllWrap">
		<div class="header">
			<!-- GNB영역 -->
			<%@ include file="../common/Top.jsp" %>
		</div>
		<div class="body">
			<div class="left_menu">
				<!-- LNB영역(Local Navigation Bar) -->
				<%@ include file="../common/Left.jsp" %>
			</div>
			<div class="contents">
				<!-- Contents 영역 -->
				
				<h2>오늘의날짜 : <%=todayStr %></h2>
				<br /><br />
				1980년 5·18민주화운동 당시 상황을 보고한 계엄군 문건에는 이처럼 가려진 한 사람의 이름이 여러 곳에 등장한다.
				<br /><br />
				당시 계엄군은 광주 상황을 거의 실시간으로 파악해 시민들이 외치는 구호나 요구사항을 상부에 보고했다.
				<br /><br /> 
				구호에 등장하는 최규하 당시 대통령 등의 이름은 모두 실명으로 적혀 있지만 유일하게 익명 처리된 한 사람이 있다.
				<br /><br /> 
				바로 전직대통령 전두환씨(90)다. 5·18 당시 국군 보안사령관 겸 중앙정보부장 서리였던 전씨가 이미 함부로 군 문건에 이름을 적지도, 입에 올리지도 못할 정도의 ‘최고실력자’였다는 점을 보여준다.
				<br /><br />
				10일 경향신문 취재를 종합하면 5·18 당시 계엄군이 광주의 상황을 실시간으로 작성해 보고한 여러 문건에서 전씨의 이름만 익명으로 처리됐다.
				<br /><br /> 
				당시 계엄군 최고 수뇌부는 보안사령부나 계엄사령부 치안처 등을 통해 광주의 상황을 보고 받았다.
				<br /><br />
				전씨가 사령관이었던 보안사령부는 관련 보고에서 전씨의 이름을 대부분 제대로 표기하지 않았다.
				<br /><br /> 
				보안사의 5월20일자 ‘광주 시내 시외 동향’ 상황보고에서는 “18:20(오후 6시20분) 현재 금남로 3가 한국은행 앞에 1000명으로 증가한 시민 학생이 계엄군과 대치하면서 ‘계엄군 물러가라’ ‘전○○, 신현확 물러가라’ 등의 구호를 외치며 시위 중” 이라고 쓰여 있다.
				<br /><br /> 
				전씨 이름은 익명 처리됐지만 당시 신현확 국무총리의 이름은 그대로 적혔다.
				<br /><br />
			</div>
		</div>
		<div class="copyright">
			<!-- Copyright -->
			<%@ include file="../common/Copyright.jsp" %>
		</div>
	</div>
</body>
</html>