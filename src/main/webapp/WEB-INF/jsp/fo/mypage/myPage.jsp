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
                <li><a href="" data-toggle="modal" data-target="#deleteForm">회원탈퇴</a></li>
            </ul>
        </div>
        
        <!-- 회원탈퇴를 누르면 나오는 모달창 -->
        <div class="modal fade" id="deleteForm">
        	<div class="modal-dialog modal-sm">
        		<div class="modal-content">
        		
        			<div class="modal-header">
        				<h4 class="modal-title">회원탈퇴</h4>
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        			
        			<form action="delete.me" method="post">
        				<div class="modal-body">
        					<div align="center">
        						탈퇴 후 복구는 불가능할 수 있습니다. <br>
        						정말로 탈퇴 하시겠습니까? <br>
        					</div>
        					<br>
        						<label for="memberPwd" class="mr-sm-2">비밀번호 확인 : </label>
        						<input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id='"memberPwd' name="memberPwd"> <br>
        						<input type="hidden" name="memberId" value="${ loginUser.memberId }"> 
        				</div>
        				
        				<div class="modal-footer" align="center">
        					<button type="submit" class="btn btn-danger">탈퇴하기</button>
        				</div>
        			</form>
        		</div>
        	</div>
        </div>
        
        <script>
			$(document).ready(function() {
			    $('a[data-toggle="modal"]').on('click', function(e) {
			        e.preventDefault();  // prevent navigation
			        var target = $(this).attr('data-target');
			        $(target).modal('show');
			    });
			});
			
			$(document).ready(function() {
			    $('#my-modal .my-button').on('click', function() {
			        console.log('Button clicked!');
			    });
			});

		</script>

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
        
        <div class="modal fade" id="deleteForm">
        	<div class="modal-dialog modal-sm">
        		<div class="modal-content">
        		
        			<div class="modal-header">
        				<h4 class="modal-title">회원탈퇴</h4>
        				<button type="button" class="close" data-dismiss="modal">&times;</button>
        			</div>
        			
        			<form action="delete.me" method="post">
        				<div class="modal-body">
        					<div align="center">
        						탈퇴 후 복구는 불가능할 수 있습니다. <br>
        						정말로 탈퇴 하시겠습니까? <br>
        					</div>
        					<br>
        						<label for="memberPwd" class="mr-sm-2">비밀번호 확인 : </label>
        						<input type="password" class="form-control mb-2 mr-sm-2" placeholder="비밀번호를 입력해주세요" id='"memberPwd' name="memberPwd"> <br>
        						<input type="hidden" name="memberId" value="${ loginUser.memberId }"> 
        				</div>
        				
        				<div class="modal-footer" align="center">
        					<button type="submit" class="btn btn-danger">탈퇴하기</button>
        				</div>
        			</form>
        		</div>
        	</div>
        </div>
        
        <script>
			$(document).ready(function() {
			    $('a[data-toggle="modal"]').on('click', function(e) {
			        e.preventDefault();  // prevent navigation
			        var target = $(this).attr('data-target');
			        $(target).modal('show');
			    });
			});
			
			$(document).ready(function() {
			    $('#my-modal .my-button').on('click', function() {
			        console.log('Button clicked!');
			    });
			});

		</script>
        


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
