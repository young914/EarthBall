<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 인증 상세</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/challenge/confirmDetailview.css">

  <!-- js 영역-->

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
  <!-- 타이틀 시작-->
  <div id="title">
    <div id="bar_1"></div>
    <div id="title_text">챌린지 인증 상세</div>
  </div>
  <!-- 타이틀 끝-->


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
      <span class="form_content">${challenge.chStartDay}</span> ~ <span
        class="form_content">${challenge.chEndDay}</span> <br><br>

      <span class="form_title">진행상태 </span>
      <span class="form_content">진행중</span> <br><br>

      <input type="hidden" name="chNo" value="${challenge.chNo}">
      <input type="hidden" name="memberId" value="${loginUser.memberId}">

    </div>

  </div>


  <div class="template">
    <div class="info_title">
      <h2>인증 정보</h2>
      <div class="bar_2"></div>
      <br>
    </div>

    <div class="text">
      <div class="text_class_1">
        <h1 style="color: #146C94; font-weight: 800">${chConfirm.chConTitle}</h1>
      </div>
      <div class="text_class_2">
        <button class="btn_3" onclick="confirm_update(${chConfirm.chConNo});">수정</button>
        <button class="btn_3">삭제</button>
      </div>
    </div>
    <br>
    <hr>
    <br>

    <!-- for문 -->
    <c:forEach var="temp" items="${templateList}">

    <!-- 탬플릿 폼 안 영역 시작-->
    <div class="temp_content">

      <!-- select 문 일 경우-->
      <c:if test="${temp.inputType eq 'select'}">
        <div class="select">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName}</span>
              </c:if>
            </c:forEach>
          </c:forEach>
          </select>

        </div>
        <br>
      </c:if>


      <!-- checkbox 일 경우 -->
      <c:if test="${temp.inputType eq 'checkbox'}">
        <div class="checkbox">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName} </span>
              </c:if>
            </c:forEach>
          </c:forEach>

        </div>
        <br>
      </c:if>


      <!-- radio 일 경우 -->
      <c:if test="${temp.inputType eq 'radio'}">

        <div class="radio">
          <span class="sub_title">${temp.chSubTitle}</span>

          <c:forEach var="detail" items="${temp.chDetailInfoList}">
            <c:forEach var="code" items="${temp.codeList}">
              <c:if test="${code.code eq detail.code}">
                <span class="values">${code.codeName}</span>
              </c:if>
            </c:forEach>
          </c:forEach>

        </div>
        <br>
      </c:if>


      <!-- text 일 경우 -->
      <c:if test="${temp.inputType eq 'text'}">
        <div class="text">
          <span class="sub_title">${temp.chSubTitle}</span>

          <span class="values">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>



      <!-- textarea 일 경우 -->
      <c:if test="${temp.inputType eq 'textarea'}">
        <div class="textarea">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <span class="valuesTextarea">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>


      <!-- img 파일일 경우 -->
      <c:if test="${temp.inputType eq 'file'}">
        <div class="img">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="img_class">
            <div class="basic_form_2">
              <div class="flex-container">
                <div class="wrapper">
                  <img src="/resources"
                       class="image-box"/>
                  <input type="file" class="fileUpload" accept="image/*"
                         data-category-template-no="${temp.categoryTemplateNo}" data-input-type="${temp.inputType}">
                  <input type="hidden" name="${temp.categoryTemplateNo}_${temp.inputType}">
                  </label>
                </div>
              </div>
            </div>
          </div>
        </div>
        <br>
      </c:if>


      <!-- number 일 경우 -->
      <c:if test="${temp.inputType eq 'number'}">
        <div class="number">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <span class="values">${temp.chDetailInfoList[0].chDetailInfoData}</span>

        </div>
        <br>
      </c:if>


      <!-- range 일 경우 -->
      <c:if test="${temp.inputType eq 'range'}">
        <div class="range">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="ranger_class">
            <input type="range" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                   step="20"
                   class="range_size"
                   value="${temp.chDetailInfoList[0].chDetailInfoData}">
          </div>
        </div>
        <br>
      </c:if>


      <!--datetime-local : 연도, 월, 일, 오전/오후 여부, 시, 분 입력 -->
      <c:if test="${temp.inputType eq 'datetime-local'}">
        <div class="datetime">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="datetime_class">
            <input type="datetime-local" name="${temp.categoryTemplateNo}_${temp.inputType}"
                   class="datetime_size"
                   value="${temp.chDetailInfoList[0].chDetailInfoData}"
                   readonly>
          </div>
        </div> <br>
      </c:if>
      </c:forEach>


    </div>
    <!-- 탬플릿 폼 안 영역 끝-->
  </div>


  <div class="btn_div">
    <button class="btn_1" onclick="confirm_challenge();">챌린지 인증</button>
    <button class="btn_1" onclick="javascript:history.go(-1);">인증 취소</button>
  </div>


  <script>

      function confirm_update(chConNo) {
          location.href="updateForm.con?chConNo=" + chConNo;
      }

      function confirm_challenge() {
          // TB_CH_CONFIRM 챌린지 인증 정보 넘기기
          let chNo = $("input[type=hidden][name=chNo]").val();            // 챌린지 일련번호
          let chConTitle = $("input[type=text][name=chConTitle]").val();      // 챌린지 인증 제목
          let memberId = $("input[type=hidden][name=memberId]").val();       // 회원아이디

          // 자 그럼 이제부터 여기에 챌린지 상세 정보 데이터 담기.....
          let templateList = []
          <c:forEach var="temp" items="${templateList}">
          templateList.push({
              categoryTemplateNo: '${temp.categoryTemplateNo}'
              , inputType: '${temp.inputType}'
          });
          </c:forEach>

          let list = []       // 이게 TB_CH_DETAIL_INFO
          for (let i = 0; templateList.length > i; i++) {
              // 만약 code랑 fileNo이 없을 경우
              if (templateList[i].inputType == 'text' || templateList[i].inputType == 'number'
                  || templateList[i].inputType == 'range' || templateList[i].inputType == 'datetime-local') {

                  list.push({
                      categoryTemplateNo: templateList[i].categoryTemplateNo,
                      chDetailInfoData: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                      code: null,
                      fileNo: null
                  });
              }

              if (templateList[i].inputType == 'textarea') {
                  list.push({
                      categoryTemplateNo: templateList[i].categoryTemplateNo,
                      chDetailInfoData: $('textarea[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                      code: null,
                      fileNo: null
                  });
              }

              if (templateList[i].inputType == 'file') {
                  list.push({
                      categoryTemplateNo: templateList[i].categoryTemplateNo,
                      chDetailInfoData: null,
                      code: null,
                      fileNo: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val()
                  });
              }

              if (templateList[i].inputType == 'select') {
                  list.push({
                      categoryTemplateNo: templateList[i].categoryTemplateNo,
                      chDetailInfoData: null,
                      code: $('select[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').val(),
                      fileNo: null
                  });
              }
              if (templateList[i].inputType == 'radio') {
                  list.push({
                      categoryTemplateNo: templateList[i].categoryTemplateNo,
                      chDetailInfoData: null,
                      code: $('input[name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']:checked').val(),
                      fileNo: null
                  });
              }
              if (templateList[i].inputType == 'checkbox') {
                  $('input[type="checkbox"][name=' + templateList[i].categoryTemplateNo + "_" + templateList[i].inputType + ']').each(function () {
                      if ($(this).is(':checked')) {
                          list.push({
                              categoryTemplateNo: templateList[i].categoryTemplateNo,
                              chDetailInfoData: null,
                              code: $(this).val(),
                              fileNo: null
                          });
                      }
                  });
              }
          }
          //console.log("templateList : " , templateList);


          let confirmInfo = { // 인증 기본 정보
              chNo: chNo
              , chConTitle: chConTitle
              , memberId: memberId
              , chDetailInfoList: list
          }

          console.log("인증 기본 정보 : ", confirmInfo);
          console.log("디테일 정보 list : ", list);

          $.ajax({
              url: "/insert.con"
              , type: "post"
              , data: JSON.stringify(confirmInfo)
              , contentType: 'application/json'
              , success: function (result) {
                  if (result > 0) {
                  } else {
                  }
                  location.href = "/main.chall"
              }
              , error: function () {
              }
          });
      }
  </script>


</div>
<!-- 내용 영역 끝 -->

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>
