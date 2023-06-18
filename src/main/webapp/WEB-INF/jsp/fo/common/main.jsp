<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="common.jsp"/>
<link rel="stylesheet" href="/resources/fo/css/common/main.css">
<script type="text/javascript" src="/resources/fo/js/common/main.js"></script>

</head>
<body>

	<jsp:include page="header.jsp"/>

	<div id="container">
        <!-- 배너 -->
        <div class="mainSlide">
            <div><img src="/resources/fo/img/banner1.png" alt=""></div>
            <div><img src="/resources/fo/img/banner2.png" alt=""></div>
            <div><img src="/resources/fo/img/banner3.png" alt=""></div>
        </div>
        <!--  베스트 아이템 -->
        <div id="bestArea">
            <div id="bestBox">
                <div id="bestText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 45px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">BEST SELLER</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        제로웨이스트 입문자도 <br>
                        어려움 없이 사용할 수 있는 <br>
                        베스트 제품
                    </p>
                </div>
                <div><img src="/resources/fo/img/best1.png" id="bestImg"></div>
            </div>
            <div id="bestList">
                <!-- 아이템 시작 -->
                <c:forEach var="p" items="${productList}">
                    <div class="product" onclick="detailView();">
                        <div>
                            <a href="detailView.pro?productNo=${ p.productNo }" class="product-img"><img src="/resources/fo/upfiles/${ p.changerName }"></a>
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <a href="detailView.pro?productNo=${ p.productNo }"><p>${ p.productName }</p></a>
                            </div>
                            <div class="product-price">
                                <p>${ p.price }원</p>
                            </div>
                            <div class="product-icon">
                                <div><i class="xi-speech-o"></i>${ p.reviewCount }</div>
                                <div><i class="xi-heart-o"></i>${ p.likeCount }</div>
                                <div><i class="xi-cart-o"></i></div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
                <!-- 아이템 끝 -->
            </div>
        </div>
        <!-- 챌린지 -->
        <div id="challengeArea">
            <div id="challengeBox">
                <div id="challengeText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 90px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">NEW CHALLENGE</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        환경보호 챌린지는 환경 문제에 <br>
                        대한 인식을 높이고, 사회적인 <br>
                        변화를 이끌기 위해 개인 또는 <br>
                        그룹이 참여하는 활동입니다. 이 <br>
                        챌린지들은 사람들이 지구 환경 <br>
                        에 대한 책임을 느끼고 행동을 <br>
                        취하도록 독려하며, 지속 가능한 <br>
                        방식으로 삶을 살도록 돕습니다.
                    </p>
                </div>
                <div><img src="/resources/fo/img/banner4.png" id="challengeImg"></div>
            </div>
            <div id="challengeList">

                <!-- 카드 한 장 시작 -->
                <c:forEach var="chall" items="${challengeList}">
                <div class="chall_Card" onclick="challengeDetailView('${chall.chNo}');">
                    <div class="chall_Title">
                        <table>
                            <input type="hidden" name="chNo" value="${chall.chNo}">
                            <tr>
                                <td rowspan="2"><img src="/resources/fo/img/logo.png" style="width: 50px; height: 50px;" alt=""></td>
                                <td id="challTitle"><h5 style="margin: 5px;">${chall.chTitle}</h5></td>
                            </tr>
                            <tr>
                                <td><span class="userId">${chall.memberId}</span></td>
                            </tr>
                        </table>
                    </div>

                    <img src="${chall.filePath}" alt="">

                    <div class="chall_Date" align="center">
                        <c:choose>
                            <c:when test="${chall.chStartDay eq chall.chEndDay}">
                                <span>${chall.chStartDay}</span>
                            </c:when>
                            <c:otherwise>
                                <span>${chall.chStartDay} ~ ${chall.chEndDay}</span>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <div class="chall_Tag">
                        <ul>
                            <li><span class="tag">${chall.categoryName}</span></li>
                            <li><span class="tag">${chall.chStatName}</span></li>
                        </ul>
                    </div>
                </div>
                </c:forEach>
                <!-- 카드 한 장 끝 -->
                </div>
            </div>



        <!-- 에코 다이어리 -->
        <div id="diaryArea">
            <div id="diaryBox">
                <div id="diaryText">
                    <div style="display: flex;">
                        <div style="width: 8px; height: 45px; margin-right: 8px; background-color: #19a7ce"></div>
                        <h1 style="margin: 0;">ECO DIARY</h1>
                    </div>
                    <br>
                    <p style="margin: 0;">
                        에코다이어리는 환경보호 및<br>
                        지속 가능성을 촉진하기 위해 <br>
                        개발된 다이어리입니다.
                    </p>
                </div>
                <div><img src="/resources/fo/img/banner4.png" id="diaryImg"></div>
            </div>
            <div class="diarySlide">
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/fo/img/logo.png" alt=""></div>
            </div>
        </div>

    </div><!-- container 끝 : 이 밖에 나가면 틀 튀어나감... -->

    </div>

    <jsp:include page="footer.jsp"/>

</body>
</html>
