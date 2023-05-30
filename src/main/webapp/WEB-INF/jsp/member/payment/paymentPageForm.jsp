<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EarthBall</title>
<!-- 카카오페이 script -->
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
            height : 150px;
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
            display : flex;
            width : 100%;
            height : 80%;

            box-sizing: border-box;
        }

        /* input type="number" 우측 버튼 삭제 */
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button{-webkit-appearance: none; margin: 0;}

        #content1 {
            width : 45%;
            height : 80%;
            margin : 0px 5px 0px 50px;
            /* border : 1px solid red; */
            flex-direction: column;
            box-sizing : border-box;
        }

        #content1 div, #content2 div { box-sizing : border-box; }

        #content1_1 {
            overflow : auto;
            /* border : 1px solid red; */
            flex-direction: column;
            box-sizing : border-box;
        }

        #content1_2 {
            width : 100%;
            height : 10%;
            margin-top : 20px;
            /* border : 1px solid red; */
        }

        #content1_3 {
            width : 100%;
            height : 25%;
            margin-top : 15px;
            /* border : 1px solid red; */
        }

        #content1_4 {
            width : 100%;
            height : 20%;
            margin-top : 20px;
            /* border : 1px solid red; */
        }

        #content1_1_1, #content1_3_1, #content1_4_1 {
            width : 100%;
            height : 10%;
            /* border : 1px solid red; */
        }

        #content1_1_2 {
            width : 100%;
            height : 30%;
            margin-top : 10px;
            /* border : 1px solid red; */
            display : flex;
        }

        #content1_1::-webkit-scrollbar {
            display: none;
        }

        #content1_2_1 {
            width : 100%;
            height : 20%;
            /* border : 1px solid red; */
        }

        #content1_2_2 {
            width : 100%;
            height : 100%;
            /* border : 1px solid red; */
        }

        #content1_2_2>table {
            width : 90%;
            height : 60%;
            margin : 20px 0px 0px 20px;
            font-size : 16px;
        }

        #content1_2_2 th {
            text-align : left;
            color : gray;
        }

        #content1_2_2 td {
            font-weight : 600;
        }

        #content1_3_2>table {
            width : 95%;
            /* border : 1px solid red; */
            margin : 20px 0px 20px 15px;
        }

        #content1_4_2 {
            width : 100%;
            height : 70%;
            /* border : 1px solid red; */
        }

        #content1_4_2>table {
            width : 100%;
            margin : 0px 0px 0px 20px;
        }

        #content1_4_2 span {
            font-size : 14px;
            font-weight : 600;
        }

        #content2 {
            width : 45%;
            height : 40%;
            margin : 0px 0px 0px 5px;
            /* border : 1px solid red; */
            flex-direction: column;
            position : sticky;
            top : 200px;
        }

        #content2_1 {
            width : 100%;
            height : 25%;
            background-color : #f1fcff;
            /* border : 1px solid red; */
        }

        #content2_1_1,#content2_2_1 {
            width : 100%;
            height : 10%;
            /* border : 1px solid red; */
        }

        #content2_1_2 {
            width : 100%;
            height : 50%;
            /* border : 1px solid red; */
        }

        #content2_1_2>table {
            width : 100%;
            margin-top : 20px;
            /* border : 1px solid red; */
        }

        #content2_1_3 {
            width : 100%;
            height : 20%;
            margin-top : 30px;
            background-color : rgb(235, 235, 235);
            /* border : 1px solid red; */
        }

        #content2_1_3>div {
            margin : 0px 0px 0px 20px;
            /* border : 1px solid red; */
        }

        #content2_1_3 span {
            font-size : 16px;
            font-weight : 600;
            line-height : 45px;
        }

        #content2_2 {
            width : 100%;
            height : 25%;
            background-color : #f1fcff;
            margin-top : 30px;
            /* border : 1px solid red; */
        }

        #content2_2_2 {
            width : 100%;
            height : 50%;
            /* border : 1px solid red; */
        }

        #content2_2_2>div {
            width : 100%;
            height : 25%;
            margin : 20px 0px;
            /* border : 1px solid red; */
        }

        #content2_2_2 input {
            width : 16px;
            height : 16px;
            margin : 15px 0px 0px 20px;
        }

        #content2_2_2 label {
            font-size : 18px;
            font-weight : 550;
            margin-left : 10px;
        }

        #content2_2_3 {
            width : 100%;
            height : 20%;
            /* border : 1px solid red; */
        }

        #content2_2 input:hover {
            cursor : pointer;
            background-color : #146C94;
        }

        #bar_1 {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

        #bar_2 {
            width : 130px;
            height : 6px;
            background-color : #146C94;
            margin : 0px 0px 0px 20px;
        }

        #img-area {
            width : 35%;
            height : 100%;
            /* border : 1px solid red; */
        }

        #product_img {
            width : 60%;
            height : 60%;
            margin : auto;
            /* margin-top : 25px; */
            /* border : 1px solid red; */
        }

        #product_content {
            width : 65%;
            /* height : 100%; */
            flex-direction: column;
            /* border : 1px solid red; */
            box-sizing : border-box;
        }

        #product_name, #product_count, #product_price {
            width : 100%;
            height : 20%;
            align-items : center;
            line-height : 20%;
            /* border : 1px solid red; */
            margin-top: 10px;
        }

        #product_name {
            font-size : 16px;
            font-weight : bold;
        }

        #product_amount {
            font-size : 14px;
            font-weight : 550;
            color : gray;
        }

        #product_price {
            font-size : 16px;
            font-weight : 700;
            color : #19A7CE;
        }

        #receiveName, #receivePhone {
            width : 210px;
            height : 26px;
            font-size : 16px;
            border : 1px solid #19A7CE;
            border-radius : 7px;
            margin : 10px 0px;
        }

        #postCode {
            width : 120px;
            height : 26px;
            font-size : 16px;
            border : 1px solid #19A7CE;
            border-radius : 7px;
            margin : 10px 0px;
        }

        #selectAddress {
            width : 80px;
            height : 30px;
            font-size : 16px;
            color : white;
            border : 1px solid #19A7CE;
            background-color : #19A7CE;
            border-radius : 7px;
            margin : 10px 0px 0px 5px;
            padding : 0px;
        }

        #selectAddress:hover, #selectCoupon:hover, #pointAll:hover {
            border : 1px solid #146C94;
            background-color : #146C94;
            cursor : pointer;
        }

        #address, #detailAddress {
            width : 455px;
            height : 26px;
            font-size : 16px;
            border : 1px solid #19A7CE;
            border-radius : 7px;
            margin : 10px 0px;
        }

        #deliveryMemo {
            width : 100%;
            height : 50px;
            /* border : 1px solid red; */
        }

        #deliveryMemo select:hover { cursor : pointer; }

        #deliveryMemo>select {
            width : 460px;
            height : 30px;
            font-size : 16px;
            color : gray;
            border : 1px solid #19A7CE;
            border-radius : 7px;
            margin : 10px 0px 10px 19px;
        }

        #coupon, #point {
            width : 200px;
            height : 26px;
            font-size : 16px;
            color : gray;
            border : 1px solid #19A7CE;
            border-radius : 7px;
            margin : 10px 0px;
        }

        #selectCoupon, #pointAll {
            width : 80px;
            height : 30px;
            font-size : 16px;
            color : white;
            border : 1px solid #19A7CE;
            background-color : #19A7CE;
            border-radius : 7px;
            margin : 10px 0px 0px 5px;
            padding : 0px;
        }

        #orderSummaryName {
            width : 50%;
            height : 30px;
            font-size : 18px;
            font-weight : 600;
            padding-left : 15px;
            color : gray;
        }

        #orderSummaryContent {
            width : 50%;
            font-size : 18px;
            font-weight : bold;
            text-align: right;
            padding-right : 20px;
        }

        #orderSummaryTotal-area {
            height : 60px;
            vertical-align : bottom;
        }

        #orderSummaryTotal {
            font-size : 18px;
            font-weight : bold;
            padding-left : 15px;
        }

        #payComplete {
            width : 100%;
            height : 100%;
            background-color : #19A7CE;
            font-size : 30px;
            margin-top : 35px;
            color : white;
            border : 0px;
        }
</style>
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/common/header.jsp"></jsp:include>

	<div id="container">
        <div id="title">
            <div id="title_1">
                <div id="bar_1"></div>
                <div id="title_text">결제하기</div>
            </div>
        </div>

        <div id="content">
            <div id="content1">
                <div id="content1_1">
                    <div id="content1_1_1">
                        <h2 style="margin : 0px 0px 0px 20px;">주문 상품 정보</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content1_1_2">
                        <div id="img-area">
                            <div id="product_img"><img src="/resources/peng.jpg" width="100%" height="100%" alt="상품이미지"></div>
                        </div>
                        <div id="product_content">
                            <div id="product_name"><p>[지구공] 베스트셀러</p></div>
                            <div id="product_amount"><p>수량 : 2개</p></div>
                            <div id="product_price"><p>11,000원</p></div>
                        </div>
                    </div>
                    <div id="content1_1_2">
                        <div id="img-area">
                            <div id="product_img"><img src="/resources/peng.jpg" width="100%" height="100%" alt="상품이미지"></div>
                        </div>
                        <div id="product_content">
                            <div id="product_name"><p>[지구공] 베스트셀러</p></div>
                            <div id="product_amount"><p>수량 : 2개</p></div>
                            <div id="product_price"><p>11,000원</p></div>
                        </div>
                    </div>
                    <div id="content1_1_2">
                        <div id="img-area">
                            <div id="product_img"><img src="/resources/peng.jpg" width="100%" height="100%" alt="상품이미지"></div>
                        </div>
                        <div id="product_content">
                            <div id="product_name"><p>[지구공] 베스트셀러</p></div>
                            <div id="product_amount"><p>수량 : 2개</p></div>
                            <div id="product_price"><p>11,000원</p></div>
                        </div>
                    </div>
                    <div id="content1_1_2">
                        <div id="img-area">
                            <div id="product_img"><img src="/resources/peng.jpg" width="100%" height="100%" alt="상품이미지"></div>
                        </div>
                        <div id="product_content">
                            <div id="product_name"><p>[지구공] 베스트셀러</p></div>
                            <div id="product_amount"><p>수량 : 2개</p></div>
                            <div id="product_price"><p>11,000원</p></div>
                        </div>
                    </div>
                    <div id="content1_1_2">
                        <div id="img-area">
                            <div id="product_img"><img src="/resources/peng.jpg" width="100%" height="100%" alt="상품이미지"></div>
                        </div>
                        <div id="product_content">
                            <div id="product_name"><p>[지구공] 베스트셀러</p></div>
                            <div id="product_amount"><p>수량 : 2개</p></div>
                            <div id="product_price"><p>11,000원</p></div>
                        </div>
                    </div>
                </div>
                <div id="content1_2">
                    <div id="content1_2_1">
                        <h2 style="margin : 0px 0px 0px 20px;">주문자 정보</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content1_2_2">
                        <table>
                            <tr>
                                <th>이름</th>
                                <td id="user_id">홍길동</td>
                            </tr>
                            <tr>
                                <th>전화번호</th>
                                <td id="phone">01012345678</td>
                            </tr>
                            <tr>
                                <th>E-mail</th>
                                <td id="email">honggildong@gmail.com</td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div id="content1_3">
                    <div id="content1_3_1">
                        <h2 style="margin : 0px 0px 0px 20px;">배송지 정보</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content1_3_2">
                        <table>
                            <tr>
                                <td colspan="2">
                                    <input type="checkbox" id="sameOrderUser" onclick="sameOrderUser();">
                                    <label for="sameOrderUser" style="font-size : 14px; font-weight : 600;"> 주문자 정보와 동일</label>
                                </td>
                            </tr>
                            <tr>
                                <td width="240"><input type="text" id="receiveName" placeholder="수령인" required></td>
                                <td><input type="number" id="receivePhone" placeholder="연락처 (- 제외)" required></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="number" id="postCode" placeholder="우편번호" width="50%" required>
                                    <input type="button" id="selectAddress" value="주소찾기">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="text" id="address1" placeholder="주소" required>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <input type="text" id="address2" placeholder="상세주소" required>
                                </td>
                            </tr>
                        </table>
                        <div id="content1_3_3">
                            <span style="font-size : 20px; font-weight : bold; margin : 30px 0px 20px 25px;">배송메모</span>
                            <div id="deliveryMemo">
                                <select>
                                    <option value="없음">배송메모를 선택해주세요.</option>
                                    <option>배송 전에 미리 연락 바랍니다.</option>
                                    <option>부재 시 경비실에 맡겨 주세요.</option>
                                    <option>부재 시 전화 주시거나 문자 남겨주세요.</option>
                                    <option>문 앞에 놓고 문자해주세요.</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="content1_4">
                    <div id="content1_4_1">
                        <h2 style="margin : 0px 0px 0px 20px;">쿠폰 / 포인트</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content1_4_2">
                        <table>
                            <tr>
                                <td><h2>쿠폰</h2></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" id="coupon" value="보유쿠폰 0장" readonly>
                                    <input type="button" id="selectCoupon" value="쿠폰적용">
                                </td>
                            </tr>
                            <tr>
                                <td><h2>포인트</h2></td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="number" id="point" value="0">
                                    <input type="button" id="pointAll" value="전액사용">
                                </td>
                            </tr>
                            <tr>
                                <td style="padding : 5px 0px;">
                                    <span>보유포인트</span>
                                    <span id="myPoint" style="font-size : 14px; font-weight : bold;">3,000</span>
                                </td>
                            </tr>
                            <tr>
                                <td><span>1,000 포인트 이상 보유 및 10,000원 이상 구매 시<br> 사용 가능</span></td>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <div id="content2">
                <div id="content2_1">
                    <div id="content2_1_1">
                        <h2 style="margin : 0px 0px 0px 20px;">주문 요약</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content2_1_2">
                        <table>
                            <tr>
                                <td id="orderSummaryName">상품가격</td>
                                <td id="orderSummaryContent">33,000원</td>
                            </tr>
                            <tr>
                                <td id="orderSummaryName">배송비</td>
                                <td id="orderSummaryContent">무료</td>
                            </tr>
                            <tr id="orderSummaryTotal-area">
                                <td id="orderSummaryTotal">총 주문금액</td>
                                <td id="orderSummaryContent">33,000원</td>
                            </tr>
                        </table>
                    </div>
                    <div id="content2_1_3">
                        <div>
                            <span id="rewardPoint" style="color : #19A7CE">2,220</span>
                            <span> 포인트 적립 예정</span>
                        </div>
                    </div>
                </div>
                <div id="content2_2">
                    <div id="content2_2_1">
                        <h2 style="margin : 0px 0px 0px 20px;">결제 수단</h2>
                        <div id="bar_2"></div>
                    </div>
                    <div id="content2_2_2">
                        <div>
                            <input type="radio" id="credit" name="pay" value="credit">
                            <label for="credit">신용카드</label>
                        </div>
                        <div>
                            <input type="radio" id="kakao" name="pay" value="kakao">
                            <label for="kakao">카카오페이</label>
                        </div>
                        <div>
                            <input type="radio"  id="naver" name="pay" value="naver">
                            <label for="naver">네이버페이</label>
                        </div>
                    </div>
                    <div id="content2_2_3">
                        <input type="button" id="payComplete" value="결제하기" >
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/jsp/common/footer.jsp"></jsp:include>

	<!-- 카카오페이 결제요청  -->
    <script>
    	$(function() {
    		$("#payComplete").click(function() {
    			$.ajax({
    				url : "kakaopay",
    				dataType : "json",
    				success : function(rsp) {
    					// alert(rsp.tid); //결제 고유 번호
    					// console.log(rsp);

    					var box = rsp.next_redirect_pc_url;
    					// window.open(box); // 새창 열기
    					location.href = box;
    				},
    				error : function(error) {
    					alert(error);
    				}
    			});
    		});
    	});
    </script>



</body>
</html>