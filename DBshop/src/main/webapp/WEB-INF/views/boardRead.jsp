<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<style>
		#wrap{
		width:1000px;
		margin: 0 auto;
		margin-top: 30px;
		}
		#title{
		margin: 0 atuo;
		font-weight: bold;
		font-size: 30px;
		}
		hr{
			border: 1px solid black;
		}
		.title{
			width:990px;
			height:30px;
		}
		.contop{
			margin-top:10px;
			width:490px;
			height:30px;
		}
		.contents{
			margin-top:10px;
			width:990px;
			height:300px;
		}
		.upload{
			margin-top:10px;
			width:60px;
			height:30px;
			color:white;
			background-color: skyblue;
			border: 1px solid skyblue;
			font-weight: bold;
		}
		#boardImg{
			width:300px;
			heght:300px;
		}
		input[type="button"]{
			background-color: black;
			color:white;
			width: 100px;
			height: 30px;
			margin-right: 10px;
		}
		#btnBox{
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        table{
        	display: inline-block;
        	width: 400px;
			height: 400px;
        }
        
	</style>
</head>
<body>
<jsp:include page="top.jsp"/>
    <c:if test="${sessionScope.logindata.lv != 10}">
   <script>
        alert("관리자가 아닙니다.");
        location.replace("Main.do");
    </script>    
</c:if>
    
<div id="wrap">
	<div id="title">게시판 조회</div>
	<hr><br>
	
	
	<c:forEach var="dto" items="${ board }">
		<table>
			<tr>
				<td>제목: </td>
				<td>${dto.name }</td>
			</tr>
			<tr>
				<td>종류: </td>
				<td>${dto.kind }</td>
			</tr>
			<tr>
				<td>가격: </td>
				<td>${dto.price }</td>
			</tr>
			<tr>
				<td>내용: </td>
				<td>${dto.contents }</td>
			</tr>
			<tr>
				<td>조회수: &nbsp; </td>
				<td>${dto.hit }</td>
			</tr>
		</table>
		<img id="boardImg" src="resources/img/${dto.image }">	
		
		<div id="btnBox">
			<input type="button" value="수정"  onclick="location.href='BoardUpadte.do?productNum=${dto.productNum }'">
			<input type="button" value="삭제"  onclick="location.href='BoardDelete.do?productNum=${dto.productNum }'">
		</div>		
	</c:forEach>
</div>
</body>
</html>