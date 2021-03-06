
<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@page import="com.company.shop.qnabean.QnaDto"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
    <style>
        *,html,body{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        #wrap{
            width: 900px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Robonto,
             Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            margin: 0 auto;
        }
        #wrap>div{
            margin-bottom: 10px;
        }

        
        #pageTitle{
            font-size: 30px;
            font-weight: bold;
            height: 100px;
            text-align: center;
            width: 100%;
            border-bottom: 1px solid gainsboro;
            padding: 25px;
        }
        #top{
            width: 100%;
            height: 100px;
            border-bottom: 1px solid gainsboro;
            padding-top: 25px;
        }
        #title{
            font-size: 20px;
        }
        #id, #date{
            font-size: 12px;
            display: inline-block;
            color: gray;
        }
        #content{
            min-height: 200px;
            max-height: 400px;
        }
        #mnd{
            justify-content: flex-end;
            display: flex;
            border-bottom: 1px solid gainsboro; 
            padding-bottom: 10px;
        }
        #mnd div{
            display: inline-block;
            margin-left: 5px;
        }
        input[type="password"]{
            width: 150px;
            height: 25px;
            border: 1px solid gainsboro;
        }
        #mnd input[type="submit"], input[type="button"]{
            width: 50px;
            height: 25px;
            background-color: rgb(241, 241, 241);
            color: black;
            border: 1px solid gainsboro; 
            cursor: pointer;
            
        }
        #list{
            width: 250px;
            height: 50px;
            background-color: whitesmoke;
            color: black;
            font-weight: bold;
            margin-left: 330px;
            margin-bottom: 20px;
            margin-top: 20px;
            border: 1px solid black;
            cursor: pointer;
        }
        #replyBox{
            width: 100%;
            height: 100px;
            background-color: rgb(236, 249, 255);
            position: relative;
            margin-top: 10px;
        }
        #reply{
            width: 90%;
            height: 80%;
            position: absolute;
            top: 10px;
            left: 10px;
        }
        #ansDelBtn{
           width:20px;
           height: 20px;
        }
        #ansSubBtn{
            position: absolute;
            bottom: 10px;
            right: 15px;
        }
        #prev, #next{
            height: 70px;
            width: 100%;
            border-bottom: 1px solid gainsboro;
            border-top: 1px solid gainsboro;
            padding-top: 24px;
            color: gray;
            font-size: 14px;
            cursor: pointer;
        }
        a{
           color: black;
           text-decoration: none;
        }
        
        
       #replyWrap{
         width: 900px;
         min-heght: 100px;
         max-height: 600px;
         border: 1px solod grey;
       }
       #empty{
           width: 100%;
           height: 100px;
       }
       #replyList{
             width:100%;
             margin: 0 auto;
            position: relative;
       }
       #replyList div{
           width: 100%;
           min-height: 90px;
           border: 1px solid rgb(163, 163, 163);
           background-color: rgb(236, 249, 255);
           position: absolute;
           top: 10px;
           min-height: 70px;
           padding-right: 20px;
           font-size: 15px;
           padding-top: 10px;
       }
       #ansDelBtn{
            position: absolute;
            right: 4px;
            top: 14px;
            border: 1px solid rgb(163, 163, 163);
       }
</style>
</head>
<body>
<jsp:include page="top.jsp"/>   
<% 
    //QnaDto qnaDto = (QnaDto)request.getAttribute("qnaData"); // QnaReadHandler????????? ??????
    //QnaDto prevQnaDto = (QnaDto)request.getAttribute("prevQnaData"); 
    //QnaDto nextQnaDto = (QnaDto)request.getAttribute("nextQnaData"); 
    UsersDto usersDto = (UsersDto)session.getAttribute("userInfo");
%>   
    

   <div id="wrap">
    <form action="PwChkForQna.do" method="post"> <!-- form action?????? get???????????? ?-&- ?????? ??????. method??? ????????????.. -->
        <div id="pageTitle">Q&amp;A</div>
        <div id="top">
            <div id="title">${read.title}</div>
            <div id="id">${read.id}</div>
            <div id="date">${read.qdate}</div>
        </div>
        <div id="content">${read.content}</div>
      
        <div id="mnd">
        <!-- usersDto.getId() == ${read.id} ????????? ???????????????-->
        <%if(usersDto != null && (usersDto.getLv()==10)) { %>
            <div id="showPw"><span style="font-size: 13px; color: gray;">???????????? : </span><input type="password" name="insertPw" id="insertPw"></div>
            <div><input type="submit" value="??????" id="update"></div>
            <div><input type="button" value="??????" onclick="location.href='QnaDelete.do?qnaNum=${read.qnaNum}&id=${read.id}'"></div>
        <% }%>
        </div>
        
      
      <input type="hidden" name="qnaNum" value="${read.qnaNum}">
      <input type="hidden" name="qnaId" value="${read.id}">
   </form>
   


   <!-- ?????? ?????? ??? -->
   <c:if test="${not empty qaRead}">
      <div id="replyWrap">
         <div id="replyList">
            <div>${qaRead.content}</div>
            <c:if test="${userInfo.lv eq 10}">
                  <input type="button" id="ansDelBtn" value="x"
                   onclick="location.href='QnaAnswerDelete.do?answerNum=${read.qnaNum}'">
            </c:if>
         </div>
      </div>
      <div id="empty"></div>
   </c:if>   
   <c:if test="${empty qaRead && userInfo.lv eq 10}">
      <div id="replyBox">
         <form action="QnaAnswerInsert.do" method="post">
                 <textarea id="reply" name="content"></textarea>
                 <input type="submit" id="ansSubBtn" value="??????">
                 <input type="hidden" name="answerNum" value="${read.answerNum}">
           </form>
       </div>
    </c:if>
    <input type="button" id="list" value="??????" onclick="location.href='Qna.do'">

       
        
      <c:if test="${!empty prevRead.qnaNum}">
             <div id="prev"><span style="padding-right: 30px;">?????????</span>
             <a href="QnaRead.do?qnaNum=${prevRead.qnaNum}">${prevRead.title}</a></div> 
      </c:if>
      <c:if test="${!empty nextRead.qnaNum}">
             <div id="next"><span style="padding-right: 30px;">?????????</span>
             <a href="QnaRead.do?qnaNum=${nextRead.qnaNum}">${nextRead.title}</a></div> 
      </c:if>
      
   
</div>    
    
   

<script>
   /*$(function(){  submit?????? ?????????  form action?????? ??????????????? ?????? ?????? -?????? ???????????? ????????? ???????????? ????????? ???  ?????? ????????? ????????? ????????? ?????? ?????? ??????
       $("#update").click(function(){
           $("#showPw").css("visibility","visible")
       });
   });*/
   
   /* submit ??????????????? form action?????? ??????????????? ?????? ??????
   var insertPw = document.frm.insertPw;
   
    function chkAll() {
        if(title.insertPw=="") {
         alert("??????????????? ??????????????????.");
         document.frm.title.focus();
         //return false;
        }else{
           document.frm.submit();
        }
    }
   */


</script>
<jsp:include page="footer.jsp"/>
</body>
</html>