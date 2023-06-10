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
	                <th>적립금</th>
	                <th>주문금액</th>
	            </tr>
	        </thead>
	        <tbody>

	            <tr>
	                <td><input type="checkbox"></td>
	                <td>
	                    <div class="productArea">
	                        <div>
	                            <img src="image/best1.png">
	                        </div>
	                        <div>
	                            상품명
	                        </div>
	                    </div>
	                </td>
	                <td>
	                    <div>
	                        <table class="quantityArea">
	                            <tr>
	                                <td><button class="down" onclick="minus();">-</button></td>
	                                <td><input type="text" value="1" class="quantity"></td>
	                                <td><button class="up" onclick="plus();">+</button></td>
	                            </tr>
	                        </table>
	                    </div>
	                </td>
	                <td>
	                    <div class="point">
	                        <span>670</span>
	                        <span>원</span>
	                    </div>
	                </td>
	                <td>
	                    <div>
	                        <span class="price">6700</span>
	                        <span>원</span>
	                    </div>
	                </td>
	            </tr>

				

	        </tbody>
	    </table>

	</div>

	<button class="deleteButton">선택상품 삭제</button>

	<div class="orderArea">
	    <div>총 주문 상품 <span>??</span>개</div>
	    <div>
	        <table class="priceInformation">
	            <thead>
	                <tr>
	                    <td><span>20100</span>원</td>
	                    <td>+</td>
	                    <td>3000원</td>
	                    <td>=</td>
	                    <td><span>23100</span>원</td>
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
	        <div><button>구매하기</button></div>
	        <div><a href="">계속 쇼핑하기</a></div>
	    </div>
	</div>
</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>