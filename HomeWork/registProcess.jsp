<%@page import="homework.MembershipDAO"%>
<%@page import="homework.MembershipDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String id = request.getParameter("user_id");
String password = request.getParameter("pass1");
String name = request.getParameter("name");
String gender = request.getParameter("gender");
String birthday = request.getParameter("birthday");
String zipcode = request.getParameter("zipcode");
String address1 = request.getParameter("address1");
String address2 = request.getParameter("address2");
String email = request.getParameter("email1") + "@" + request.getParameter("email2");
String phone = request.getParameter("mobile1") + request.getParameter("mobile2") + request.getParameter("mobile3");
String tellnum = request.getParameter("tel1") + request.getParameter("tel2") + request.getParameter("tel3");

MembershipDTO dto = new MembershipDTO();
dto.setId(id);
dto.setPassword(password);
dto.setName(name);
dto.setGender(gender);
dto.setBirthday(birthday);
dto.setZipcode(zipcode);
dto.setEmail(email);
dto.setPhone(phone);
dto.setTellnum(tellnum);
// dto.setId(session.getAttribute("user_id").toString());

MembershipDAO dao = new MembershipDAO(application);

dao.memberRegist(dto);



%>
