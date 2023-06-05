<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>챌린지 요청 전_카테고리 선정</title>

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/fo/css/challenge/challengeCategoryChoice.css">

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

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
        <div class="bar_2" style="margin-top: 30px;"></div>
        <p id="describe_1" align="center">
            각 카테고리 별로 생성할 수 있는 챌린지의 다양한 예시 입니다. <br>
            예시를 참고하여 <span class="accent">챌린지의 카테고리</span>를 <span class="accent">선택</span>해 주시기 바랍니다. <br>
        </p>
        <div class="bar_2"></div>
    </div>
    <!-- 설명 부분 끝 -->


    <!-- 선택 버튼 부분 시작 -->
    <div class="choice" align="center">

      <c:forEach var="category" items="${categoryList}">
        <div class="choice_one">
            <button class="btn_2" onclick="challengeForm(${category.categoryNo});">${category.categoryName}</button>
            <ul class="choice_one_list">
                <li>포장재 줄이기</li>
            </ul>
        </div>
      </c:forEach>
      <!--
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

        -->
    </div>
    <!-- 선택 버튼 부분 끝 -->

</div>
<!-- 내용 영역 끝 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>


<script>
    function challengeForm(categoryNo) {   // 해당하는 카테고리 번호의 오픈 폼으로 연결
        location.href = "openForm.chall?categoryNo=" + categoryNo;
    }
</script>


</body>
</html>