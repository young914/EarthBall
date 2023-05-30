<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!-- icon 관련 -->
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/css/common/header.css">
    <link rel="stylesheet" href="/resources/css/common/footer.css">

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
      .wrap div {
        /*border: 1px solid red;*/
        /* 지금부터 지정하는 가로세로길이는 테두리까지 포함한 사이즈임 */
        box-sizing: border-box;
      }

      /* 전체를 감싸는 wrap*/
      .wrap {
        width: 1200px;
        height: auto;
        min-height: 100px;
        overflow: hidden;
        margin: auto; /* 좌우로 항상 정정가운데에 위치시켜주는 속성 */
        padding-top: 170px;
        /* position : relative; */
      }

      /* 크게 세가지 영역 */
      /* header, content, footer */
      /* #header, #content, #footer {
          width: 100%;
      } */

      .wrap > div {
        width: 100%;
      }


      /* 영역별 높이 */
      #title {
        height: 5%;
      }

      .basic_info {
        height: 20%;
      }

      .template {
        height: 68%;
      }

      .btn_div {
        height: 8%;
      }


      /* 영역별 너비 */
      #title > div {
        float: left;
      }


      /* 타이틀 */
      #title {
        box-sizing: border-box;
        align-items: center;
        display: flex;
      }

      #title_text {
        width: 1000px;
        height: 50px;
        font-size: 40px;
        font-weight: bold;
        padding: 0px 0px 7px 10px;
        /* border : 1px solid red; */
      }

      #bar_1 {
        width: 12px;
        height: 70px;
        background-color: #146C94;
      }

      .btn_div {
        display: flex;
        justify-content: center
      }

      .btn_1 {
        background-color: #69abce;
        border: solid 1px #69abce;
        border-radius: 7px;
        width: 400px;
        height: 60px;
        color: white;
        font-weight: 700;
        font-size: 20px;
        margin: 20px;
      }


      .bar_2 {
        width: 170px;
        height: 6px;
        background-color: #146C94;
        margin: 0px 0px 0px 20px;
      }


      .info_title h2 {
        margin-left: 30px;
      }

      .info_title span {
        color: rgb(229, 84, 84);
        font-size: 18px;
        margin-left: 30px;
      }

      .star {
        color: rgb(229, 84, 84);
        font-size: 20px;
        font-weight: 800;
      }


      .form_title {
        font-size: 20px;
        font-weight: 800;
        margin-left: 50px;
        margin-top: 40px;

      }

      .form_text {
        width: 500px;
        height: 40px;
        border-radius: 5px;
        border: solid lightgray 1px;
        font-size: 18px;
        margin-left: 20px;
      }


      .form_date {
        height: 40px;
        border-radius: 5px;
        border: solid lightgray 1px;
        font-size: 18px;
        margin-left: 20px;
        width: 200px;
      }


      .basic_form_1 {
        width: 65%;
        display: inline-block;
      }

      .basic_form_2 {
        width: 30%;
        display: inline-block;
      }


      .sub_title {
        padding: 7px;
        display: inline-block;
        font-size: 20px;
        margin-left: 45px;
        border-radius: 5px;
        color: #146C94;
        font-weight: 900;
        border: #146C94 1px dashed;
        display: inline-block;
      }


      /* 화면에 선택적으로 뿌려지는 템플릿 폼들*/

      .sub_title {
        display: flex;
        width: 15%;
      }

      /* select 문 */
      .select {
        display: flex;
      }

      .select_class {
        font-size: 20px;
        left: 400px;
        justify-content: center;
        margin-left: 40px;
        width: 500px;
        text-align: center;
      }


      /* checkbox 문 */
      .checkbox {
        display: flex;
      }

      .checkbox_class {
        left: 400px;
        justify-content: center;
        margin-left: 35px;
      }

      .check_font span {
        font-size: 20px;
      }


      /* radio 문 */
      .radio {
        display: flex;

      }

      .radio_class {
        left: 400px;
        justify-content: center;
        margin-left: 35px;
      }

      .radio_font {
        font-size: 20px;
      }


      /* text 문 */
      .text {
        display: flex;
      }

      .text_class {
        margin-left: 40px;
        font-size: 20px;
      }

      .text_size {
        width: 500px;
        height: 34px;
      }


      /* textarea 문 */

      .textarea_class {
        margin-left: 46px;
      }

      .textarea_font {
        font-size: 20px;
      }


      /* 파일 */
      .file {
        display: flex;
      }

      .file_class {
        margin-left: 40px;
        font-size: 20px;

      }


      /* number 문 */
      .number {
        display: flex;
      }

      .number_class {
        margin-left: 40px;
      }

      .number_size {
        font-size: 20px;
        font-weight: normal;
        border: solid 1px rgb(173, 172, 172);
        height: 35px;
        text-align: center;
      }


      /* range 문 */
      .range {
        display: flex;
      }

      .range_size {
        height: 35px;
        margin-left: 40px;
      }


      /* datetime 문 */
      .datetime {
        display: flex;
      }

      .datetime_class {
        margin-left: 40px;
      }

      .datetime_size {
        font-size: 20px;
        font-weight: normal;
        border: solid 1px rgb(173, 172, 172);
        height: 35px;
        text-align: center;
      }

      /* 화면에 선택적으로 뿌려지는 템플릿 폼들*/


      /*--------------이미지 미리보기----------------*/
      HTML SCSS BabelResult Skip Results Iframe
      EDIT ON
      .flex-container {
        display: flex;
      }

      .wrapper {
        text-align: center;
        flex-grow: 1;
      }

      .image-box {
        width: 200px;
        height: 200px;
        object-fit: cover;
        display: block;
        margin: 20px auto;
      }

      .upload-btn {
        border: 1px solid #ddd;
        padding: 6px 12px;
        display: inline-block;
        cursor: pointer;
      }

      /*--------------이미지 미리보기----------------*/

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
            <input type="text" class="form_text" placeholder="챌린지명을 입력해주세요." name="chTitle"> <br><br>

            <span class="form_title">카테고리 <span class="star">&nbsp;</span></span>
            <input type="hidden" name="categoryNo" value="${category.categoryNo}">
            <input type="text" class="form_text" value="${category.categoryName}" readonly> <br><br>

            <span class="form_title">도전기간 <span class="star">*</span></span>
            <input type="date" class="form_date" name="chStartDay"> ~ <input type="date" class="form_date"
                                                                             name="chEndDay"><br><br>

        </div>

        <div class="basic_form_2">
            <div class="flex-container">
                <div class="wrapper">
                    <span class="form_title" align="right;">썸네일 <span class="star">*</span></span>
                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
                         class="image-box" />
                    <input type="file" accept="image/*" name="fileNo" id="fileNo" onchange="uploadImage();"/>
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

                        <c:forEach var="codeDto" items="${temp.codeDtoList}">
                            <option value=“${codeDto.code}”>${codeDto.codeName}</option>
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

                        <c:forEach var="codeDto" items="${temp.codeDtoList}">
                            <input type="checkbox" id=“${temp.categoryTemplateNo}_${codeDto.code}”
                                   name="${temp.categoryTemplateNo}_${temp.inputType}">
                            <label for=“${temp.categoryTemplateNo}_${codeDto.code}”
                                   class="check_font"><span> ${codeDto.codeName}</span> </label>
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

                        <c:forEach var="codeDto" items="${temp.codeDtoList}">
                            <input type="radio" id=“${temp.categoryTemplateNo}_${codeDto.code}”
                                   name=“${temp.categoryTemplateNo}_${temp.inputType}”>
                            <label for=“${temp.categoryTemplateNo}_${codeDto.code}”><span
                                    class="radio_font"> ${codeDto.codeName} </span></label>
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
                        <!--<input type="file" accept="/*">-->

                        <div class="basic_form_2">
                            <div class="flex-container">
                                <div class="wrapper">
                                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
                                         class="image-box"/>
                                    <label for="file" class="upload-btn">
                                        <input class="file" type="file"
                                               name=“${temp.categoryTemplateNo}_${temp.inputType}”
                                               accept="image/*"/>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="basic_form_2">
                            <div class="flex-container">
                                <div class="wrapper">
                                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
                                         class="image-box"/>
                                    <label for="file" class="upload-btn">
                                        <input class="file" type="file"
                                               name=“${temp.categoryTemplateNo}_${temp.inputType}”
                                               accept="image/*"/>
                                    </label>
                                </div>
                            </div>
                        </div>

                        <div class="basic_form_2">
                            <div class="flex-container">
                                <div class="wrapper">
                                    <img src="https://i0.wp.com/adventure.co.kr/wp-content/uploads/2020/09/no-image.jpg"
                                         class="image-box"/>
                                    <label for="file" class="upload-btn">
                                        <input class="file" type="file"
                                               name=“${temp.categoryTemplateNo}_${temp.inputType}”
                                               accept="image/*"/>
                                    </label>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br>
            </c:if>


            <!-- 파일일 경우 -->
            <c:if test="${temp.inputType eq 'file'}">
                <div class="file">
                    <span class="sub_title">${temp.chSubTitle}</span> <br>

                    <div class="file_class">
                        <input type="file" name=“${temp.categoryTemplateNo}_${temp.inputType}”>
                    </div>

                </div>
                <br>
            </c:if>

            <!-- number 일 경우 -->
            <c:if test="${temp.inputType eq 'file'}">
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
            <c:if test="${temp.inputType eq 'file'}">
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
            <c:if test="${temp.inputType eq 'file'}">
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


</div>

<!-- 내용 영역 끝 -->


<!-- 푸터 시작 -->
<div id="footer">
    <div><img src="/resources/img/logo2.png" style="width: 400px; padding-top: 20px;"></div>
    <div style="margin-top: 30px; color: white;">
        <p style="font-weight: bold;">
            이용약관 | 개인정보처리방침 | 도매 전용 B2B몰
        </p>
        <p>
            회사명 : 주식회사 인수온송민근 | 대표자 : 양선주 <br>
            주소 : 서울시 금천구 가산디지털2로 165, 1001호 | 이메일 : contact@jigugong.co.kr | 팩스 : 0303-3444-2050 <br>
            사업자등록번호 : 689-86-00791 | 통신판매업신고 : 제2018-서울동작-02955 | 건강기능식품영업신고 : 제2022-0112707 <br>
            개인정보보호책임자 : 양선주 | 고객센터 : 02-812-2050 | 호스팅 제공자 : (주)지구공
        </p>
    </div>
</div>
<!-- 푸터 끝 -->

<!--
<script>
    // 이미지 미리보기

    const fileDOM = document.querySelector('.file');
    const previews = document.querySelectorAll('.image-box');

    fileDOM.addEventListener('change', () => {
        const reader = new FileReader();
        reader.onload = ({target}) => {
            previews[0].src = target.result;
        };
        reader.readAsDataURL(fileDOM.files[0]);
    });

</script>
-->
<script type="text/javascript">

    function open_request() {
        let chTitle = $("input[name=chTitle]");                     //챌린지명
        let categoryNo = $("input[name=categoryNo]").val();         // 카테고리일련번호   값!!!
        let chStartDay = $("input[name=chStartDay]");               // 챌린지시작일
        let chEndDay = $("input[name=chEndDay]");                   // 챌린지종료일

        let data = {
            chTitle: chTitle.val()
            , categoryNo: categoryNo
            , chStartDay: chStartDay.val()
            , chEndDay: chEndDay.val()
        }

        console.log("챌린지 오픈 요청_기본정보용 data : " + data);

        $.ajax({
            url: "/openRequest.chall"
            , type: "post"
            , data: data
            , success: function () {
                alert("챌린지 오픈 요청이 되었습니다.");
                console.log("챌린지 오픈 요청 성공");
                location.href = "/main.chall";
            }
            , error: function () {
                alert("챌린지 오픈 요청이 되지 않았습니다.");
                console.log("챌린지 오픈 요청 실패");
            }
        });
        return true;
    }

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
                url: '/chanllenger/file-upload',
                type: 'POST',
                data: formData,
                processData: false,
                contentType: false,
                success: function (response) {
                    // 업로드 성공 시 처리
                    console.log('Image uploaded successfully.');
                    $("#fileNo").siblings(".image-box").attr("src", response.filePath);
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

</script>

</body>
</html>