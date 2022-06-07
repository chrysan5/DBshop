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
            <!-- <div style="height: 50px;">��ǰ��</div><hr> -->
            <c:forEach var="dto" items="${ requestScope.cartData }">
            <div>
            	<input type="checkbox">īƮ��ȣ : ${dto.cartNum }<input type="button" value="�ٷ��ֹ��ϱ�">
                <input type="button" value="�����ϱ�" onclick="location.href='CartDelete.do?cartNum=${dto.cartNum }'"><br>
                <c:forEach var="dto2" items="${ requestScope.productData }">
                	<c:if test="${dto.prodnum eq dto2. productNum}">
                		<img src="img/${dto2.image }">
                		��ǰ�� : ${dto2.name }
                		���� : ${ dto.quantity }
                		���� : ${dto.quantity * dto2.price }
                		īƮ �Է� ��¥ : ${ dto.cartDate }
                	</c:if>
                </c:forEach>
				
            </div>
            </c:forEach>

        </div>

        <div id="rightOrder">
            <div>��ٱ���</div>
            <div style="height: 200px;">����</div>
            <div>�� ��ǰ�ݾ�</div>
            <div>�� ��ۺ�</div><hr>
            <div>���������ݾ�</div>
            <div><input type="button" id="cancelBtn" value="��ü��ǰ�ֹ�"></div>
            <div><input type="button" id="submitBtn" value="���û�ǰ�ֹ�"></div>
        </div>
    </div>
    
</body>
</html>