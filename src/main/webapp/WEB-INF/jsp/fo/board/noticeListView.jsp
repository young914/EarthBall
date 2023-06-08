<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>
 <link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>



    <script>
        $(function(){
            $('.mainSlide').slick({
                dots: true,
                autoplay : true,
                autoplaySpeed : 1000,
                speed : 2000,
                infinite : true
            });
            // $('.mainSlide').slick({
            //     dots: true,
            //     infinite: true,
            //     speed: 500,
            //     fade: true,
            //     cssEase: 'linear'
            // });
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

    <style>
      html, body{
    margin: 0;
    padding: 0;
}

/* 폰트 */
*{font-family: 'Jua', sans-serif;}

 /* header */
header{
    position: fixed;
    left: 0;
    right: 0;
    top: 0;
    z-index: 9999;
    background-color: white;
    /* bottom 그림자 효과 */
    box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);
}
.header{
    width: 1200px;
    height: 110px;
    margin: 0 auto;
    display: flex;
    justify-content: space-between;
}
.menu{
    width: 1200px;
    height: 38px;
    margin: 0 auto;
    margin-bottom: 30px;
    display: flex;
    justify-content: space-between;
}
.login-area{
    display: flex;
    justify-content: space-between;
    width: 200px;
    margin-top: 30px;
    color: #19A7CE;
}
.login-area a{
    text-decoration: none;
    color: #19A7CE;
}
.logo{width: 250px;}
.logo a{
    text-decoration: none;
    color: #19A7CE;
    display: flex;
    align-items: center;
    justify-content: center;
    margin-top: 10px;
}
.logo img{
    width: 80px;
    height: 80px;
    padding: 5px;
}
.logo div{
    font-size: 40px;
    padding: 5px;
}


/* 드롭다운 */
.dropdown{
    position : relative;
    display : inline-block;
}
.dropdown-content{
    /* display : none; */
    position : absolute;
    z-index : -99; /*다른 요소들보다 앞에 배치*/
    background-color : white;
    width : 100px;
    border-radius : 8px;
    box-shadow : 0 0 10px rgba(0,0,0,0.2);
    opacity: 0;
    transition: 0.3s;
}
.dropdown-content a{
    display : block;
    text-decoration : none;
    color : black;
    padding: 10px;
    transition: 0.3s;
}
.dropdown-content a:hover{
    background-color : #19A7CE;
    color : white;
    border-radius: 8px;
}
.dropdown:hover .dropdown-content{
    display : block;
    z-index: 1;
    opacity: 1;
}
.dropdown>span{
    display: block;
    margin: 10px;
    cursor: pointer;
    color: #19A7CE;
}
.dropdown>span>a{
    text-decoration: none;
    color: #19A7CE;
}
.dropdown-content a{
    color : #19A7CE;
}

.search>form {
    position: relative;
    width: 200px;
}
.search>form>input {
    border: 1px solid #bbb;
    border-radius: 8px;
    padding: 10px 12px;
    font-size: 14px;
}
.search>form>i {
    position : absolute;
    width: 17px;
    top: 10px;
    right: 30px;
    margin: 0;
}

        /* ---------------------------------- */

        .search2>form {
            position: relative;
            width: 200px;

        }

        .search2>form>img {
            position : absolute;
    width: 17px;
    top: 10px;
    right: 30px;
    margin: 0;
        }

        .search2>form>input {
           border: 1px solid #bbb;
		    border-radius: 8px;
		    padding: 10px 12px;
		    font-size: 14px;
        }

        /* ---------------------------------- */

        /* 메인영역 */
        #container{
            width: 1200px;
            height: 3000px;
            margin: 0 auto;
            padding-top: 170px;
            /* background-color: aliceblue; */
        }

        /* 공지사항 */
        table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

        #boardtext {
        background-color:#ffffff;
        border: solid 0.1rem #19a7ce;
        border-radius: 0.7rem;
        color: #19a7ce;
        font-family : Roboto, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 500;
        line-height: 1.1725;
        text-align: center;
        }

        .auto-group-t8bp-ei9 {
        align-items:  center;
        flex-shrink:  0;
        height : 4.6rem;
        margin-bottom: 11.9rem;
        width: 100%;
        }

        .btn-group { float: right; }

        #list, #insertList { /* 버튼크기를 지정 */
            height : 40px;
            width : 90px;
        }

        #QZWUheUHEXEqWaaaEWt8BP {
        background-color: #19a7ce;
        box-shadow: 0 0.4rem 0.4rem rgba(0, 0, 0, 0.25);
        color: #ffffff;
        display: flex;
        font-family: Inter, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 400;
        line-height: 1.2125;
        white-space: nowrap;
        width: 36.4rem;
        }

        /* 메인영역 */
        #container{
            width: 70%;
            height: 3000px;
            margin: 0 auto;
            padding-top: 170px;
            /* background-color: aliceblue; */
        }


        /* ------------- 푸터 --------------------- */
       #footer{
    width: 100%;
    height: 220px;
    margin: 0 auto;
    background-color: #19A7CE;
    display: flex;
    justify-content: space-evenly;
	}
	.logoArea{
	    width: 250px;
	    height: 100px;
	    margin-top: 60px;
	    color: white;
	    display: flex;
	    align-items: center;
	    font-size: 50px;
	}
	.logoArea img{
	    width: 100px;
	    height: 100px;
	    padding: 5px;
	    border-radius: 50%;
	}
	.logoArea div{
	    margin-left: 10px;
	    padding: 5px;
	    /* 그림자효과 */
	    text-shadow: 2px 2px 10px gray;
	}

	/*-------------  버튼 스타일 ---------------*/

		#page {
		  text-align: center;
		  display: inline-flex;
		  align-items: center;
		  justify-content: space-around
		}
		.page_btn {
		  align-items: center;
		}
		.pagination {
		  list-style: none;
		  padding: 0;
		  margin-top: 20px;
		}
		.pagination li {
		  display: inline;
		  text-align: center;
		}
		/* 숫자들에 대한 스타일 지정 */
		.pagination a {
		  float: left;
		  display: block;
		  font-size: 14px;
		  text-decoration: none;
		  padding: 5px 12px;
		  color: #797979;
		  line-height: 1.5;
		}
		.first { margin-right: 15px; }
		.last { margin-left: 15px; }
		.first:hover, .last:hover, .arrow_left:hover, .arrow_right:hover {
		  color: #146C94;
		}
		.pagination a:active {
		  cursor: default;
		  color: #69ABCE;
		}
		.pagination a:active {
		  outline: none;
		}
		.num {
		  margin-left: 3px;
		  padding: 0;
		  width: 30px;
		  -moz-border-radius: 100%;
		  -webkit-border-radius: 100%;
		  border-radius: 100%;
		}
		.num:hover {
		  background-color: #146C94;
		  color: #FFFFFF;
		}
		.num:active, .modal .num:active {
		  background-color: #69ABCE;
		  cursor: pointer;
		}

		.title{
            width : 250px;
            height : 70px;
            margin : 30px 0px 0px 15px;
            box-sizing : border-box;
            align-items : center;
            display : flex;
        }

           .bar {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

         .title_text{
            width : 200px;
            height : 50px;
            font-size : 40px;
            font-weight : bold;
            padding : 0px 0px 7px 10px;
        }




    </style>
</head>
<body>
    <!-- 로그인 영역 -->
    	<!-- 로그인 영역 -->
    <header>

    	<!-- 로고+로그인 -->
        <div class="header">
            <div style="width: 200px;"></div>
            <div class="logo">
                <a href="home">
                    <img src="/resources/fo/img/logo.png">
                    <div>지구공</div>
                </a>
            </div>
            <div class="login-area">
                <div></div>
                <c:choose>
	            	<c:when test="${empty loginUser}">
		                <!-- 로그인 전 링크 -->
		                <div><a href="loginForm.me">로그인</a></div>
		                |
		                <div><a href="mem.me">회원가입</a></div>
	            	</c:when>
	            	<c:otherwise>
		                <!-- 로그인 후 링크 -->
		                <div><a href="myPage.me">${loginUser.memberName}님</a></div>
		                |
		                <div><a href="logout.me"><i class="xi-power-off"></i></a></div>
		                |
	                	<c:choose>
			                <c:when test="${loginUser.memberId eq 'admin'}">
			                	<div><a href="admin"><i class="xi-user"></i></a></div>
			                </c:when>
			                <c:otherwise>
			                	<div><a href="myPage.me"><i class="xi-user"></i></a></div>
			                </c:otherwise>
	                	</c:choose>
	                	|
	                	<div><a href=""><i class="xi-market"></i></a></div>
	            	</c:otherwise>
        		</c:choose>
                <div></div>

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
                        <a href="list.pro">전체</a>
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
                        <a href="/main.chall">참여 게시판</a>
                        <a href="#">인증 게시판</a>
                    </div>
                </div>

                <div class="dropdown">
                    <span class="dropbtn">환경일기</span>
                    <div class="dropdown-content">
                     	<a href="">환경일기란?</a>
                        <a href="diary.bo">일기 보기</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn"><a href="storeListView.st">매장찾기</a></span>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">고객센터</span>
                    <div class="dropdown-content">
                        <a href="list.no">공지사항</a>
                        <a href="list.faq">FAQ</a>
                        <a href="list.bo">1:1문의</a>
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
    </header>





    <div id="container">

        		<!-- 배너 -->
				<div class="title">
                <div class="bar"></div>
                <div class="title_text">고객센터</div>
				</div>



        <!-- 공지사항 -->
        <div class="board" style="padding-top: 10px">



                <br/>



                     <table>
                <thead>
                    <tr>
                        <th colspan="8"><h1 id="boardtext">공지사항</h1>
                            <h4 style="text-align: center;">배송 및 운영관련 공지사항 게시판입니다.</h4>
                            <span class="btn-group"> <!-- 버튼 관련 class -->
                                <button id="insertList">작성</button></th>
                            </span>
                    </tr>

                    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                        <div class="container-fluid">
                          <a class="navbar-brand" href="list.no">공지사항</a>
                          <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                          </button>
                          <div class="collapse navbar-collapse" id="navbarColor01">
                            <ul class="navbar-nav me-auto">
                              <li class="nav-item">
                                <a class="nav-link" href="list.bo">1:1문의</a>
                              </li>
                              <li class="nav-item">
                                <a class="nav-link" href="list.faq">FAQ</a>
                              </li>
                            </ul>
                          </div>
                        </div>
                      </nav>


                    <tr>
                        <th>No</th>
                        <th>제목</th>
                        <th>글쓴이</th>
                        <th>작성일자</th>
                    </tr>
                </thead>

                <tbody>
                	<c:forEach var="b" items="${ list }">

                    <tr>
                        <td class="bno">${ b.boardNo }</td>
                        <td><a href="${pageContext.request.contextPath}/detail.bo?bno=${b.boardNo}">${ b.boardTitle }</a></td>
                        <td>${ b.memberId }</td>
                        <td>${b.boardDate }</td>
                    </tr>
                   </c:forEach>
                    <tr>

                </tbody>
            </table>

            <br>

               <!--  <div>
                <div id="page-numbers" style="text-align: center;">
                </div> -->

				<div id="page_search" align="center">
                <div id="page">
			    <div class="page_btn">
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

            <br><br>

			<div id="search2-1"align="center">
            <div class="search2">
                <form action="">
                    <input type="text" placeholder="검색어 입력">
                    <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
                </form>
            </div>
            </div>

         </div>
         <!-- page_search div -->

            <br>
            <br>

    </div>
   </div>





   <!--  <script>
        var totalPages = 5;
        var currentPage = 1;
        var pageNumbers = document.getElementById("page");

    // 페이지 버튼 생성
        for (var i = 1; i <= totalPages; i++) {
            var button = document.createElement("button");
                button.innerHTML = i;
                button.addEventListener("click", function() {
                currentPage = parseInt(this.innerHTML);
                updateButtons();
          });
            pageNumbers.appendChild(button);
        }

</script> -->

<div id="footer">
        <div style="width: 100px;"></div>

        <div class="logoArea">
            <img src="/resources/fo/img/logo.png">
            <div>지구공</div>
        </div>

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


</body>
</html>