<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>챌린지 오픈 요청 화면</title>

  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <!-- icon 관련 -->
  <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

  <!-- CSS 영역-->
  <link rel="stylesheet" href="/resources/fo/css/common/header.css">
  <link rel="stylesheet" href="/resources/fo/css/common/footer.css">
  <link rel="stylesheet" href="/resources/fo/css/challenge/challengeInsertForm.css">

  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

  <!-- js 영역-->
  <script src="/resources/fo/js/challenge/challengeInsertForm.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

<!-- 내용 영역 시작 -->
<div class="wrap">
  <!-- 타이틀 시작-->
  <div id="title">
    <div id="bar_1"></div>
    <div id="title_text">챌린지 오픈</div>
  </div>
  <!-- 타이틀 끝-->


  <div class="basic_info">
    <div class="info_title">
      <h2>기본 정보</h2>
      <div class="bar_2"></div>
      <br>
      <span>[ 기본 정보 ] 사항은 필수 입력 사항입니다. *</span>
    </div>

    <div class="basic_form_1">
      <span class="form_title">챌린지명 <span class="star">*</span></span>
      <input type="text" class="form_text" placeholder="챌린지명을 입력해주세요." name="chTitle" required> <br><br>

      <span class="form_title">카테고리 <span class="star">&nbsp;</span></span>
      <input type="hidden" name="categoryNo" value="${category.categoryNo}">
      <input type="text" class="form_text" value="${category.categoryName}" readonly> <br><br>

      <span class="form_title">도전기간 <span class="star">*</span></span>
      <input type="date" class="form_date" name="chStartDay" required>
      ~ <input type="date" class="form_date" name="chEndDay" required><br><br>
    </div>

    <div class="basic_form_2">
      <div class="flex-container">
        <div class="wrapper">
          <span class="form_title" align="right;">썸네일 <span class="star">*</span></span>
          <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
               class="image-box"/>
          <input type="file" accept="image/*" name="fileNo" id="fileNo" onchange="uploadImage();"/>
          <input type="hidden" name="resultFileNo" value="">
        </div>
      </div>
    </div>
  </div>


  <div class="template">
    <div class="info_title">
      <h2>탬플릿 폼</h2>
      <div class="bar_2"></div>
      <br>
    </div>

    <!-- for문 -->
    <c:forEach var="temp" items="${templateList}">

    <!-- 탬플릿 폼 안 영역 시작-->
    <div class="temp_content">

      <!-- select 문 일 경우-->
      <c:if test="${temp.inputType eq 'select'}">
        <div class="select">
          <span class="sub_title">${temp.chSubTitle}</span>

          <select class="select_class" name="${temp.categoryTemplateNo}_${temp.inputType}">
            <c:forEach var="code" items="${temp.codeList}">
              <option value="${code.code}">${code.codeName}</option>
            </c:forEach>
          </select>
        </div>
        <br>
      </c:if>


      <!-- checkbox 일 경우 -->
      <c:if test="${temp.inputType eq 'checkbox'}">
        <div class="checkbox">
          <span class="sub_title">${temp.chSubTitle}</span>

          <div class="checkbox_class">

            <c:forEach var="code" items="${temp.codeList}">
              <input type="checkbox" id=“${temp.categoryTemplateNo}_${code.code}”
                     name="${temp.categoryTemplateNo}_${temp.inputType}" value="${code.code}">
              <label for=“${temp.categoryTemplateNo}_${code.code}”
                     class="check_font"><span> ${code.codeName}</span> </label>
            </c:forEach>

          </div>
        </div>
        <br>
      </c:if>


      <!-- radio 일 경우 -->
      <c:if test="${temp.inputType eq 'radio'}">

        <div class="radio">
          <span class="sub_title">${temp.chSubTitle}</span>

          <div class="radio_class">

            <c:forEach var="code" items="${temp.codeList}">
              <input type="radio" id=“${temp.categoryTemplateNo}_${code.code}”
                     name=“${temp.categoryTemplateNo}_${temp.inputType}” value="${code.code}">
              <label for=“${temp.categoryTemplateNo}_${code.code}”>
                <span class="radio_font">${code.codeName}</span>
              </label>
            </c:forEach>

          </div>
        </div>
        <br>
      </c:if>


      <!-- text 일 경우 -->
      <c:if test="${temp.inputType eq 'text'}">
        <div class="text">
          <span class="sub_title">${temp.chSubTitle}</span>

          <div class="text_class">
            <input type="text" class="text_size" name=“${temp.categoryTemplateNo}_${temp.inputType}”>
          </div>

        </div>
        <br>
      </c:if>


      <!-- textarea 일 경우 -->
      <c:if test="${temp.inputType eq 'textarea'}">
        <div class="textarea">
          <span class="sub_title">${temp.chSubTitle}</span> <br>

          <div class="textarea_class">
                    <textarea name="${temp.categoryTemplateNo}_${temp.inputType}" id="" cols="95" rows="10"
                              class="textarea_font" style="resize:none;">나는 textarea다!!!</textarea>
          </div>
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
                  <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
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

          <div class="number_class">
            <input type="number" name="${temp.categoryTemplateNo}_${temp.inputType}" min="0" max="100"
                   step="1"
                   class="number_size">
          </div>
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
                   class="range_size">
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
                   class="datetime_size">
          </div>
        </div>
      </c:if>
      </c:forEach>

    </div>
    <!-- 탬플릿 폼 안 영역 끝-->
  </div>


  <div class="btn_div">
    <button class="btn_1" onclick="open_request();">챌린지 오픈 요청하기</button>
    <button class="btn_1">다음 챌린지를 기약하기</button>
  </div>


  <script type="text/javascript">
      $(document).on("change", ".fileUpload", function () {
          let $this = $(this);
          let fileInput = $(this)[0].files[0];
          let categoryTemplateNo = $(this).data('categoryTemplateNo');
          let inputType = $(this).data('inputType');

          if (fileInput) {
              let imageType = /^image\//;

              if (!imageType.test(fileInput.type)) {
                  // 이미지 파일이 아닐 경우 처리
                  console.error('Selected file is not an image.');
                  return;
              }

              let formData = new FormData();
              formData.append('file', fileInput);

              $.ajax({
                  url: '/challenge/file-upload',
                  type: 'POST',
                  data: formData,
                  processData: false,
                  contentType: false,
                  success: function (response) {
                      // 업로드 성공 시 처리
                      console.log('Image uploaded successfully.');
                      $this.siblings(".image-box").attr("src", response.filePath);
                      $("input[name=" + categoryTemplateNo + "_" + inputType + "]").val(response.fileNo);

                  },
                  error: function () {
                      // 업로드 실패 시 처리
                      console.error('Image upload failed.');
                  }
              });
          } else {
              // 파일이 선택되지 않았을 경우 처리
              console.error('No file selected.');
          }
      });

      function uploadImage() {
          let fileInput = $('#fileNo')[0].files[0];
          if (fileInput) {
              let imageType = /^image\//;

              if (!imageType.test(fileInput.type)) {
                  // 이미지 파일이 아닐 경우 처리
                  console.error('Selected file is not an image.');
                  return;
              }

              let formData = new FormData();
              formData.append('file', fileInput);

              $.ajax({
                  url: '/challenge/file-upload',
                  type: 'POST',
                  data: formData,
                  processData: false,
                  contentType: false,
                  success: function (response) {
                      // 업로드 성공 시 처리
                      console.log('Image uploaded successfully.');
                      $("#fileNo").siblings(".image-box").attr("src", response.filePath);
                      $("input[name=resultFileNo][type=hidden]").val(response.fileNo);
                      console.log("fileNo : ", $("input[name=resultFileNo][type=hidden]").val(response.fileNo));
                  },
                  error: function () {
                      // 업로드 실패 시 처리
                      console.error('Image upload failed.');
                  }
              });
          } else {
              // 파일이 선택되지 않았을 경우 처리
              console.error('No file selected.');
          }

      }


      function open_request() {
          let chTitle = $("input[name=chTitle]");                     //챌린지명
          let categoryNo = $("input[name=categoryNo]").val();         // 카테고리일련번호   값!!!
          let chStartDay = $("input[name=chStartDay]");               // 챌린지시작일
          let chEndDay = $("input[name=chEndDay]");                   // 챌린지종료일
          let fileNo = $("input[name=resultFileNo][type=hidden]").val();  // 파일번호

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
          let challengeData = { // 기본 정보 데이터
              chTitle: chTitle.val()
              , categoryNo: categoryNo
              , chStartDay: chStartDay.val()
              , chEndDay: chEndDay.val()
              , memberId: "${loginUser.memberId}"
              , fileNo: fileNo
              , list: list
          }

          console.log("챌린지 오픈 요청_기본정보용 data : ", challengeData);
          console.log("디테일 정보 list : ", list);

          $.ajax({
              url: "/openRequest.chall"
              , type: "post"
              , data: JSON.stringify(challengeData)
              , contentType: 'application/json'
              , success: function (result) {
                  if (result > 0) {
                  } else {
                  }
                  location.href="/main.chall"
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