<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>장바구니</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/cart/cart.css?after">
    <script type="text/javascript" src="/resources/fo/js/cart/cart.js?after"></script>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>


<div id="container">
	<div class="title">
		<div style="width: 8px; height: 35px; margin-right: 8px; background-color: #19a7ce"></div>
		<h1 style="margin: 0;">장바구니</h1>
	</div>
	<div class="list">

		<table class="cartList">

			<thead>
				<tr>
					<th width="50"><input type="checkbox" id="allCheck" onclick="allCheck();"></th>
					<th width="700">상품 정보</th>
					<th width="50">수량</th>
					<th>상품금액</th>
					<th>주문금액</th>
				</tr>
				<input type="hidden" id="memberId" value="${ loginUser.memberId }">
			</thead>
			<tbody>

			</tbody>
		</table>

	</div>

	<button class="deleteButton" onclick="deleteCart();">선택상품 삭제</button>

	<div class="orderArea">
		<div>총 주문 상품 <span></span>개</div>
		<div>
			<table class="priceInformation">
				<thead>
					<tr>
						<td><span class="productTotal"></span>원</td>
						<td>+</td>
						<td>3000원</td>
						<td>=</td>
						<td><span class="total"></span>원</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>상품금액</td>
						<td></td>
						<td>배송비</td>
						<td></td>
						<td>총 주문금액</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="buttonArea">
			<div><button onclick="order()">구매하기</button></div>
			<div><a href="">계속 쇼핑하기</a></div>
		</div>
		<!-- 주문 form -->
		<form action="payment.pa" method="post" class="order_form">

		</form>
	</div>
</div>

<!--
<script>
/* 주문 페이지 이동 */
$(".order_btn").on("click", function() {

	let form_contents = '';
	let orderNumber = 0;

	console.log("??");

	$(".quantityArea").each(function(index, element){

		console.log("이건되나");

		if($(".cartList tbody").find("input[type='checkbox']").is(":checked") === true) { //체크여부

			let productNo = $(element).children().children().find("input[type=hidden]").val();
			let amount = $(element).children().children().children().find(".amount").val();

			console.log("productNo = " + productNo);
			console.log("amount = " + amount);

			let productNo_input = "<input name='orders[" + orderNumber + "].productNo' type='hidden' value='" + productNo + "'>";
			form_contents += productNo_input;

			let amount_input = "<input name='orders[" + orderNumber + "].amount' type='hidden' value='" + amount + "'>";
			form_contents += amount_input;

			orderNumber += 1;

			console.log("form_contents = " + form_contents);

		}
	});

	if(form_contents != null) {


		$(".order_form").html(form_contents);
		// $(".order_form").submit();

	} else {
		alert("구매하실 상품을 선택해주세요.");
	}

});
</script>
 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>