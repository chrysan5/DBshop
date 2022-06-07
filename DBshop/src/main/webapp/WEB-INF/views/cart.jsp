<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            display: flex;
            flex-flow: row wrap;
            margin: 0 auto;
        }
        

        #leftList{
            width: 800px;
        }
        #leftList > div{
            width: 100%;
            height: 120px;
            border-bottom: 1px solid black;
        }


        #rightOrder{
            width: 200px;
            height: 600px;
            
        }
        #rightOrder > div{
            width: 100%;
            height: 50px;
            border-bottom: 1px solid black;
        }
        .rigntTitle{
            width: 100%;
            height: 70px;
        }
        #rightTop{
            width: 100%;
            height: 150px;
            display: flex;
            flex-flow: row;
        }
		img{
			width: 100px;
			height: 90px;
		}
		input[type="button"]{
			background-color: white;
			border: 1px solid black;
		}
    </style>
</head>
<body>
<jsp:include page="top.jsp"/>

	<div id="wrap">
        <div id="leftList">
            <div style="font-weight: bolder; font-size: xx-large; height: 50px;">CART</div>
            <!-- <div style="height: 50px;">상품명</div><hr> -->
            <c:forEach var="dto" items="${ requestScope.cartData }">
            <div>
            	<input type="checkbox">카트번호 : ${dto.cartNum }<input type="button" value="바로주문하기">
                <input type="button" value="삭제하기" onclick="location.href='CartDelete.do?cartNum=${dto.cartNum }'"><br>
                <c:forEach var="dto2" items="${ requestScope.productData }">
                	<c:if test="${dto.prodnum eq dto2. productNum}">
                		<img src="img/${dto2.image }">
                		상품명 : ${dto2.name }
                		수량 : ${ dto.quantity }
                		가격 : ${dto.quantity * dto2.price }
                		카트 입력 날짜 : ${ dto.cartDate }
                	</c:if>
                </c:forEach>
				
            </div>
            </c:forEach>

        </div>

        <div id="rightOrder">
            <div>장바구니</div>
            <div style="height: 200px;">광고</div>
            <div>총 상품금액</div>
            <div>총 배송비</div><hr>
            <div>결제예정금액</div>
            <div><input type="button" id="cancelBtn" value="전체상품주문"></div>
            <div><input type="button" id="submitBtn" value="선택상품주문"></div>
        </div>
    </div>
    
</body>
</html>