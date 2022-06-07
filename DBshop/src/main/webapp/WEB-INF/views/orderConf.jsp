
<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@page import="com.company.shop.orderbean.OrderDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>
   .center_box {
      margin:0 auto;
      width: 700px;
      text-align:center;
   }
   .info-form {
       padding: 20px;
   }
 
 
   .simple_table { 
   		width: 100%; 
   		border: none; 
   		border-collapse: separate; 
   		border-spacing: 2px;
   }
	.simple_table th { 
		padding: 15px; 
		border: none; 
		border-left: 5px solid #C03; 
		border-bottom: 1px solid #DDD; 
		background: #FCF0F3; 
		font-weight: normal; 
		text-align:center; 
		text-shadow: 0 1px #FFF; 
		vertical-align: middle;
	}
	.simple_table td { 
		padding: 15px; 
		border: none; 
		border-bottom: 1px solid #DDD; 
		text-align: left; 
		vertical-align: baseline;
	}
 
 
   .btn {
   	  width: 374px;
      font-size: 20px;
      padding: 10px;
      background-color:FFE650;  
   }
</style>
<body>
<jsp:include page="top.jsp"/>
<%
	OrderDto odto = (OrderDto)request.getAttribute("orderData");
    UsersDto usersDto =	(UsersDto)request.getAttribute("userData");
%>

    <div class="center_box">
      	<h1>주문이 완료되었습니다.</h1>
      	<div class="info_form"><br>
	    	<h2>배송지 정보</h2><br>
	    	
	    	<table class="simple_table">
		      <tbody>
		            <tr>
		                  <th scope="row">주문자</th>
		                  <td><%=usersDto.getName() %></td>
		            </tr>
		            <tr>
		                  <th scope="row">전화번호</th>
		                  <td><%=usersDto.getPhone() %></td>
		            </tr>
		            <tr>
		                  <th scope="row">이메일</th>
		                  <td><%=usersDto.getEmail() %></td>
		            </tr>
		            <tr>
		                  <th scope="row">주소</th>
		                  <td><%=usersDto.getAddress() %> <%=usersDto.getAddress2() %></td>
		            </tr>
		      </tbody>
			</table>
    	</div>
   		<br><br>
    	<input class="btn" type="button" value="주문내역 확인" onclick="location.href='Orderchk.do'">
	</div>

 



</body>
</html>