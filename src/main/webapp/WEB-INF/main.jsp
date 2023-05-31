<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<jsp:include page="jsp/common/common.jsp"/>
<link rel="stylesheet" href="resources/css/common/main.css">
<script type="text/javascript" src="resources/js/common/main.js"></script>

</head>
<body>

	<jsp:include page="jsp/common/header.jsp"/>

	<div id="container">
        <!-- 배너 -->
        <div class="mainSlide">
            <div><img src="/resources/img/banner1.png" alt=""></div>
            <div><img src="/resources/img/banner2.png" alt=""></div>
            <div><img src="/resources/img/banner3.png" alt=""></div>
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
                <div><img src="/resources/img/best1.png" id="bestImg"></div>
            </div>
            <div id="bestList">
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best2.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best3.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best4.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best5.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best6.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="/resources/img/best7.png">
                        </div>
                        <div class="product-info">
                            <div class="product-name">
                                <p>[지구공] 베스트셀러</p>
                            </div>
                            <div class="product-price">
                                <p>25,000원</p>
                            </div>
                        </div>
                    </div>
                </div>
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
                <div><img src="/resources/img/banner4.png" id="challengeImg"></div>
            </div>
            <div id="challengeList">
                <div>
                    <div class="challenge1">
                        <div><img src="/resources/img/logo.png"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="/resources/img/logo.png"></div>
                    <div class="challenge3">2023-05-15 ~ 23-05-22</div>
                    <div class="challenge4">
                        <div>친환경 소비</div>
                        <div>1주</div>
                        <div>진행중</div>
                    </div>
                </div>
                <div>
                    <div class="challenge1">
                        <div><img src="/resources/img/logo.png"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="/resources/img/logo.png"></div>
                    <div class="challenge3">2023-05-15 ~ 23-05-22</div>
                    <div class="challenge4">
                        <div>친환경 소비</div>
                        <div>1주</div>
                        <div>진행중</div>
                    </div>
                </div>
                <div>
                    <div class="challenge1">
                        <div><img src="/resources/img/logo.png"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="/resources/img/logo.png"></div>
                    <div class="challenge3">2023-05-15 ~ 23-05-22</div>
                    <div class="challenge4">
                        <div>친환경 소비</div>
                        <div>1주</div>
                        <div>진행중</div>
                    </div>
                </div>
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
                <div><img src="/resources/img/banner4.png" id="diaryImg"></div>
            </div>
            <div class="diarySlide">
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
                <div align="center"><img src="/resources/img/logo.png" alt=""></div>
            </div>
        </div>

    </div>

    <jsp:include page="jsp/common/footer.jsp"/>

</body>
</html>