<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
        #wrap div{
            border: 1px solid black;
        }


        #leftList{
            width: 800px;
        }
        #leftList div{
            width: 100%;
            height: 120px;
        }


        #rightOrder{
            width: 224px;
            height: 600px;
        }
        #rightOrder div{
            width: 100%;
            height: 50px;
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

        #orderInfo{
            width: 1024px;
        }
        #orderWrap{
            display: flex;
            flex-flow: row wrap;
        }
        .orderInfoDiv{
            display: flex;
            flex-flow: row;
            border: 1px solid red;
        }
        .orderInfoDiv div:nth-child(1){
            width: 100px;
            height: 50px;
        }
        .orderInfoDiv div:nth-child(2){
            width: 920px;
            height: 50px;
        }
        .orderInfoDiv input[type="text"],textarea{
            width: 920px;
            height: 50px;
        }

    </style>
</head>
<body>
<jsp:include page="top.jsp"/>

	<div id="wrap">
        <div id="leftList">
            <div style="font-weight: bolder; margin-bottom: 50px; font-size: xx-large;">�ֹ����ۼ�</div>
            <div style="height: 50px;">��ǰ��</div><hr>
            <div>����1</div>
            <div>����2</div>
        </div>

        <div id="rightOrder">
            <div>�������� �ݾ�</div>
            <div>�� ��ǰ�ݾ�</div>
            <div><input type="button" id="cancelBtn" value="�����ϱ�"></div>
        </div>

        <div id="orderInfo">
            <div style="width: 100%;">����� �����Է�</div>
            <hr>
            <div id="orderWrap">
                <div class="orderInfoDiv">
                    <div>�̸�</div>
                    <div><input type="text"></div>
                </div>
                <div class="orderInfoDiv">
                    <div>�ּ�</div>
                    <div><input type="text"> </div>
                </div>
                <div class="orderInfoDiv">
                    <div>�޴���ȭ</div> 
                    <div><input type="text"></div>
                </div>
                <div class="orderInfoDiv">
                    <div>��ۿ�û����</div>
                    <div><textarea name="req"></textarea></div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>