<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 상세 화면</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/challenge/challengeDetailView.css">

  <!-- js 영역-->

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

  <!-- 내용 영역 시작 -->
  <div class="wrap">
    <!-- 타이틀 시작-->
    <div id="title">

      <div id="title_1">
        <img src="${challenge.filePath}" id="thumbnail" alt="">
      </div>

      <div id="title_2">
        <div id="title_2_1">
          <!-- <div id="bar_1"></div> -->
          <div id="title_text">에코챌린지</div>
          <div id="title_title">${challenge.chTitle}</div>
        </div>
        <div id="title_2_2">
                <span>
                <div id="title_profile_photo" style="  width: 150px;">
                  <img src="/resources/img/jun.png" id="profile" alt="">
                </div>
              </span>
          <span style="  display: flex;">

                <div id="title_profile_btn" style="width: 300px;">
                  <div>
                    ${challenge.memberId}
                  </div>
                  <div style="  text-align: right;">
                    <c:if test="${ not empty loginUser }">
                      <button>작성자에게만보이는 수정버튼</button>
                    </c:if>
                  </div>
                  <div>
                    <button class="btn_3">챌린지 참여</button>
                  </div>
                  <div>
                    <button class="btn_3">챌린지 채팅 참여</button>
                  </div>
                </div>
              </span>
        </div>
      </div>

    </div>
    <!-- 타이틀 끝-->

    <div class="btn_div">
      <button class="btn_1">챌린지 소개</button>
      <button class="btn_2">인증목록</button>
    </div>


    <div class="basic_info">
      <div class="info_title">
        <h2>기본 정보</h2>
        <div class="bar_2"></div>
        <br>
      </div>

      <div class="basic_form_1">
        <span class="form_title">챌린지명</span>
        <span class="form_content">${challenge.chTitle}</span> <br><br>

        <span class="form_title">카테고리 </span>
        <span class="form_content">${challenge.categoryName}</span> <br><br>

        <span class="form_title">도전기간 </span>
        <span class="form_content">${challenge.chStartDay}</span> ~ <span class="form_content">${challenge.chEndDay}</span> <br><br>

        <span class="form_title">진행상태 </span>
        <span class="form_content">진행중</span> <br><br>

      </div>

    </div>


    <div class="template">
      <div class="info_title">
        <h2>챌린지 상세 내용</h2>
        <div class="bar_2" style="width: 220px;"></div>
        <br>
      </div>


      <!-- 탬플릿 폼 안 영역 시작-->
      <div class="temp_content">
        ${challenge.chContent}
      </div>
      <!-- 탬플릿 폼 안 영역 끝-->
    </div>
  </div>

  <!-- 내용 영역 끝 -->


<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>