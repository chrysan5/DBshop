
<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://kit.fontawesome.com/6584921572.js" crossorigin="anonymous"></script>


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

        /*왼쪽 메뉴창*/
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

        /*오른쪽 메인창*/
        #rightMain{
            width: 900px;
            height: 800px;
            position: relative;
        }
        
        .rightTitle{
            font-size: 30px;
            font-weight: bolder;
            width: 100%;
            height: 70px;
        }
        #rightTop{
            margin-top: 20px;
            width: 100%;
            height: 60px;
        }
        #searchTop{
            display: flex;
            flex-flow: row;
        }
        #searchTop div{
            margin-right: 5px;
            border-color: gainsboro;
        }
        .qnaSearch{
            width: 300px;
            height: 35px;
            border-radius:3px;
            border-color: gainsboro;
        }
        i{
            cursor: pointer;
        }
        select{
            width:200px;
            padding:5px;
            border:1px solid #999;
            border-radius:3px;
            appearance : none;
        }
        #date{
            width: 200px;
            height: 35px;
        }
        #rightBody{
            position: relative;
            height: 600px;
        }
        
        
       
        /*마지막 부분*/
        #lastWrap{
            position: relative;
            width: 1176px;
            margin: 0 auto;
        }
        #last{
            position: absolute;
            width: 100%;
        }
      
        
        #write{
            position: absolute;
            right: 0;
            width: 100px;
            height: 30px;
            bottom: 5px;
            background-color: black;
            color: whitesmoke;
            border-radius: 3px;
        }
        #qnaPageNum{
            position: absolute;
            width: 100%;
            text-align: center;
        }

        /*테이블*/
        table{
            width: 100%;
            border-collapse: collapse;
        }
        tr{
            height: 100px;
            border-bottom: 1px solid rgb(221, 221, 221);
        }
        td{
            padding: 10px;
        }
        td:nth-child(1){
            width: 10px;
        }
        td:nth-child(2){
            width: 450px;
            cursor: pointer;
        }
        td:nth-child(3){
            width: 100px;
        }
        td:nth-child(4){
            width: 10px;
            width: 200px;
        }
        a{
           text-decoration-line: none;
         cursor: pointer;
         color: black;
        }
        .num{
           display: inline-block;
           border: 1px solid rgb(221, 221, 221);
           width: 30px;
           height: 30px;
        }
        
    </style>
</head>
<body>
    <jsp:include page="top.jsp"/>

<% 
   String id = request.getParameter("id"); 
   UsersDto usersDto = (UsersDto)session.getAttribute("userInfo");
   String qnaSearch = request.getParameter("qnaSearch");
   if(qnaSearch == null){
      qnaSearch = "";
   }
%>


   <div id="wrap">
        <div id="leftMenu">
            <div>고객센터</div>
            <div>Q&A</div>
            <div>공지사항</div>
            <div>이벤트</div>
            <div>실시간 리뷰</div>
            <div>1:1 문의하기</div>
            <div>내가 쓴 게시글</div>
            <div>입고 일정 안내</div>
            <div>오프라인 스토어</div>

        </div>


        <div id="rightMain">
            <div class="rightTitle">Q&A</div>
            <div id="rightTop">
                <div id="searchTop">
                    <!-- <div class="selOpt">
                        <select id="date" name="date">
                            <option value="week">일주일</option>
                            <option value="month">한달</option>
                            <option value="3month">세달</option>
                            <option value="all">전체</option>
                        </select>
                    </div> -->
                    
                    <!-- 검색 form -->
                    <form action="Qna.do" method="post">
                    <!-- <div class="selOpt">
                        <select name="item">
                            <option value="title">제목</option>
                            <option value="content">내용</option>
                            <option value="id">아이디</option>
                        </select>
                    </div> -->
                    <div>
                        <input type="text" id="qnaSearch" name="qnaSearch" value="<%=qnaSearch%>">
                        <button><i class="fa fa-search"></i></button>
                    </div>
                    </form>
                    

                </div>
            </div>

            <div id="rightBody">
                <div id="qnaList"> 
                   <table border="0">
                  <!--<tr>
                     <td>글번호</td>
                     <td>글제목</td>
                     <td>아이디</td>
                     <td>날짜</td>
                  <tr>-->
                  <c:forEach var="dto" items="${qnaList}"> 
                  <tr>
                     <td>${dto.qnaNum}</td>
                     <td><a href="QnaRead.do?qnaNum=${dto.qnaNum}">${dto.title}</a></td>
                     <td>${dto.id}</td>
                     <td>${dto.qdate}</td>
                  </tr>
                  </c:forEach>
                   </table>
                </div>
            </div>
        </div>
    </div>


    <!--마지막 부분-->
    <div id="lastWrap">
        <div id="last">
            <div><input type="button" id="write" value="글쓰기" onclick="location.href='QnaWrite.do'"></div>
            <div id="qnaPageNum">
            <c:forEach var="i" begin="1" end="${pageCount}" step="1">
            	<c:choose>
                        <c:when test="${requestScope.pageData.pageNum eq i}">
                           <span style="border: 1px solid black;"><div class="num">${ i }</div></span>
                        </c:when>
                        <c:otherwise>
                           <a href="Qna.do?pageNum=${ i }" style="color:gray"><div class="num">${ i }</div></a>
                        </c:otherwise>
            	</c:choose>
				
			</c:forEach>
                <%-- <c:if test="${requestScope.pageData.nowPage gt 1}">
                     <!--<a href="Qna.do?nowPage=1"><div class="num">&lt;&lt;</div></a>-->
                     <a href="Qna.do?nowPage=${requestScope.pageData.nowPage-1}&qnaSearch=<%=qnaSearch%>"><div class="num">&lt;</div></a>
                  </c:if>
                  
                  <c:forEach var="i" begin="${requestScope.pageData.startPage}" end="${requestScope.pageData.endPage}">
                     <c:choose>
                        <c:when test="${requestScope.pageData.nowPage eq i}">
                           <span style="border: 1px solid black;"><div class="num">${ i }</div></span>
                        </c:when>
                        <c:otherwise>
                           <a href="Qna.do?nowPage=${ i }&qnaSearch=<%=qnaSearch%>" style="color:gray"><div class="num">${ i }</div></a>
                        </c:otherwise>
                     </c:choose>
                  </c:forEach>
                  
                  <c:if test="${requestScope.pageData.nowPage lt requestScope.pageData.totalPage}">
                     <a href="Qna.do?nowPage=${requestScope.pageData.nowPage+1}&qnaSearch=<%=qnaSearch%>"><div class="num">&gt;</div></a>
                     <!--<a href="Qna.do?nowPage=${requestScope.pageData.totalPage}"><div class="num">&gt;&gt;</div></a>-->
                  </c:if> --%>
            </div>
        </div>
    </div>

<jsp:include page="footer.jsp"/>
</body>
</html>