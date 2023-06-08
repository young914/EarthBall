<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <!-- css -->
    <link rel="stylesheet" href="/resources/fo/css/payment/paymentCompleteView.css">

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<div id="container">
    <div id="title">
        <div id="title_1">
            <div id="bar_1"></div>
            <div id="title_text">결제완료</div>
        </div>
    </div>

    <div id="content">
        <div id="content1">
            <table>
                <tr>
                    <td colspan="2" width="50%" height="40" style="padding-left : 40px;">
                        <span>주문번호</span>
                        <span id="orderNumber">${ paymentNo }</span>
                    </td>
                    <th style="width : 20%; border-left : none;">주문수량</th>
                    <th style="width : 28%; border-left : none;">결제금액</th>
                </tr>
                <tr>
                    <td width="15%" height="120">
                        <div id="product_img">
                            <img src="/resources/fo/img/best1.png" alt="상품이미지" width="100%" height="100%">
                        </div>
                    </td>
                    <td style="border-left : none;">
                        <div id="product_name">
                            상품명 ~~~~~~~~~~~~
                        </div>
                    </td>
                    <td>
                        <div id="product_amount">
                            1
                        </div>
                    </td>
                    <td rowspan="3">
                        <div id="product_totalPrice">
                            33,000원
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="15%" height="120">
                        <div id="product_img">
                            <img src="/resources/fo/img/best1.png" alt="상품이미지" width="100%" height="100%">
                        </div>
                    </td>
                    <td style="border-left : none;">
                        <div id="product_name">
                            상품명 ~~~~~~~~~~~~
                        </div>
                    </td>
                    <td>
                        <div id="product_amount">
                            1
                        </div>
                    </td>
                </tr>
                <tr>
                    <td width="15%" height="120">
                        <div id="product_img">
                            <img src="/resources/fo/img/best1.png" alt="상품이미지" width="100%" height="100%">
                        </div>
                    </td>
                    <td style="border-left : none;">
                        <div id="product_name">
                            상품명 ~~~~~~~~~~~~
                        </div>
                    </td>
                    <td>
                        <div id="product_amount">
                            1
                        </div>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <div id="total_product_amount">
                            <span>총 주문 상품 <span id="totalAmount">3</span> 개</span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div id="content2">
            <input type="button" id="goMain" onclick="location.href='/'" value="메인페이지로">
        </div>
    </div>
</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>