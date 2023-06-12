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

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>


    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/fo/css/challenge/challengeMain.css">

    <!-- js 영역-->
    <script src="/resources/fo/js/challenge/challengeMain.js"></script>

</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

    <div class="mainSlide">
        <div><img src="/resources/fo/img/challBanner_1.png" style="margin-left: 150px;"></div>
        <div><img src="/resources/fo/img/challBanner_2.png" style="margin-left: 150px;"></div>
        <div><img src="/resources/fo/img/challBanner_3.png" style="margin-left: 150px;"></div>
        <div><img src="/resources/fo/img/challBanner_4.png" style="margin-left: 150px;"></div>
    </div>


<!-- 내용 영역 시작 -->
    <div class="wrap">

        <div id="title">
            <div id="title_1">
                <div id="bar_1"></div>
                <div id="title_text">에코 챌린지</div>
            </div>

            <!-- 로그인하고, 이메일 인증 받은 사람에게만 보이는 챌린지 오픈 버튼 -->
            <c:if test="${ not empty loginUser && loginUser.mailAuth eq '1'}">
                <div id="title_2">
                    <button class="btn_1" onclick="chall_open();">챌린지 오픈</button>
                </div>
            </c:if>
        </div>


        <div id="filter">

            <div id="filter_1">
                <h3>카테고리</h3>
                <div id="filter_1_1">
                    <ul>
                      <c:forEach var="category" items="${categoryList}">
                        <li><a class="btn_2" href="javascript:categoryFilter();">${category.categoryName}</a></li>
                      </c:forEach>
                    </ul>
                </div>
            </div>
            <div></div>

            <div id="filter_2">
                <h3>진행상태</h3>
                <div id="filter_3_1">
                    <ul>
                        <li><a class="btn_2" href="">진행 예정</a></li>
                        <li><a class="btn_2" href="">진행 중</a></li>
                        <li><a class="btn_2" href="">진행 완료</a></li>
                    </ul>
                </div>
            </div>
        </div>


        <div id="content">

            <!-- content_1 시작 -->
            <div id="content_1">
              <c:forEach var="chall" items="${challengeList}">
                <!-- 카드 한 장 시작 -->
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
                            <c:choose>
                                <c:when test="${chall.chStartDay le 'SYSDATE' &&  chall.chEndDay ge 'SYSDATE'}">
                                    <li><span class="tag">진행 중</span></li>
                                </c:when>
                                <c:when test="${chall.chStartDay lt 'SYSDATE'}">
                                    <li><span class="tag">진행 예정</span></li>
                                </c:when>
                                <c:otherwise>
                                    <li><span class="tag">진행 완료</span></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
              </c:forEach>
                <!-- 카드 한 장 끝 -->

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
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <!-- 챌린지 하나 끝 -->


                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="hot_chall">
                    <table class="hot_one">
                        <tr>
                            <td rowspan="2">
                                <img class="hot_img" style="width: 50px; height: 50px; border-radius: 5px;" src="/resources/fo/img/logo.png" alt="">
                            </td>
                            <td><span class="hot_title">제목이 들어갈 것임</span></td>
                        </tr>
                        <tr>
                            <td>
                                <span class="tags">#태그자리1</span>
                                <span class="tags">#태그자리2</span> <br>
                            </td>
                        </tr>
                    </table>
                </div>


            </div>
            <!-- Hot 챌린지 영역 끝 -->
        </div> <br><br>

        <!-- 페이징바 넣을 자리 시작 -->
        <div id="page">
            <div class="page_btn" align="center">


                <ul class="pagination">
                    <li> <a href="/main.chall?currentPage=1" class="first">처음 페이지</a> </li>

                  <c:choose>
                    <c:when test="${ pageInfo.currentPage eq 1}">
                      <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
                    </c:when>
                    <c:otherwise>
                      <li> <a href="/main.chall?currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
                    </c:otherwise>
                  </c:choose>


                  <c:forEach var="page" begin="${pageInfo.startPage}" end="${pageInfo.endPage}" step="1">
                    <li> <a href="/main.chall?currentPage=${page}" class="active num"> ${page} </a>  </li>
                  </c:forEach>
                  <!--
                    <li> <a href="#" class="num"> 2 </a>  </li>
                    <li> <a href="#" class="num"> 3 </a>  </li>
                    <li> <a href="#" class="num"> 4 </a>  </li>
                    <li> <a href="#" class="num"> 5 </a>  </li>
                  -->

                  <c:choose>
                    <c:when test="${pageInfo.currentPage eq pageInfo.maxPage}">
                      <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
                    </c:when>
                    <c:otherwise>
                      <li> <a href="/main.chall?currentPage=${[pageInfo.currentPage + 1]}" class="arrow_right" disabled> >> </a> </li>
                    </c:otherwise>
                  </c:choose>

                    <li> <a href="/main.chall?currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
                </ul>
            </div>
        </div>

        <!-- 페이징바 넣을 자리 끝 -->
    </div>
    <!-- 내용 영역 끝 -->

    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

    <script>
        function chall_open(){
            location.href = "/categoryList.chall";
        }

        // 챌린지 상세조회로 넘기기
        function challengeDetailView(chNo) {
            location.href="/detailView.chall?chNo=" + chNo;
        }


        // 메인 슬라이드
        $(function(){
            $('.mainSlide').slick({
                dots: true,
                autoplay : true,
                autoplaySpeed : 3000,
                speed : 1000,
                infinite : true
            });
        })


    </script>

</body>
</html>
