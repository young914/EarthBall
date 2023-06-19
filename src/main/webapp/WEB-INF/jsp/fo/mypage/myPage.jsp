<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <title>마이페이지</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
</head>
<body>

	<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />


	<% Boolean isEmailVerified = (Boolean)session.getAttribute("isEmailVerified"); %>

		<c:if test="${isEmailVerified == null || !isEmailVerified}">
			<div id="container">
				<!-- Sidebar Menu -->
				<div class="sidebar">
					<h2 class="divider"></h2>
					<ul class="menu1">
						<li><a href="#">이메일인증</a></li>
						<li><a href="updateInfo.me">내 정보 수정</a></li>
						<li><a href="delete.me">회원탈퇴</a></li>
					</ul>
				</div>

				<div class="main-content">
					<div class="profile">
						<div class="profile-1">
							<img class="profile-picture" src="/resources/fo/img/logo.png">
							<div>
								<p class="memberName">${loginUser.memberName}님 환영합니다!</p>
								<p style="margin: 0;">이메일 인증을 완료해주세요! </p>
							</div>
						</div>
						<div class="profile-2">
							포인트 <br>
							<span class="point">${loginUser.totalPoint}</span>
						</div>
					</div>
				</div>
			</div>
        </c:if>

		<c:if test="${isEmailVerified != null && isEmailVerified}">
			<!-- 메인 컨텐츠 -->
			<div id="container">
				<!-- Sidebar Menu -->
				<jsp:include page="/WEB-INF/jsp/fo/common/myPageSidebar.jsp" />
				<div class="main-content">
					<jsp:include page="/WEB-INF/jsp/fo/common/mypageProfile.jsp" />
				</div>
			</div>
		</c:if>

    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

</body>
</html>
