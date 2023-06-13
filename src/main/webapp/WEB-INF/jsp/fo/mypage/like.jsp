<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>찜 목록</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
    <link rel="stylesheet" href="/resources/fo/css/mypage/like.css?after">

</head>
<body>

	<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />

	<!-- 메인 컨텐츠 -->
    <div id="container">
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2 class="divider"></h2>
            <ul class="menu1">
                <li><a href="#">참여현황</a></li>
                <li><a href="#">주문 관리</a></li>
                <li><a href="list.like?memberId=${ loginUser.memberId }">찜 목록</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">포인트 내역</a></li>
                <li><a href="updateInfo.me">내 정보 수정</a></li>
                <li><a href="delete.me">회원탈퇴</a></li>
            </ul>
        </div>
        <!-- Main Content -->
        <div class="main-content">
            <div class="profile">

                <div class="profile-1">
                    <img class="profile-picture" src="/resources/fo/img/logo.png">
                    <div>
                        <p class="memberName">${loginUser.memberName}님 환영합니다!</p>
                        <p style="margin: 0;">현재 등급은 RED 입니다.</p>
                    </div>
                </div>
                <div class="profile-2">
                    포인트 <br>
                    <span class="point">3000</span>
                </div>
            </div>


            <!-- 참여 현황 등 / 누르면 뜨게끔 하고 싶음 -->
            <div class="main-content2">
                <h2>찜 목록 <span>${ list.size() }</span></h2>
                <div id="productArea">

                	<c:forEach var="p" items="${ list }">
	                	<div class="product">
	                        <div>
	                            <a href="#" class="product-img"><img src="/resources/fo/upfiles/${ p.changerName }"></a>
	                        </div>
	                        <div class="product-info">
	                            <div class="product-name">
	                                <a href=""><p>${ p.productName }</p></a>
	                            </div>
	                            <div class="product-price">
	                                <p>${ p.price }원</p>
	                            </div>
	                            <div class="product-icon">
	                                <div><i class="xi-speech-o"></i>50</div>
	                                <div><i class="xi-heart-o"></i>50</div>
	                                <div><i class="xi-cart-o"></i></div>
	                            </div>
	                        </div>
	                    </div>
                	</c:forEach>

                </div>
            </div>
        </div>

    </div>

    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

</body>
</html>