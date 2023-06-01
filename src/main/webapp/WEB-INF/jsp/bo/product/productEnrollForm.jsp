<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>상품</title>
<style>
	#navbar-main{
		background-color: #19a7ce;
	}
	.listArea{
		width: 100%;
		height: 100%;
		padding: 50px;
	}
	.title{
		display: flex;
	}
    .listArea table{
        width: 100%;
        margin-top: 20px;
    }
    .listArea table input{
        width: 400px;
    }
    .listArea table tr{
        height: 50px;
    }
    .btn-area{
        margin-top: 30px;
    }
    .btn-area>button, .btn-area>input{
        width: 100px;
        height: 30px;
        border: none;
        border-radius: 10px;
        background-color: #19a7ce;
        color: white;
    }
</style>
</head>
<body>
	<!-- 사이드바 -->
	 <nav class="navbar navbar-vertical fixed-left navbar-expand-md navbar-light bg-white" id="sidenav-main">
	   <div class="container-fluid">
	     <!-- Toggler -->
	     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#sidenav-collapse-main" aria-controls="sidenav-main" aria-expanded="false" aria-label="Toggle navigation">
	       <span class="navbar-toggler-icon"></span>
	     </button>
	     <!-- 메인로고 -->
	     <a class="navbar-brand pt-0" href="home">
	       <img src="/resources/fo/img/logo.png" class="navbar-brand-img" alt="...">
	     </a>
	     <!-- Collapse -->
	     <div class="collapse navbar-collapse" id="sidenav-collapse-main">
	       <!-- Navigation -->
	       <ul class="navbar-nav">
	         <li class="nav-item  active ">
	           <a class="nav-link  active " href="#">
	             <i class="xi-home"></i> Dashboard
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link " href="">
	             <i class="xi-emoticon"></i> 회원
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link " href="">
	             <i class="xi-shopping-bag"></i> 상품
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link " href="">
	             <i class="xi-bell"></i> 공지사항
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link " href="">
	             <i class="xi-crown"></i> 챌린지
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="">
	             <i class="xi-map-marker"></i> 매장
	           </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="">
	             <i class="xi-hand-paper"></i> 신고
	           </a>
	         </li>
	       </ul>
	     </div>
	   </div>
	 </nav>

	 <!-- 메인화면 -->
	 <div class="main-content">
	   <!-- Navbar -->
	   <nav class="navbar navbar-top navbar-expand-md navbar-dark" id="navbar-main">
	     <div class="container-fluid">
	       <!-- Brand -->
	       <a class="h4 mb-0 text-white text-uppercase d-none d-lg-inline-block" href="./index.html">Dashboard</a>
	       <!-- User -->
	       <ul class="navbar-nav align-items-center d-none d-md-flex">
	         <li class="nav-item dropdown">
	           <a class="nav-link pr-0" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	             <div class="media align-items-center">
	               <span class="avatar avatar-sm rounded-circle">
	                 <!-- 프로필사진 -->
	                 <img alt="Image placeholder" src="/resources/fo/img/logo.png">
	               </span>
	               <div class="media-body ml-2 d-none d-lg-block">
	                 <span class="mb-0 text-sm  font-weight-bold">admin</span>
	               </div>
	             </div>
	           </a>
	         </li>
	       </ul>
	     </div>
	   </nav>

	   <!-- 이 영역에 작성하면 됨 -->
	   <div class="content">
		<div class="listArea">
			<div class="title">
				<h1>상품 추가</h1>
			</div>
            <form action="insert.pro" method="post" enctype="multipart/form-data">
                <div>
                    <table>
                        <tr>
                            <td width="100">상품명</td>
                            <td><input type="text" name="productName" required></td>
                        </tr>
                        <tr>
                            <td>카테고리</td>
                            <td>
                                <select name="category" required>
                                    <option value="전체">전체</option>
                                    <option value="욕실">욕실</option>
                                    <option value="식품">식품</option>
                                    <option value="주방">주방</option>
                                    <option value="생활">생활</option>
                                    <option value="취미">취미</option>
                                    <option value="음료용품">음료용품</option>
                                    <option value="여성용품">여성용품</option>
                                    <option value="반려동물">반려동물</option>
                                    <option value="화장품">화장품</option>
                                    <option value="문구">문구</option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>가격</td>
                            <td><input type="number" name="price" required></td>
                        </tr>
                        <tr>
                            <td>할인률</td>
                            <td><input type="number" name="discount" required></td>
                        </tr>
                        <tr>
                            <td>재고</td>
                            <td><input type="number" name="stock" required></td>
                        </tr>
                        <tr>
                            <td>사진</td>
                            <td>
                                <input type="file" name="upfile1" onchange="readURL(this);" required> <img id="preview1"><br>
                                <input type="file" name="upfile2" onchange="readURL(this);"> <img id="preview2"><br>
                                <input type="file" name="upfile3" onchange="readURL(this);"> <img id="preview3"><br>
                                <input type="file" name="upfile4" onchange="readURL(this);"> <img id="preview4">
                            </td>
                        </tr>
                    </table>
                </div>
                <div class="btn-area">
                    <button type="submit">추가</button>
                    <input type="button" value="취소" onclick="window.history.back();">

                </div>
            </form>
		</div>
	   </div>
	 </div>

     <script>
        // 이미지 파일을 첨부하면 각각의 미리보기 영역에 미리보기 이미지를 출력
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader(); // FileReader 객체 생성
                reader.onload = function (e) { // 이미지 파일을 읽어들이기를 성공했을 때 호출되는 이벤트 핸들러
                    // input 태그의 nextElementSibling 속성은 input 태그의 다음에 위치한 형제 요소를 선택
                    // img 태그의 src 속성은 이미지 파일의 경로를 지정
                    input.nextElementSibling.src = e.target.result;
                }
                reader.readAsDataURL(input.files[0]); // 이미지 파일을 읽어들임
            }
        }
     </script>


</body>
</html>