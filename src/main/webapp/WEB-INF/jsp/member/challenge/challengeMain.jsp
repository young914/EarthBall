<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 메인화면</title>

    <!-- icon 관련 -->
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/member/challenge/challenge_main.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">

    <!-- js 영역-->
    <script src="/resources/js/member/challenge/challenge_main.js"></script>

    <style>
      .wrap div {
        /* border: 1px solid red; */
        /* 지금부터 지정하는 가로세로길이는 테두리까지 포함한 사이즈임 */
        box-sizing: border-box;
      }

      /* 전체를 감싸는 wrap*/
      .wrap {
        width: 1200px;
        height: 2300px;
        margin: auto; /* 좌우로 항상 정정가운데에 위치시켜주는 속성 */
        padding-top: 170px;
        /* position : relative; */
      }

      /* 크게 세가지 영역 */
      /* header, content, footer */
      /* #header, #content, #footer {
          width: 100%;
      } */

      .wrap>div { width: 100%; }

      /* 영역별 높이 */
      #banner { height: 15%; }
      #filter { height: 10% ;}
      #title { height: 5% ;}
      #content { height: 70%; }


      /* 영역별 너비 */
      #title>div, #content>div {
        float: left;
      }

      #title_1 { width: 80% ;}
      #title_2 { width: 20% ;}



      #title_1 {
        box-sizing : border-box;
        align-items : center;
        display : flex;
      }

      #title_2 {
        box-sizing : border-box;
        align-items : center;
        display : flex;
        justify-content: space-around;
      }

      #title_text {
        width : 500px;
        height : 50px;
        font-size : 40px;
        font-weight : bold;
        padding : 0px 0px 7px 10px;
        border : 1px solid red;
      }

      #bar_1 {
        width : 12px;
        height : 70px;
        background-color : #146C94;
      }

      .btn_1 {
        background-color: #69abce;
        border: solid 1px #69abce;
        border-radius: 7px;
        width: 200px;
        height: 50px;
        color: white;
        font-weight: 700px;
        font-size: 20px;
      }

      #filter {
        background-color: #c7c6c64a ;
        border-radius: 4px;
      }


      #filter_1>div>ul>li a {
        text-align: center;
        justify-content: center;
      }

      #filter_1, #filter_2, #filter_3 {
        height: 28%;
        text-align: center;
        align-items: center;
      }


      #filter_1>h3, #filter_1>div>ul>li, #filter_2>h3, #filter_2>div>ul>li, #filter_3>h3, #filter_3>div>ul>li {
        padding:  0px 20px;
        display: grid;
        float: left;
        justify-content: center;
        align-items: center;
        text-align: center;
      }



      .btn_2 {
        border: solid 1px #69abce;
        background-color: white;
        color: #69abce;
        border-radius: 7px;
        width: 120px;
        padding: 10px 0px;
        font-size: 15px;
        text-decoration: none;

        margin-top: 15px;
        display: inline-block;
      }

      .btn_2:hover {
        background-color: #69abce;
        border: solid 1px #69abce;
        border-radius: 7px;
        color: white;
        font-weight: 700px;
        font-size: 20px;
      }


      /* content 영역 */
      #content_1 { width: 75%;}
      #content_2 { width: 25%;}

      #content_2 {
        margin-top: 20px;
        margin-bottom: 20px;
        border-radius: 4px;
        border: groove 2px #c7c6c694;
      }


      .chall_Card {
        width: 280px;
        height: 350px;
        border: solid 1px #c7c6c694;
        border-radius: 5px;
        box-shadow: 1px 1px 5px #c7c6c694;
        display: inline-block;
        margin: 6px;
        margin-top: 20px;
      }

      .chall_Card:hover {
        box-shadow: 5px 5px 5px  #69abce;
        transform: translate(-5%, -5%);
        transition-delay: 0.1s;
        transition-duration: 0.6s;
        cursor: pointer;
      }

      .chall_Card img {
        width: 95%;
        height: 160px;
        display: block;
        margin-left: 7px;
        margin-bottom: 10px;
        margin-top: 7px;
        border-radius: 5px;
      }


      .userId {
        margin: 5px;
      }

      /* 챌린지 카드의 데이트 속성 */
      .chall_Date>span {
        text-align: center;
      }


      /* 챌린지 카드의 태그 속성 */
      .chall_Tag>ul>li span {
        text-align: center;
        justify-content: center;
        width: 90px;
        font-size: 15px;
        padding: 7px;
      }

      .chall_Tag {
        text-align: center;
        align-items: center;
        justify-content: center;
      }

      /*
      .chall_Tag>ul {
          padding-left: 5px;
      }
      */

      .chall_Tag>ul>li {
        display:inline-block;
        float: left;
        margin: 5px;
      }


      .tag {
        background-color: #69abce;
        border: solid 1px #69abce;
        border-radius: 7px;
        width: 200px;
        height: 50px;
        color: white;
        font-weight: 700px;
      }



      /* Hot 챌린지 */
      .hot_chall {
        width: 93%;
        height: 90px;
        border: solid 1px #c7c6c694;
        border-radius: 5px;
        box-shadow: 1px 1px 5px #c7c6c694;
        display: inline-block;
        margin: 6px;
        margin-top: 20px;
      }

      .hot_one {
        padding: 7px;
      }

      .hot_title {
        font-size: 18px;
        font-weight: 900px;
        color: #146C94;
      }

      .tags {
        color: rgb(169, 169, 169);
      }




      /* 슬라이더 배너 */

    </style>




</head>
<body>
<!-- 헤더 시작 -->
<div id="headers">
    <div class="header">
        <div style="width: 120px;"></div>
        <div class="logo">
            <a href=""><img src="/resources/img/logo.png" style="width: 250px;"></a>
        </div>
        <div class="login-area">
            <div><a href="">로그인</a></div>&nbsp;|&nbsp;
            <div><a href="">회원가입</a></div>
        </div>
    </div>
    <!-- 매뉴바 -->
    <div class="menu">
        <div>
            <div class="dropdown">
                <span class="dropbtn">장보기</span>
                <div class="dropdown-content">
                    <a href="">선물꾸러미</a>
                    <a href="">욕실</a>
                    <a href="">식품</a>
                    <a href="">주방</a>
                    <a href="">생활</a>
                    <a href="">취미</a>
                    <a href="">음료용품</a>
                    <a href="">여성용품</a>
                    <a href="">반려동물</a>
                    <a href="">화장품</a>
                    <a href="">문구</a>
                    <a href="">전체</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="dropbtn">지구소개</span>
                <div class="dropdown-content">
                    <a href="">#</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="dropbtn">챌린지</span>
                <div class="dropdown-content">
                    <a href="">#</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="dropbtn">환경일기</span>
                <div class="dropdown-content">
                    <a href="">#</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="dropbtn">매장찾기</span>
                <div class="dropdown-content">
                    <a href="">#</a>
                </div>
            </div>
            <div class="dropdown">
                <span class="dropbtn">고객센터</span>
                <div class="dropdown-content">
                    <a href="">#</a>
                </div>
            </div>
        </div>


        <div class="search">
            <form action="">
                <input type="text" placeholder="검색어 입력">
                <i class="xi-search"></i>
            </form>
        </div>

    </div>
</div>
<!-- 헤더 끝 -->



<!-- 내용 영역 시작 -->
<div class="wrap">
    <div id="banner">
        <!--
        <div><img src="/resources/img/챌린지배너_1.png" alt=""></div>
        <div><img src="/resources/img/챌린지배너_2.png" alt=""></div>
        <div><img src="/resources/img/챌린지배너_3.png" alt=""></div>
    -->
    </div>


    <div id="title">
        <div id="title_1">
            <div id="bar_1"></div>
            <div id="title_text">에코 챌린지</div>
        </div>

        <div id="title_2">
            <button class="btn_1" onclick="chall_open();">챌린지 오픈</button>
        </div>
    </div>


    <div id="filter">

        <div id="filter_1">
            <h3>카테고리</h3>
            <div id="filter_1_1">
                <ul>
                    <li><a class="btn_2" href="">친환경 소비</a></li>
                    <li><a class="btn_2" href="">친환경 이동</a></li>
                    <li><a class="btn_2" href="">자원순환</a></li>
                    <li><a class="btn_2" href="">자연보호</a></li>
                    <li><a class="btn_2" href="">에너지 절약</a></li>
                    <li><a class="btn_2" href="">기타</a></li>
                </ul>
            </div>
        </div>
        <div></div>

        <div id="filter_2">
            <h3>도전기간</h3>
            <div id="filter_2_1">
                <ul>
                    <li><a class="btn_2" href="">당일</a></li>
                    <li><a class="btn_2" href="">1주</a></li>
                    <li><a class="btn_2" href="">2주</a></li>
                    <li><a class="btn_2" href="">3주</a></li>
                    <li><a class="btn_2" href="">4주 이상</a></li>
                </ul>
            </div>

        </div>

        <div id="filter_3">
            <h3>진행상태</h3>
            <div id="filter_3_1">
                <ul>
                    <li><a class="btn_2" href="">진행 중</a></li>
                    <li><a class="btn_2" href="">진행 완료</a></li>
                </ul>
            </div>
        </div>
    </div>


    <div id="content">

        <!-- content_1 시작 -->
        <div id="content_1">

            <!-- 카드 한 장 시작 -->
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <!-- 카드 한 장 끝 -->


            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul align="center">
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>
            <div class="chall_Card">
                <div class="chall_Title">
                    <table>
                        <tr>
                            <td rowspan="2"><img src="/resources/img/bono.jpg" style="width: 50px; height: 50px;" alt=""></td>
                            <td><h3 style="margin: 5px;">여기는 제목임</h3></td>
                        </tr>
                        <tr>
                            <td><span class="userId">회원ID</span></td>
                        </tr>
                    </table>
                </div>

                <img src="/resources/img/flower.jpg" alt="">

                <div class="chall_Date" align="center">
                    <span>2023-05-27 ~ 2023-05-28</span>
                </div>

                <div class="chall_Tag">
                    <ul>
                        <li><span class="tag">친환경 소비</span></li>
                        <li><span class="tag">1주</span></li>
                        <li><span class="tag">진행 중</span></li>
                    </ul>
                </div>
            </div>






        </div>
        <!-- content_1 끝-->


        <!-- Hot 챌린지 영역 시작 -->
        <div id="content_2">
            <h1 style="text-align: center;"><span style="color: #146C94;">HOT</span> 챌린지</h1>

            <!-- 챌린지 하나 시작 -->
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <!-- 챌린지 하나 끝 -->


            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="hot_chall">
                <table class="hot_one">
                    <tr>
                        <td rowspan="2">
                            <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/img/bono.jpg" alt="">
                        </td>
                        <td><span class="hot_title">제목이 들어갈 것임</span></td>
                    </tr>
                    <tr>
                        <td>
                            <span class="tags">#태그자리1</span>
                            <span class="tags">#태그자리2</span> <br>
                            <span class="tags">#태그자리3</span>
                        </td>
                    </tr>
                </table>
            </div>


        </div>
        <!-- Hot 챌린지 영역 끝 -->


    </div>


    <!-- 페이징바 넣을 자리 시작 -->

    <!-- 페이징바 넣을 자리 끝 -->


</div>
<!-- 내용 영역 끝 -->



<!-- 푸터 시작 -->
<div id="footer">
    <div style="width: 100x;"></div>
    <div><img src="../resources/img/logo2.png" style="width: 400px; padding-top: 20px;"></div>
    <div style="margin-top: 30px; color: white;">
        <p style="font-weight: bold;">
            이용약관  |  개인정보처리방침  |  도매 전용 B2B몰
        </p>
        <p>
            회사명 : 주식회사 인수온송민근 | 대표자 : 양선주 <br>
            주소 : 서울시 금천구 가산디지털2로 165, 1001호 | 이메일 : contact@jigugong.co.kr | 팩스 : 0303-3444-2050 <br>
            사업자등록번호 : 689-86-00791 | 통신판매업신고 : 제2018-서울동작-02955 | 건강기능식품영업신고 : 제2022-0112707 <br>
            개인정보보호책임자 : 양선주 | 고객센터 : 02-812-2050 | 호스팅 제공자 : (주)지구공
        </p>
    </div>
    <div style="width: 100px;"></div>
</div>
<!-- 푸터 끝 -->







<script>
    $(function(){
        $('#banner').slick({
            dots: true,
            autoplay : true,
            autoplaySpeed : 3000,
            speed : 1000,
            infinite : true
        });
    })


    function chall_open(){
        location.href = "/categoryList.chall";
    }
</script>

</body>
</html>