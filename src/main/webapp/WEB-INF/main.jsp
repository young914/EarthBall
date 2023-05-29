<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	.mainSlide {
         position: relative;
         margin-top: 50px;
     }
     .mainSlide img {
         width: 100%;
         height: 550px;
     }
     .mainSlide button {
         position: absolute;
         z-index: 10;
         top: 50%;
         transform: translateY(-50%);
         width: 50px;
         height: 50px;
         border-radius: 100px;
         background: rgba(0,0,0,0.5);
     }
     .mainSlide button::before{
         font-family: 'xeicon';
         color: #fff;
         font-size: 30px;
     }
     .mainSlide button.slick-prev {
         left: 50px;
         font-size: 0;
         color: transparent;
     }
     .mainSlide button.slick-prev:before{
         content:"\e93d";
     }
     .mainSlide button.slick-next {
         right: 50px;
         font-size: 0;
         color: transparent;
     }
     .mainSlide button.slick-next::before{
         content:"\e940";
     }
     .slick-dots{
         position: absolute;
         bottom: 0;
         width: 100%;
         text-align: center;
     }

     /* 베스트아이템 */
     #bestArea{
         width: 100%;
         height: 700px;
         margin: 0 auto;
         margin-top: 50px;
         margin-bottom: 50px;
         display: grid;
         grid-template-columns: 40% 60%;

     }
     #bestList{
         width: 100%;
         display: grid;
         grid-template-columns: 33% 33% 33%;
         grid-template-rows: 50% 50%;
         margin-right: 30px;
     }
     #bestList>div{
         /* border: 1px solid #19a7ce; */
         margin: 10px;
     }
     /* 마우스 올라가면 커지는 효과 */
     #bestList>div:hover{
         transform: scale(1.05);
         transition: 0.5s;
         cursor: pointer;
     }
     #bestText{
         margin-left: 20px;
     }
     #bestImg{
         margin-left: 20px;
         width: 300px;
         height: 300px;
         border-radius: 100%;
         margin-top: 100px;
     }
     .product-img{
         text-align: center;
     }
     .product-img>img{
         width: 100%;
         height: 240px;

     }
     .product-icon i, .product-name, .product-price{
         margin-left: 10px;
     }
     /* 챌린지 */
     #challengeArea{
         margin-top: 50px;
     }
     #challengeBox{
         display: grid;
         grid-template-columns: 25% 75%;
     }
     #challengeList{
         display: flex;
         justify-content: space-evenly;
         width: 100%;
         height: 100%;
         margin-top: 50px;
     }
     #challengeList>div{
         /* border: 1px solid black; */
         /* 그림자효과 */
         box-shadow: 0 0 10px rgba(0,0,0,0.2);
         width: 300px;
     }
     /* 마우스 올라가면 커지는 효과 */
     #challengeList>div:hover{
         transform: scale(1.05);
         transition: 0.5s;
         cursor: pointer;
     }
     #challengeText{
         margin-left: 20px;
     }
     #challengeImg{
         width: 100%;
         height: 400px;
     }
     .challenge1{
         display: flex;
     }
     .challenge1>div>img{
         width: 50px;
         height: 50px;
         border-radius: 50px;
     }
     .challenge2{
         text-align: center;
     }
     .challenge2>div{
         margin: 10px;
     }
     .challenge2>img{
         width: 100%;
         height: 200px;
     }
     .challenge4{
         display: flex;
     }
     .challenge1>div:first-child{
         margin: 10px
     }
     .challenge1>div:last-child{
         margin: 10px;
         margin-left: 20px;
     }
     .challenge3{
         text-align: center;
         margin: 10px;
     }
     .challenge4>div{
         background-color: #19a7ce;
         margin: 10px;
         width: 90px;
         height: 30px;
         border-radius: 10px;
         text-align: center;
         line-height: 30px;
         color: white;
         padding: 5px;
     }
     /* 에코다이어리 */
     #diaryArea{
         margin-top: 50px;
     }
     #diaryBox{
         display: grid;
         grid-template-columns: 25% 75%;
     }
     #diaryText{
         margin-left: 20px;
     }
     #diaryImg{
         width: 100%;
         height: 400px;
     }
     /* 에코다이어리-슬라이드 */
     .diarySlide {
         position: relative;
         margin-top: 60px;
     }
     .diarySlide img {
         width: 200px;
         height: 300px;
     }
     .diarySlide button {
         position: absolute;
         z-index: 10;
         top: 50%;
         transform: translateY(-50%);
         width: 50px;
         height: 50px;
         border-radius: 100px;
         background: rgba(0,0,0,0.5);
         border: none;
     }
     .diarySlide button::before{
         font-family: 'xeicon';
         color: #fff;
         font-size: 45px;
     }
     .diarySlide button.slick-prev {
         left: 50px;
         font-size: 0;
         color: transparent;
     }
     .diarySlide button.slick-prev:before{
         content:"\e93d";
     }
     .diarySlide button.slick-next {
         right: 50px;
         font-size: 0;
         color: transparent;
     }
     .diarySlide button.slick-next::before{
         content:"\e940";
     }
     .slick-dots{
         position: absolute;
         bottom: 0;
         width: 100%;
         text-align: center;
     }
</style>
</head>
<body>
	<jsp:include page="jsp/common/header.jsp"/>

	<div id="container">
        <!-- 배너 -->
        <div class="mainSlide">
            <div><img src="../resources/banner1.png" alt=""></div>
            <div><img src="../resources/banner2.png" alt=""></div>
            <div><img src="../resources/banner3.png" alt=""></div>
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
                <div><img src="../resources/best1.png" id="bestImg"></div>
            </div>
            <div id="bestList">
                <div>
                    <div class="product">
                        <div class="product-img">
                            <img src="../resources/best2.png">
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
                            <img src="../resources/best3.png">
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
                            <img src="../resources/best4.png">
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
                            <img src="../resources/best5.png">
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
                            <img src="../resources/best6.png">
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
                            <img src="../resources/best7.png">
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
                <div><img src="../resources/banner4.png" id="challengeImg"></div>
            </div>
            <div id="challengeList">
                <div>
                    <div class="challenge1">
                        <div><img src="../resources/bono.jpg"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="../resources/best1.png"></div>
                    <div class="challenge3">2023-05-15 ~ 23-05-22</div>
                    <div class="challenge4">
                        <div>친환경 소비</div>
                        <div>1주</div>
                        <div>진행중</div>
                    </div>
                </div>
                <div>
                    <div class="challenge1">
                        <div><img src="../resources/bono.jpg"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="../resources/best1.png"></div>
                    <div class="challenge3">2023-05-15 ~ 23-05-22</div>
                    <div class="challenge4">
                        <div>친환경 소비</div>
                        <div>1주</div>
                        <div>진행중</div>
                    </div>
                </div>
                <div>
                    <div class="challenge1">
                        <div><img src="../resources/bono.jpg"></div>
                        <div>
                            <div>챌린지 이름</div>
                            <div>회원 ID</div>
                        </div>
                    </div>
                    <div class="challenge2"><img src="../resources/best1.png"></div>
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
                <div><img src="../resources/hyuksoo.png" id="diaryImg"></div>
            </div>
            <div class="diarySlide">
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
                <div align="center"><img src="../resources/bono.jpg" alt=""></div>
            </div>
        </div>

    </div>

    <jsp:include page="jsp/common/footer.jsp"/>


    <script>
        $(function(){
            $('.mainSlide').slick({
                dots: true,
                autoplay : true,
                autoplaySpeed : 3000,
                speed : 1000,
                infinite : true
            });
        })
        $(function(){
            $('.diarySlide').slick({
                autoplay : true,
                autoplaySpeed : 1000,
                speed : 2000,
                infinite: true,
                slidesToShow: 3,
                slidesToScroll: 3
            })
        })
    </script>

</body>
</html>