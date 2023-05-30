<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 요청 전_카테고리 선정</title>

    <!-- icon 관련 -->
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">
    <link rel="stylesheet" href="/resources/css/member/challenge/challenge_category_choice.css">


    <style>
      .wrap div {
        /* border: 1px solid red; */
        /* 지금부터 지정하는 가로세로길이는 테두리까지 포함한 사이즈임 */
        box-sizing: border-box;
      }

      /* 전체를 감싸는 wrap*/
      .wrap {
        width: 1200px;
        height: 1400px;
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
      #title { height: 10%; }
      .describe { height: 20% ;}
      .choice {
        height: 70% ;
        display: flex;
        justify-content: space-between;
        flex-wrap: wrap;
      }


      /* 영역별 너비 */
      #title>div, #content>div {
        float: left;
      }

      .choice_one {
        width: 30%;
        display: flex;
        flex-direction: column;
        align-items: center;
        margin-bottom: 10px;
      }




      /* 타이틀 */
      #title {
        box-sizing : border-box;
        align-items : center;
        display : flex;
      }

      #title_text {
        width : 1000px;
        height : 50px;
        font-size : 40px;
        font-weight : bold;
        padding : 0px 0px 7px 10px;
        /* border : 1px solid red; */
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


      #bar_2 {
        width : 95%;
        height : 4px;
        background-color : #b9b9b9;
        margin : 0px 0px 0px 20px;
      }

      .describe {
        float: inline-start;
      }

      #describe_1 {
        font-size: 25px;
        font-weight: 400px;
        color: rgb(123, 123, 123);
        padding: 20px;
      }

      .accent {
        font-size: 35px;
        color: #146C94;
        font-weight: 900px;
      }

      .btn_2 {
        background-color: #69abce;
        border: solid 1px #69abce;
        border-radius: 7px;
        width: 300px;
        height: 80px;
        color: white;
        font-weight: 700px;
        font-size: 30px;
        margin: 20px;
        cursor: pointer;
      }


      .btn_2:hover {
        background-color: white;
        color: #69abce;
      }


      .choice_one_list li, .choice_one_list {
        text-align:left;
        font-size: 20px;
      }

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
    <!-- 타이틀 시작-->
    <div id="title">
        <div id="bar_1"></div>
        <div id="title_text">챌린지 오픈 - 카테고리 선택</div>
    </div>
    <!-- 타이틀 끝-->



    <!-- 설명 부분 시작 -->
    <div class="describe">
        <div id="bar_2" style="margin-top: 30px;"></div>
        <p id="describe_1" align="center">
            각 카테고리 별로 생성할 수 있는 챌린지의 다양한 예시 입니다. <br>
            예시를 참고하여 <span class="accent">챌린지의 카테고리</span>를 <span class="accent">선택</span>해 주시기 바랍니다. <br>
        </p>
        <div id="bar_2"></div>
    </div>
    <!-- 설명 부분 끝 -->


    <!-- 선택 버튼 부분 시작 -->
    <div class="choice" align="center">

        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_consume();">친환경 소비</button>
            <ul class="choice_one_list">
                <li>포장재 줄이기</li>
                <li>텀블러 사용</li>
                <li>냉장고 파먹기</li>
                <li>채식밥상 챌린지</li>
                <li>장바구니 사용하기</li>
                <li>에코백 사용하기</li>
                <li>텀블러 사용하기</li>
                <li>지속가능한 패션 생활하기</li>
                <li>가계부 쓰기 (불필요한 소비 줄이기)</li>
            </ul>
        </div>

        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_vehicle();">친환경 이동</button>
            <ul class="choice_one_list">
                <li>대중교통 이용하기</li>
                <li>자전거로 출,퇴근 하기</li>
            </ul>
        </div>


        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_resource();">자원 순환</button>
            <ul class="choice_one_list">
                <li>쓰레기 줄이기</li>
                <li>재사용 / 재활용 하기</li>
                <li>분리수거 하기</li>
                <li>전자영수증 사용하기</li>
            </ul>
        </div>


        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_nature();">자연 보호</button>
            <ul class="choice_one_list">
                <li>나무 심기</li>
                <li>텃밭 가꾸기</li>
                <li>동물 보호</li>
                <li>마스크 끈 잘라서 버리기</li>
            </ul>
        </div>



        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_energy();">에너지 절약</button>
            <ul class="choice_one_list">
                <li>엘리베이터나 에스컬레이터 사용 대신 계단 이용하기</li>
                <li>대기 전력 줄이기</li>
                <li>물 절약하기</li>
                <li>디지털 디톡스</li>
                <li>양치컵 사용하기</li>
                <li>실내 적정온도 유지하기</li>
                <li>어스아워</li>
            </ul>
        </div>


        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm_etc();">기타</button>
            <p class="choice_one_list">
                자신만의 에코챌린지를 자유롭게 작성해 보세요.
            </p>
        </div>
    </div>
    <!-- 선택 버튼 부분 끝 -->

</div>
<!-- 내용 영역 끝 -->


<!-- 푸터 시작 -->
<div id="footer">
    <div style="width: 100px;"></div>
    <div><img src="/resources/img/logo2.png" style="width: 400px; padding-top: 20px;"></div>
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
    function challengeForm_consume(){   // 친환경 소비
        location.href="openForm.chall?categoryNo=1";
    }

    function challengeForm_vehicle() {  // 친환경 이동
        location.href="openForm.chall?categoryNo=2";
    }

    function challengeForm_resource() {     // 자원 순환
        location.href="openForm.chall?categoryNo=3";
    }

    function challengeForm_nature() {   // 자연보호
        location.href="openForm.chall?categoryNo=4";
    }

    function challengeForm_energy() {   // 에너지 절약
        location.href="openForm.chall?categoryNo=5";
    }

    function challengeForm_etc() {   // 기타
        location.href="openForm.chall?categoryNo=6";
    }
</script>



</body>
</html>