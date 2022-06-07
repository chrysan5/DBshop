
<%@page import="com.company.shop.productbean.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>

    <style>
        *,html,body{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        #wrap{
            width: 1024px;
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Robonto,
             Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            margin: 0 auto;
            display: flex;
            justify-content: space-between;
        }
        #wrap>div{
            border: 1px solid black;
        }


        #leftImg{
            width: 500px;
            height: 600px;
        }
        #leftImg img{
            width: 100%;
            height: 100%;
        }
        #rightMain{
            width: 500px;
            height: 600px;
        }
        #rightMain input[type="button"]{
        	display: inline-block;
        }
        #num > *{
        	display: inline-block;
        	font-size: 20px;
            padding-bottom: 10px;
        }
        #num input[type="button"]{
        	width: 25px;
        	height: 25px;
		    border: 1px solid black;
        	background-color:white;
            cursor: pointer;
            border-radius: 3px;
            box-shadow: 2px 2px 2px 1px gainsboro;
        }
        .prReadBtn{
        	padding: 10px;
		    background-color:#282828;  
		    color: white;  
        }
        #title{
            width: 100%;
        	font-size: 23px;
            height: 40px;
            background-color: #f9f9f9; 
            margin-bottom: 15px;
        }
        #price{
            margin-bottom: 15px;
            width: 100%;
            font-size: 18px;
            font-weight: bold;
            height: 40px;
            background-color: #f9f9f9; 
        }
        #spec{
            width: 100%;
            color: rgb(214, 214, 214);
            height: 150px;
            background-color: #f9f9f9;
            margin-bottom: 15px;
        }
        #content{
        	width:100%;
        	height: 170px;
            background: #f9f9f9; 
            margin-bottom: 15px;
        }
        .specDiv1{
            width: 100px;
            margin-bottom: 5px;
            display: inline-block;
        }
        .specDiv2{
            display: inline-block;
            width: 390px;
        }
        input[type="submit"]{
            width: 240px;
            height: 50px;
            margin-left: 5px;
            cursor: pointer;
            border-radius: 3px;
            font-weight: bold;
        }
        #num{
            border-bottom: 3px dotted black;
            padding-bottom: 25px;
            margin-bottom: 25px;
        }
    </style>
</head>
<body>
<%-- <%
	ProductDto productDto = (ProductDto)request.getAttribute("productData");
%> --%>
<jsp:include page="top.jsp"/>
	<div id="wrap">
	<c:forEach var="dto" items="${productData}">
        <div id="leftImg">
            <img src="resources/img/${dto.image }">
        </div>
		<form name="frm">
        <div id="rightMain">
            <div id="title">${dto.name }</div>
            <div id="price">${dto.price }</div>
            <div id="spec">
                <div class="specDiv1">적립금</div><div class="specDiv2"> 430원 적립 </div>
                <div class="specDiv1">카드혜택</div><div class="specDiv2"> 무이자 할부 카드 안내 </div>
                <div class="specDiv1">배송비</div><div class="specDiv2"> 2,500원(50,000원 이상 구매 시 무료)</div>
                <div class="specDiv1"></div><div class="specDiv2">배송비 절약상품 보기> </div>
            </div>
            <div id="content">${dto.contents }</div>
            <div id="num"><div>수량 : </div>
            	&nbsp&nbsp<input type="button" id="downBtn" value="-" onclick='count("minus")'>
            	&nbsp
            	<input type="hidden" name="quantity" id="quantity">
            	<div id="result" name="num"> 1 </div>
            	&nbsp
            	<input type="button" id="upBtn" value="+" onclick='count("plus")'>
            </div>
            <input type="submit" value="장바구니" class="prReadBtn"  onclick="cart()">
            <input type="submit" value="구매" class="prReadBtn" onclick="order()">
            <input type="hidden" name="productNum" value="${dto.productNum }">
        </div>
        </form>
		</c:forEach>
    </div>
    
    
    <script>
    function cart() {
    	const total = document.getElementById("result");
		document.getElementById("quantity").value = total.innerText;
		frm.action="CartProc.do";
	}
    function order() {
    	const total = document.getElementById("result");
		document.getElementById("quantity").value = total.innerText;
		frm.action="OrderPage.do";
	}
    function count(type)  {
        // 결과를 표시할 element
        const resultElement = document.getElementById('result');
        
        // 현재 화면에 표시된 값
        let number = resultElement.innerText;
        
        // 더하기/빼기
        if(type === 'plus') {
            number = parseInt(number) + 1;
        }else if(type === 'minus')  {
        	if(number>1){
        		number = parseInt(number) - 1;	
        	}
        }
        // 결과 출력
        resultElement.innerText = number;
    }

    
    </script>
    <jsp:include page="footer.jsp"/>
</body>
</html>