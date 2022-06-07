
<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
	<style>
        *,html,body{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        #wrap{
            width: 1176px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Robonto,
             Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            margin: 0 auto;
            display: flex;
        }
        /*#wrap div{
            border: 1px solid black;
        }*/


        /*왼쪽 메뉴*/
        #leftMenu{
            width: 300px;
            height: 600px;
        }
        #leftMenu div{
            width: 100%;
            height: 30px;
            cursor: pointer;
            color: gray;
            font-size: 14px;
        }
        #leftMenu div:nth-child(1){ 
            color: black;
            font-weight: bolder; 
            margin-bottom: 50px; 
            font-size: 30px;
        }


        /*오른쪽 메인*/
        #rightMain{
            width: 900px;
            height: 800px;
            position: relative;
        }
        #rightMain div{
            margin-bottom: 5px;
        }
        #rightMain div:nth-child(2),#rightMain div:nth-child(4){
            font-weight: bold;
            margin-top: 20px;
        }
        .rightTitle{
            font-size: 30px;
            font-weight: bolder;
            width: 100%;
            height: 70px;
        }
        input[type="text"]{
            width: 100%;
            height: 35px;
            border: 1px solid gainsboro;
        }
        input[type="password"]{
            width: 200px;
            height: 30px;
        }
        textarea{
            width: 100%;
            height: 350px;
            border: 1px solid gainsboro;
        }
        #textLength{
            width: 100%;
            height: 30px;
            margin-top: -10px;
            border-bottom: 1px solid gainsboro;
            border-left: 1px solid gainsboro; 
            border-right: 1px solid gainsboro; 
            text-align: right;
        	padding: 5px;
        }
        #cancelBtn{
            border: 1px solid black;
            font-size: 15px;
            font-weight: bold;
            width: 300px;
            height: 50px;
        }
        #submitBtn{
            background-color: black;
            color: white;
            font-size: 15px;
            font-weight: bold;
            width: 300px;
            height: 50px;
        }
        #btnBox{
            display: flex;
            justify-content: center;
            margin-top: 30px;
        }
        input[type="reset"]{
            margin-right: 10px;
            cursor: pointer;
        }
        input[type="button"]{
            cursor: pointer;
        }   
    
    </style>
</head>
<body>
<c:if test="${sessionScope.logindata == null}">
   <script>
        alert("로그인이 필요한 페이지 입니다.");
        location.replace("Login.do");
    </script>    
</c:if>
<jsp:include page="top.jsp"/>
	<%
	UsersDto usersDto = (UsersDto)session.getAttribute("userInfo");
	%>
	
	<div id="wrap">
        <div id="leftMenu">
            <div>고객센터</div>
            <div>Q&amp;A</div>
            <div>공지사항</div>
            <div>이벤트</div>
            <div>실시간 리뷰</div>
            <div>1:1 문의하기</div>
            <div>내가 쓴 게시글</div>
            <div>입고 일정 안내</div>
            <div>오프라인 스토어</div>

        </div>

        <div id="rightMain">
        	<form name="frm" action="QnaInsert.do" method="get">
            <div class="rightTitle">Q&amp;A</div>
            <div>제목</div>
            <div><input type="text" id="titlle" name="title"></div>
            <div>문의내용</div>
            <div><textarea name="content" id="content"></textarea></div>
            <div id="textLength"></div>
            <div id="btnBox">
                <input type="reset" id="cancelBtn" value="취소">
                <input type="button" id="submitBtn" value="등록" onclick="checkwrite()">
            </div>
            <input type="hidden" name="id" value="<%= usersDto.getId()%>">
            </form>
        </div>
    </div>
    
    <jsp:include page="footer.jsp"/>
</body>
<script>
	var title = document.frm.title;
	var content = document.frm.content;
	
    function checkwrite() {
        if(title.value=="") {
			alert("제목을 입력해주세요.");
			document.frm.title.focus();
			//return false;
        }else if(content.value=="") {
			alert("내용을 입력해주세요.");
			document.frm.content.focus();
			//return false;
        }else{
        	document.frm.submit();
        }
    }
    
    $("#content").keyup(function (e){
        var content = $(this).val();
        $("#textLength").html("문자: "+content.length);    //글자수 실시간 카운팅

        if (content.length > 500){
            alert("최대 500자까지 입력 가능합니다.");
            $(this).val(content.substring(0, 500));
            $("#counter").html("(500 / 최대 500자)");
        }
    });

</script>
</html>