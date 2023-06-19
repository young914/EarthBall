<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

	<!-- 로그인 영역 -->
    <header>

    	<c:if test="${ not empty alertMsg }">
    		<script>
    			alert("${alertMsg}");
    		</script>
    		<c:remove var="alertMsg" scope="session"/>
    	</c:if>


    	<!-- 로고+로그인 -->
        <div class="header">
            <div style="width: 200px;"></div>
            <div class="logo">
                <div><img src="/resources/fo/img/logo.png"></div>
                <div onclick="location.href='/main'">지구공</div>
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
		                <div>${loginUser.memberName}님</div>
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
	                	<div><a href="cart.me"><i class="xi-market"></i></a></div>
	            	</c:otherwise>
        		</c:choose>
                <div></div>

            </div>
        </div>

        <!-- 매뉴바 -->
        <div class="menu">
            <div>
                <div class="dropdown">
                    <span class="dropbtn"> <a href="list.pro">장보기</a> </span>
                    <div class="dropdown-content">
                        <a href="categoryList.pro?category=선물꾸러미">선물꾸러미</a>
                        <a href="categoryList.pro?category=욕실">욕실</a>
                        <a href="categoryList.pro?category=식품">식품</a>
                        <a href="categoryList.pro?category=주방">주방</a>
                        <a href="categoryList.pro?category=생활">생활</a>
                        <a href="categoryList.pro?category=취미">취미</a>
                        <a href="categoryList.pro?category=음료용품">음료용품</a>
                        <a href="categoryList.pro?category=여성용품">여성용품</a>
                        <a href="categoryList.pro?category=반려동물">반려동물</a>
                        <a href="categoryList.pro?category=화장품">화장품</a>
                        <a href="categoryList.pro?category=문구">문구</a>
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
                    <span class="dropbtn"> <a href="/main.chall">챌린지</a></span>
                </div>

                <div class="dropdown">
                    <span class="dropbtn"> <a href="#">환경일기</a> </span>
                    <div class="dropdown-content">
                        <a href="">환경일기란?</a>
                        <a href="diaryListView.bo">일기 보기</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn"><a href="#">친환경 매장</a></span>
                    <div class="dropdown-content">
                        <form name="myForm" action='storeListView.st' method="POST">
                            <input type="hidden" name="memberId" value="${ loginUser.memberId}" />
                        </form>
                        <a href="#" onclick="javascript:document.myForm.submit();">매장찾기</a>
                        <a href="storeEnrollForm.st">매장등록신청</a>
                    </div>
                    
                </div>
                <div class="dropdown">
                    <span class="dropbtn"> <a href="#">고객센터</a> </span>
                    <div class="dropdown-content">
                        <a href="list.no">공지사항</a>
                        <a href="list.faq">FAQ</a>
                        <a href="list.bo">1:1문의</a>
                    </div>
                </div>
            </div>

            <div class="search">
                <form action="">
                    <input type="text" placeholder="서비스 준비중..." readonly>
                    <i class="xi-search"></i>
                </form>
            </div>

        </div>
    </header>
