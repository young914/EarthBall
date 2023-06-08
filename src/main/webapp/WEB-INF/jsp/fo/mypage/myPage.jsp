<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
		  /* 카테고리 */
        body {
        margin: 0;
        font-family: Arial, sans-serif;
        height: 1200px;
    }
    
    /* 추가된 스타일 */
    .flex-container {
        display: flex;
	    justify-content: center; 
	    width: 50%;
	    margin: auto;
	    position: relative;  /* 추가 */
    	left: -60px;
	    
    }

    .sidebar {
        width: 200px;
        height: 100vh;
        background-color: transparent;  /* 배경색을 투명하게 설정 */
        color: black;
        padding: 20px;
        box-sizing: border-box;
        text-align : center;
    }

    .main-content {
    flex-grow: 1;
    box-sizing: border-box; /* Add this line*/ 
    background-color: #AFD3E3; /* 하늘색으로 배경색 설정 */
    padding: 5px; /* 내용과 테두리 사이에 간격 설정 */
    border-radius: 8px; /* 테두리를 둥글게 만듭니다 (선택 사항) */
    width : 50%;
    height: 130px;
    position: relative;
    left: 130px;
    top : 30px;
        
    }

    .sidebar ul {
        list-style: none;
        padding: 0;
    }

    .sidebar ul li {
        margin-bottom: 10px;
    }

    .sidebar ul li a {
        color: black;  /* 링크 색상을 검은색으로 변경 */
        text-decoration: none;
    }

    .divider {
        border-bottom: 4px solid #146C94;
        margin: 20px 0;
        width: 100%; /* 또는 원하는 너비 */
        display: block;
        margin: 1 auto; /* 구분선을 중앙으로 */
    }

    .divider2 {
        border-bottom: 4px solid black;
        margin: 20px 0;
        width: 50%; /* 또는 원하는 너비 */
        display: block;
        margin: 1 auto; /* 구분선을 중앙으로 */
    }

    .profile-picture {
        position: relative;
        left: 40px;
        top : 34px
    }

    .text-content p {
        position: relative;
        left : 80px;
    }


    .main-content2 {
        position: relative;
        right: 0px;
        top : 400px;
    }

    .main-content2 p {
        font-size : 20px;
        position: relative;
        top : 100px;
        left : 200px;

    }

    .text-content {
        position: relative;
        left : 50px;
    }

		
</style>
<title>마이페이지</title>
</head>
<body>

		<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />
		
		<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
		
	
		<% Boolean isEmailVerified = (Boolean)session.getAttribute("isEmailVerified"); %>
        
		<c:if test="${isEmailVerified == null || !isEmailVerified}">
		
            <div class="flex-container">
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2 class="divider"></h2>
            <ul class="menu1">
                <li><a href="#">이메일 인증 확인</a></li>
                <li><a href="updateInfo.me">내 정보 수정</a></li>
                <li><a href="delete.me">회원탈퇴</a></li>
            </ul>
        </div>
            		<div class="main-content">
                <img class="profile-picture" src="/resources/fo/profile/dafaultProfile.png" alt="Profile Picture" style="width: 50px; height: 50px; float: left; margin-right: 20px;">
                <input  type="file" align="left">
            <div class="text-content">
                <h1>${loginUser.memberName}님 환영합니다!</h1>
                <p>이메일 인증을 완료해주세요!</p>
            </div>
        </div>
        </div>
            
            </c:if>
            
            <c:if test="${isEmailVerified != null && isEmailVerified}">
            
            <div class="flex-container">
        <!-- Sidebar Menu -->
        <div class="sidebar">
            <h2 class="divider"></h2>
            <ul class="menu1">
                <li><a href="#">참여현황</a></li>
                <li><a href="#">주문 관리</a></li>
                <li><a href="#">찜 목록</a></li>
                <li><a href="#">1:1문의</a></li>
                <li><a href="#">포인트 내역</a></li>
                <li><a href="updateInfo.me">내 정보 수정</a></li>
                <li><a href="delete.me">회원탈퇴</a></li>
            </ul>
        </div>
            
        <div class="main-content">
                <img class="profile-picture" src="your-image-source.jpg" alt="Profile Picture" style="width: 50px; height: 50px; float: left; margin-right: 20px;">
            <div class="text-content">
                <h1>${loginUser.memberName}님 환영합니다!</h1>
                <p>오늘의 챌린지는 참여하셨나요?</p>
            </div>

            <!-- 참여 현황 등 / 누르면 뜨게끔 하고 싶음 -->
            
            <div class="main-content2" style="padding: 20px; margin-top: 20px;">
                <h2>참여 현황</h2>
                <p>아직 참여하신 챌린지, 일기가 없어요~!</p>
            </div>
        </div>
        </div>
        
        </c:if>
       
    
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    
    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

 

</body>
</html>