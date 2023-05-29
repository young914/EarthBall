<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<Style>

	html, body{
    	margin: 0;
    	padding: 0;
    }
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
    /* 공통영역스타일 */
    #container{
        width: 1200px;
        height: 100%;
        margin: 0 auto;
        margin-bottom: 100px;
        padding-top: 170px;
        /* background-color: aliceblue; */
    }
</Style>
</head>
<body>

	<!-- 로그인 영역 -->
    <header>

    	<!-- 로고+로그인 -->
        <div class="header">
            <div style="width: 200px;"></div>
            <div class="logo">
                <a href="">
                    <img src="../resources/logo.png">
                    <div>지구공</div>
                </a>
            </div>
            <div class="login-area">
                <div></div>
                <div><a href="">로그인</a></div>
                |
                <div><a href="">회원가입</a></div>
                <div></div>
                <!-- <div><a href="">로그아웃</a></div>|
                <div><a href=""><i class="xi-user"></i></a></div>|
                <div><a href=""><i class="xi-market"></i></a></div> -->
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
    </header>

</body>
</html>