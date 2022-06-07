<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
		.boardWriteTitle{
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
	<div id="title">게시판 글쓰기</div>
	<hr><br>
	<c:forEach var="dto" items="${ requestScope.boardUpdate }">
	<form action="BoardUpadteProc.do" method="post" enctype="multipart/form-data">
		<input type="text" value="${dto.productNum }" name="productNum">
		<input type="text" name="name" class="boardWriteTitle" value="${dto.name }" placeholder="상품명"><br>
		<select name="kind" class="contop">
			<option>카테고리</option>
			<c:if test="${dto.kind eq 1}">
				<option value="1" selected="selected">셔츠</option>
				<option value="2">하의</option>
				<option value="3">스커트</option>
			</c:if>
			<c:if test="${dto.kind eq 2}">
				<option value="1">셔츠</option>
				<option value="2" selected="selected">하의</option>
				<option value="3">스커트</option>
			</c:if>
			<c:if test="${dto.kind eq 3}">
				<option value="1">셔츠</option>
				<option value="2">하의</option>
				<option value="3" selected="selected">스커트</option>
			</c:if>
		</select>
		<input type="text" name="price" class="contop" value="${dto.price }" placeholder="가격">
		<input type="text" name="contents" class="contents" value="${dto.contents }" placeholder="내용을 입력하세요.">
		<input type="file" name="image" value="${dto.image }"><br>
		
		<input type="submit" value="수정" class="upload">
		<input type="button" value="취소" class="upload" onclick="history.back()">
	</form>
	</c:forEach>
	</div>
</body>
</html>