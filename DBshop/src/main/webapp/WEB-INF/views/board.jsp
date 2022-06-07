<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
   *,html,body{
      margin: 0;
      padding: 0;
   }
   #wrap{
      width:1000px;
      margin: 0 auto;
      margin-top: 30px;
   }
   .board_title{
      margin: 0 atuo;
      font-weight: bold;
      font-size: 30px;
   }
   
   .topborder{
      width:1000px;
      margin: 0 auto;
      border-top: 2px solid black;
      border-bottom: 1px solid black;
      margin-top: 50px;
      border-collapse: collapse;
   }
   
   .bottomborder{
      border-bottom: 1px solid gray;
      text-align: center;
   }
   #idxB{
      text-align: center;
      width: 60px;
      height:35px;
   }
   #redateB{
      text-align: center;
      width: 100px;
      height:35px;
   }
   #titleB{
      text-align:center;
      width:750px;
   }
   
   #write{
      margin-top:10px;
      background-color:skyblue;
      width:80px;
      height:40px;
      color:white;
      font-weight: bold;
      border: 1px solid skyblue;
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


   <% 
   
   %>
   <div id="wrap">
   <div class="board_title">게시판</div>
   
   <table class="topborder">
   <tr class="bottomborder   ">
   <td id="idxB">No</td>
   <td id="idxB">종류</td>
   <td id="titleB">제품명</td>
   <td id="redateB">가격</td>
   <td id="idxB">조회수</td>
   <td id="redateB">작성일자</td>
   </tr>
   <c:forEach var="dto" items="${ board }">
         <tr class="bottomborder">
            <td>${ dto.productNum }</td>
            <td>${ dto.kind }</td>
            <td><a href="BoardRead.do?productNum=${ dto.productNum }">${ dto.name }</a></td>
            <td>${ dto.price }</td>
            <td>${ dto.hit }</td>
            <td>${ dto.regdate }</td>
         </tr>
   </c:forEach>
   </table>
   
   <input type="button" value="글쓰기" id="write" onclick="location.href='BoardWrite.do'">
   
   <div style="float:right">
   <c:forEach var="i" begin="1" end="${pageCount}" step="1">
		<a href="Board.do?pageNum=${i}">[${i}]</a>
	</c:forEach>
   </div>
   
</body>
</html>