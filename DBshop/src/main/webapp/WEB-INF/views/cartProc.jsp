<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
   UsersDto usersDto = (UsersDto)session.getAttribute("userInfo");
    if(usersDto == null) { // 로그인이 안됐다면
%> 
	<script>
		alert("로그인을 해주세요.");
		location.replace("login.jsp");
	</script>
<%}else{%>
	<script>
		alert("카트에 추가되었습니다.");
		history.back();
	</script>
<%} %>
</body>
</html>