<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#container{
            width: 1200px;
            height: 3000px;
            margin: 0 auto;
            padding-top: 170px;
            /* background-color: aliceblue; */
        }

        #title {
            width : 100%;
            height : 130px;
            padding-top : 20px;
            /* border : 1px solid red; */
        }

        #title_1 {
            width : 250px;
            height : 70px;
            margin : 30px 0px 0px 15px;
            box-sizing : border-box;
            /* border : 1px solid red; */
            align-items : center;
            display : flex;
        }

        #title_text {
            width : 200px;
            height : 50px;
            font-size : 40px;
            font-weight : bold;
            padding : 0px 0px 7px 10px;
            /* border : 1px solid red; */
        }

        #content {
            width : 85%;
            margin: auto;
            /* border : 1px solid red; */
        }

        #content1 {
            width : 100%;
            /* border : 1px solid red; */
        }

        #content1>table {
            width : 100%;
            border-top : 1px solid #444444;
            border-collapse: collapse;
        }

        #content1>table th, #content1>table td {
            border-bottom: 1px solid #444444;
            border-left : 1px solid #444444;
        }

        #content1>table th:first-child , #content1>table td:first-child {
            border-left : none;
        }

        #content1 span {
            font-size : 18px;
            font-weight : 500;
        }

        #content1 th {
            font-size : 18px;
            font-weight : 500;
        }

        #content2 {
            width : 330px;
            margin : auto;
            padding-top : 40px;
            margin-bottom : 100px;
            /* border : 1px solid red; */
        }

        #bar_1 {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

        #product_img {
            width : 70%;
            height : 70%;
            margin : auto;
        }

        #product_name {
            font-size : 18px;
            padding-left : 30px;
        }

        #product_amount {
            font-size : 20px;
            font-weight : bold;
            text-align : center;
        }

        #product_totalPrice {
            font-size : 20px;
            font-weight : 600;
            color : #19A7CE;
            text-align : center;
        }

        #total_product_amount {
            width : 100%;
            height : 40px;
            line-height : 40px;
            padding-left : 20px;
        }

        #totalAmount {
            color: #19A7CE;
            font-weight : bold;
        }

        #goMain {
            width : 330px;
            height : 50px;
            font-size : 20px;
            color : white;
            background-color : #19A7CE;
            border-style: none;
            border-radius : 30px;
        }

        #goMain:hover {
            cursor : pointer;
            background-color : #146C94;
        }
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/common/header.jsp"/>

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
                    <tr >
                        <td colspan="2" width="50%" height="40" style="padding-left : 40px;">
                            <span>주문번호</span>
                            <span>2023050000001</span>
                        </td>
                        <th style="width : 20%; border-left : none;">주문수량</th>
                        <th style="width : 28%; border-left : none;">결제금액</th>
                    </tr>
                    <tr>
                        <td width="15%" height="120">
                            <div id="product_img">
                                <img src="/resources/peng.jpg" alt="상품이미지" width="100%" height="100%">
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
                                <img src="/resources/peng.jpg" alt="상품이미지" width="100%" height="100%">
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
                                <img src="/resources/peng.jpg" alt="상품이미지" width="100%" height="100%">
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

        <jsp:include page="/WEB-INF/jsp/common/footer.jsp"/>

</body>
</html>