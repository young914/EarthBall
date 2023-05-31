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

    <jsp:include page="../../common/common.jsp"/>


    <!-- CSS 영역-->
    <link rel="stylesheet" href="/resources/css/member/challenge/challengeMain.css">

    <!-- js 영역-->
    <script src="/resources/js/member/challenge/challengeMain.js"></script>

</head>
<body>

<jsp:include page="../../common/header.jsp"/>

    <div id="banner">
        <div><img src="/resources/img/challBanner_1.png" alt="" style="width:100%; height: 430px; align-items: center"></div>
        <div><img src="/resources/img/challBanner_2.png" alt="" style="width:100%; height: 430px; align-items: center"></div>
        <div><img src="/resources/img/challBanner_3.png" alt="" style="width:100%; height: 430px; align-items: center"></div>
    </div>


<!-- 내용 영역 시작 -->
    <div class="wrap">

        <div id="title">
            <div id="title_1">
                <div id="bar_1"></div>
                <div id="title_text">에코 챌린지</div>
            </div>

            <!-- 로그인 한 사람에게만 보이는 챌린지 오픈 버튼 -->
            <c:if test="${ not empty loginUser }">
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
        </div> <br><br>
        <!-- 페이징바 넣을 자리 시작 -->
        <div id="page">
            <div class="page_btn" align="center">
                <ul class="pagination">
                    <li> <a href="#" class="first">처음 페이지</a> </li>
                    <li> <a href="#" class="arrow_left"> << </a>  </li>

                    <li> <a href="#" class="active num"> 1 </a>  </li>
                    <li> <a href="#" class="num"> 2 </a>  </li>
                    <li> <a href="#" class="num"> 3 </a>  </li>
                    <li> <a href="#" class="num"> 4 </a>  </li>
                    <li> <a href="#" class="num"> 5 </a>  </li>

                    <li> <a href="#" class="arrow_right"> >> </a> </li>
                    <li> <a href="#" class="last">끝 페이지</a> </li>
                </ul>
            </div>
        </div>

        <!-- 페이징바 넣을 자리 끝 -->
    </div>
    <!-- 내용 영역 끝 -->

    <jsp:include page="../../common/footer.jsp"/>

    <script>
        function chall_open(){
            location.href = "/categoryList.chall";
        }
    </script>

</body>
</html>