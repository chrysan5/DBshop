
<%@page import="com.company.shop.usersbean.UsersDto"%>
<%@page import="com.company.shop.productbean.ProductDto"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
.checkout-full-box {
	width: 100%;
	height: auto;
}

.checkout-bg-color {
    background-color: #f9f9f9;
    width: 100%;
    height: 100%;
   	padding-bottom: 200px;
   	margin-bottom: -200px;
}

.checkout-full-wrp {
	max-width: 1440px;
    width: 100%;
    margin: 0 auto !important;
    padding: 0;
    font-family: 'Galano Grotesque',"Apple SD Gothic Neo","Noto Sans KR","Helvetica Neue",sans-serif;
    font-size: 13px;
    line-height: 1.2;
    color: #444;
}

.checkout-header-wrp {
    overflow: hidden;
    display: -ms-flexbox;
    display: -webkit-flex;
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin: 0 auto;
    padding: 100px 0 90px;
}

.checkout-info-wrp {
	position: relative;
	width: 100%;
	height: auto;
	margin: 0 auto;
}



.checkout-wrp-left {
	padding-right: calc(46.9% - 24px);
}

.checkout-wrp-right {
	position: fixed;
	top: 43%;
	left: calc(53.1% + 42px);
    width: calc(53.1% - 42px);
}

.left-section-delivery-info {
	width: auto;
}

.left-section-box {
	margin: 0px 0px 10px;
	padding: 80px;
	background-color: white;
}

.delivery-condition {
	position: relative;
	padding-bottom: 40px;
}

.delivery-condition-name {
	display: flex;
	justify-content: space-between;
}

.delivery-condition-info {
	margin: 0;
	padding: 0;
	list-style: none;
	display: block;
}

.delivery-request {
	margin: 25px 0 20px;
}

.btn-request {
	display: flex;
	align-items: center;
	justify-content: space-between;
	flex-direction: row;
	width: 100%;
	padding: 13px 12px 11px;
	text-align: left;
	background-color: #f9f9f9;
}

.btn-change-addr {
	position: absolute;
	top: 0;
	right: 0;
}

.left-section-btn {
    padding: 8px 9px 6px 8px;
    border: 1px solid rgb(221, 221, 221);
    background: rgb(255, 255, 255);
    cursor: pointer;
}

.delivery-user {
	position: relative;
    padding: 40px 0 0;
    border-top: 1px solid #ececec;
}

.delivery-user-info {
	margin: 0;
	padding: 0;
	list-style: none;
}

.info-type {
	display: inline-block;
	width: 50px;
	margin-right: 10px;
    font-size: 13px;
    font-weight: normal;
    color: #999;
}

.info-value {
    font-weight: normal;
    color: #555;
}

.btn-change-order {
	position: absolute;
    top: 40px;
    right: 0;
    padding: 8px 9px 6px 8px;
    border: 1px solid #ddd;
}

.section-order-info {
	width: auto;
}

.order-prod-list {
    margin: 0;
    padding: 0;
    border-bottom: 1px solid #111;
    list-style: none;
}

.order-prod-info {
	display: flex;
    justify-content: flex-start;
    align-items: center;
    flex-direction: row;
    padding: 40px 0 40px 20px;
    border-top: 1px solid #ececec;
}

.order-prod-img-a {
	width: 80px;
    display: block;
    position: relative;
    overflow: hidden;
    padding-top: 106px;
}

.order-prod-img-span {
    display: block;
    position: absolute;
    inset: 0px;
    transform: translate(50%, 50%);
}

.order-prod-img-span > img {
    max-width: 100%;
    max-height: 100%;
    width: 100%;
    height: auto;
    object-fit: contain;
    position: absolute;
    top: 0px;
    left: 0px;
    transform: translate(-50%, -50%);
}

.order-prod-text {
	display: flex;
	width: 100%;
    justify-content: flex-start;
    align-items: flex-start;
    flex-direction: column;
    margin-left: 25px;
}

.prod-brand {
	margin: 0 0 10px;
}

.prod-name {
	margin: 0 0 10px;
    width: 100%;
    overflow: hidden;
    text-overflow: ellipsis;
    line-height: 1.6;
    text-decoration: none;
}

.order-price-text {
    margin: 0;
    padding-top: 25px;
    display: flex;
    justify-content: flex-start;
    align-items: flex-end;
    flex-direction: column;
}

.price-unit {
	margin-left: 3px;
}

.checkout-middle-toolTip {
	outline: none;
	background: none;
	border: none;
}

.checkout-middle-toolTip:focus {
	outline: none;
	border: none;
}

.section-payment-info {
	width: auto;
}

.section-payment-info-title {
	border-bottom: 1px solid #ececec;
	padding-bottom: 20px;
}

.payment-type-list {
	padding: 20px 0;
	margin: 0;
	list-style: none;
}

.right-section-info {
	max-width: 634px;
	width: auto;
	margin: 0;
	margin-right: 70px;
}

.right-section-price-info {
	background-color: white;
	position: relative;
	margin-right: 70px;
	padding: 80px;
}

.expected-price-list {
	padding: 20px 0;
	margin: 0;
	list-style: none;
}

.expected-price-item {
	margin: 0;
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.total-expected-price {
    margin-top: 20px;
    margin-bottom: 100px;
    padding-top: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    border-top: 1px solid #ececec;
}

.btn-order {
	width: 100%;
	position: absolute;
	bottom: 0;
	left: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 80px;
	background-color:lightgray;
	border: none;
	cursor: pointer;
	
}

.modal-change-addr {
	background-color: white;
	width: 520px;
	height: 680px;
	position: relative;
    padding: 110px 0px 0px;
}

.mh-modal-header {
    position: absolute;
    top: 0px;
    left: 0px;
    width: 100%;
    max-width: 520px;
    height: 110px;
    padding: 40px;
    display: flex;
    align-items: center;
    flex-direction: row;
    justify-content: flex-start;
}

.mh-modal-body-wrap {
	max-height: 490px;
    width: 100%;
    overflow: auto;
}

.mh-modal-body {
    overflow: hidden auto;
    position: relative;
    display: flex;
    align-items: center;
    justify-content: flex-start;
    flex-direction: column;
    width: 100%;
    height: 490px;
    padding: 0px 40px 20px;
    margin: 0px 0px 80px;
}

.delivery-modal-info-list {
    width: 100%;
    list-style: none;
    margin: 0;
    padding: 0;
    display: flex;
    display: -ms-flexbox;
    display: -webkit-flex;
    flex-direction: column;
    align-items: flex-start;
    justify-content: flex-start;
    border-bottom: none;
}

.mh-modal-sector {
	position: relative;
    margin-bottom: 20px;
    padding-bottom: 20px;
    border-bottom: 1px solid rgb(236, 236, 236);
}

.delivery-modal-info-item-title {
	padding: 14px 0 0 0;
    display: flex;
    align-items: flex-start;
    width: 85px;
}

	.delivery-modal-info-item-value {
    list-style: none;
    margin: 0;
    padding: 0;
    width: calc(100% - 85px);
}
</style>
</head>
<body>

<%
   UsersDto usersDto = (UsersDto)session.getAttribute("userInfo");
    if(usersDto == null) { // 로그인이 안됐다면
%> 
	<script>
		alert("로그인을 해주세요.");
		location.replace("login.jsp");
	</script>
<%} %>
<jsp:include page="top.jsp"/>
<%
	ProductDto productDto = (ProductDto)request.getAttribute("productData");
	int quantity = Integer.parseInt(request.getParameter("quantity"));
%>
<div class="checkout-full-box">
<div class="checkout-bg-color">
<div class="checkout-full-wrp">
<c:set var="prodPriceAll" value="0" />
	<!-- 상단박스 시작 -->
	<div class="checkout-header-wrp">
		<div style="font-weight: bolder; font-size: xx-large; height: 50px;">배송/결제</div>
	</div>
	<!-- 상단박스 끝 -->
	<!-- 하단박스 시작 -->
	<div class="checkout-info-wrp">
		<!-- 하단좌측박스 시작 -->
		<div class="checkout-wrp-left">
			<!-- 배송/주문자 정보 시작 -->
			<div class="left-section-delivery-info left-section-box">
				<h3 class="f20-bd-333 mgb20">배송 정보</h3>
				<div class="delivery-condition">
					<div class="delivery-condition-name">
						<h3 class="f25-bd-333" id="name">${userInfo.name}</h3>
					</div>
					<ul class="delivery-condition-info">
						<li class="f13-777 mgt10">${userInfo.address}</li>
						<li class="f13-777 mgt10">${userInfo.phone}</li>
					</ul>
					<h4 class="f15-bd-333 delivery-request">배송 요청사항</h4>
					<input type="text" class="btn-v2 f13-555 btn-request" placeholder="입력해 주세요."/>
				</div>
				<div class="delivery-user">
					<h3 class="f20-bd-333 mgb20">주문자 정보</h3>
					<ul class="delivery-user-info">
						<li class="mgb10">
							<span class="info-type">이름</span>
							<strong class="info-value">${userInfo.name}</strong>
						</li>
						<li class="mgb10">
							<span class="info-type">연락처</span>
							<strong class="info-value">${userInfo.phone}</strong>
						</li>
						<li class="mgb10">
							<span class="info-type">이메일</span>
							<strong class="info-value">${userInfo.email}</strong>
						</li>
					</ul>
				</div>
			</div>
			<!-- 배송/주문자 정보 끝 -->
			<!-- 배송 상품 시작 -->
			<div class="section-order-info left-section-box">
				<h3 class="f20-bd-333 mgb20">배송 상품</h3>
					<input type="hidden" class="check-out-box-prodId-for-js"/>
					<ul class="order-prod-list">
						<li class="order-prod-info">
							<div class="order-prod-img">
								<a class="order-prod-img-a">
									<span class="order-prod-img-span">
										<img src="resources/img/<%=productDto.getImage()%>">
									</span>
								</a>
							</div>
				
				
							<div class="order-prod-text">
								<strong class="prod-name f13-bd-333 mgb10"><%=productDto.getName()%></strong>
								<strong class="prod-price f18-bd-333">가격 : <%=productDto.getPrice() %></strong>
								<strong class="prod-price f18-bd-333">수량 : <%=quantity %></strong>
							</div>
						</li>
					</ul>
				<div class="order-price-text">
					
					<strong class="f15-bd-purple">
						합계 : <span class="price-unit"><%=productDto.getPrice() * quantity%>원</span>
					</strong>
				</div>
			</div>
			<!-- 배송 상품 끝 -->
			<!-- 결제 수단 시작 -->
			<div class="section-payment-info left-section-box">
				<h3 class="section-payment-info-title f20-bd-333">결제수단</h3>
				<ul class="payment-type-list">
					<li class="payment-type-item mgb10">
						<input type="radio" name="pay-type-item" value="mutong" />
						<span class="mgl5">무통장 입금</span>
					</li>
					<li class="payment-type-item mgb10">
						<input type="radio" name="pay-type-item" value="card" />
						<span class="mgl5">카드결제</span>
					</li>
				</ul>
			</div>
			<!-- 결제 수단 끝 -->
		</div>
		<!-- 하단좌측박스 끝 -->
		<!-- 하단우측박스 시작 -->
		<div class="checkout-wrp-right">
			<div class="right-section-info">
				<div class="right-section-price-info">
					<h3 class="mgb20 f20-bd-333">결제 금액</h3>
					<ul class="expected-price-list">
						<li class="expected-price-item mgb10">
							<span class="f15-aaa expected-price-title">총 상품 금액</span>
							<strong class="f18-333 expected-price-value"><%=productDto.getPrice() * quantity%> 원</strong>
						</li>
					</ul>
					<p class="f15-aaa total-expected-price">
						<span class="f15-aaa total-expected-price-title">총 결제 예상 금액</span>
						<strong class="f18-333 expected-price-value"><%=productDto.getPrice() * quantity%> 원</strong>
					</p>
					<form action="OrderConf.do" method="post">
						<input type="hidden" name="prodnum" value="<%=productDto.getProductNum() %>">
						<input type="hidden" name="quantity" value="<%=quantity %>">
						<button class="f18-bd-fff btn-order" type="submit">주문 완료하기</button>
					</form>
					
				</div>
			</div>
		</div>
		<!-- 하단우측박스 끝 -->
	</div>
</div>
</div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>