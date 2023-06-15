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
	<style>
		.modal {
		  display: none;
		  position: fixed;
		  z-index: 1;
		  left: 0;
		  top: 0;
		  width: 100%;
		  height: 100%;
		  overflow: auto;
		  background-color: rgba(0, 0, 0, 0.5);
		}
		
		.modal-content {
		  background-color: #fefefe;
		  margin: 15% auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 50%; /* 모달 창의 너비 조정 */
		  max-width: 600px; /* 모달 창의 최대 너비 설정 */
		}
		
		.close {
		  color: #aaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: black;
		  text-decoration: none;
		  cursor: pointer;
		}

	</style>
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
                    <span class="point">0</span>
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
    
    <div id="myModal" class="modal">
            <div class="modal-content">
                <span class="close" onclick="closeModal()">&times;</span>
                <h2>프로필 사진 수정</h2>
                <!-- 프로필 사진 수정 내용 추가 -->
                <!-- 예시로 파일 선택을 위한 input 태그를 추가하였습니다 -->
                <input type="file" id="profileImageInput">
                <button onclick="updateProfile()">프로필 사진 업데이트</button>
            </div>
        </div>
    
    
    <script>
		    function openModal() {
		        document.getElementById("myModal").style.display = "block";
		    }
		
		    // 모달 창 닫기
		    function closeModal() {
		        document.getElementById("myModal").style.display = "none";
		    }
		
		    // 프로필 사진 업데이트 로직 추가
		    function updateProfile() {
		        // 프로필 사진 업데이트 로직을 구현합니다.
		        // 선택된 파일을 가져오거나 AJAX 요청 등을 사용하여 업데이트를 처리할 수 있습니다.
		    }
		
		    // 마우스를 가져다 댔을 때 커서를 클릭 커서로 변경
		    var profilePicture = document.querySelector(".profile-picture");
		    profilePicture.addEventListener("mouseover", function() {
		        profilePicture.style.cursor = "pointer";
		    });
	</script>
	
    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

</body>
</html>
