<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" integrity="sha384-UHRtZLI+pbxtHCWp1t77Bi1L4ZtiqrqD80Kn4Z8NTSRyMA2Fd33n5dQ8lWUE00s/" crossorigin="anonymous">
	<link rel="stylesheet" href="resources/css/basket.css" />
</head>
<body>
<jsp:include page="top.jsp"/>
<c:if test="${sessionScope.logindata == null}">
   <script>
        alert("�α����� �ʿ��� ������ �Դϴ�.");
        location.replace("Login.do");
    </script>    
    </c:if>
    
    <div style="width: 100%; text-align: center; font-size: 2em;">�ֹ� ���� Ȯ��</div><br><br>
    
            <input type="hidden" name="cmd" value="order">
            <div class="basketdiv" id="basket">
            <form name="orderform" id="orderform" method="get" class="orderform" >
                <div class="row head">
                    <div class="subdiv">
                        <div class="check">�ֹ���ȣ</div>
                        <div class="img">�̹���</div>
                        <div class="pname">��ǰ��</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">����</div>
                        <div class="num">�հ�</div>
                        <div class="sum">��ۿ���</div>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">������</div>
                    </div>
                    <div class="split"></div>
                </div>
                	<c:if test="${empty requestScope.orderData }">
                		<div style="text-align: center;width: 100%;">�ֹ� ������ �����ϴ�.</div>
                	</c:if>
        			<c:forEach var="dto" items="${ requestScope.orderData }">
        				<c:forEach var="dto2" items="${ requestScope.productData }">
        					<c:if test="${dto.prodnum eq dto2. productNum}">
                <div class="row data">
                    <div class="subdiv">
                        <div class="check">${dto.orderNum }</div>
                        <div class="img" style="padding-top: 2px;"><img src="resources/img/${dto2.image }" width="60"></div>
                        <div class="pname">
                            <span>${dto2.name }</span>
                        </div>
                    </div>
                    <div class="subdiv">
                        <div class="basketprice">${ dto.quantity }</div>
                        <div class="num">
                            <div class="quantity">
                                <%-- <input type="text" name="p_num1" id="p_num1" size="2" maxlength="4" class="p_num" value="${ dto.quantity }" readonly> --%>
                                ${dto.quantity * dto2.price }��
                            </div>
                        </div>
                        <c:if test="${dto.result eq '1'}">
                        	<div>����غ���</div>
                        </c:if>
                        <c:if test="${dto.result eq '2'}">
                        	<div>��ۿϷ�</div>
                        </c:if>
                        <%-- <div class="sum">${dto.quantity * dto2.price }��</div> --%>
                    </div>
                    <div class="subdiv">
                        <div class="basketcmd">${dto.orderDate }</div>
                    </div>
                </div>
                			</c:if>
                		</c:forEach>
                	</c:forEach>
    			</form>
           </div>
        
<script>
let basket = {
	    totalCount: 0, 
	    totalPrice: 0,
	    //����
	    reCalc: function(){
	        this.totalCount = 0;
	        this.totalPrice = 0;
	        document.querySelectorAll(".p_num").forEach(function (item) {
	            if(item.parentElement.parentElement.parentElement.previousElementSibling.firstElementChild.firstElementChild.checked == true){
	                var count = parseInt(item.getAttribute('value'));
	                this.totalCount += count;
	                var price = item.parentElement.parentElement.previousElementSibling.firstElementChild.getAttribute('value');
	                this.totalPrice += count * price;
	            }
	        }, this); // forEach 2��° �Ķ���ͷ� ��ü�� �Ѱܼ� this �� ��ü���ͷ��� ����Ű���� ��. - thisArg
	    },
	    //ȭ�� ������Ʈ
	    updateUI: function () {
	        document.querySelector('#sum_p_num').textContent = '��ǰ����: ' + this.totalCount.formatNumber() + '��';
	        document.querySelector('#sum_p_price').textContent = '�հ�ݾ�: ' + this.totalPrice.formatNumber() + '��';
	    },
	    checkItem: function () {
	        this.reCalc();
	        this.updateUI();
	    },
	    selDeleteCart: function(){
	    	orderform.action="SelDeleteCart.do"
	    },
	    cartOrder: function(){
	    	if(this.totalPrice.formatNumber()==0){
	    		alert("��ǰ�� üũ�� �ּ���.");
	    	}else{
	    		orderform.action="CartOrder.do"
	    	}
	    }
	}

	// ���� 3�ڸ� �޸����
	Number.prototype.formatNumber = function(){
	    if(this==0) return 0;
	    let regex = /(^[+-]?\d+)(\d{3})/;
	    let nstr = (this + '');
	    while (regex.test(nstr)) nstr = nstr.replace(regex, '$1' + ',' + '$2');
	    return nstr;
	};
	
</script>

</body>
</html>