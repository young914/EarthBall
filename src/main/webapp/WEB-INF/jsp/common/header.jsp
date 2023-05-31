<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 로그인 영역 -->
    <header>

    	<!-- 로고+로그인 -->
        <div class="header">
            <div style="width: 200px;"></div>
            <div class="logo">
                <a href="home">
                    <img src="/resources/img/logo.png">
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
                        <a href="">#</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn"><a href="storeListView.st">매장찾기</a></span>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">고객센터</span>
                    <div class="dropdown-content">
                        <a href=""></a>
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