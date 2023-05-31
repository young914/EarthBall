<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지>상품</title>
<jsp:include page="/WEB-INF/jsp/common/adminPageCommon.jsp"/>
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
	.insertBtn{
		margin-left: auto;
		background-color: #19a7ce;
		color: white;
		border: none;
		border-radius: 10px;
		padding: 10px;
	}
	.listTable{
		width: 100%;
		margin-top: 20px;
	}
	.listTable>thead>tr>th{
		text-align: center;
	}
	.listTable>tbody>tr>td:first-child, .listTable>tbody>tr>td:nth-child(2), .listTable>tbody>tr>td:nth-child(2),
	.listTable>tbody>tr>td:nth-child(4), .listTable>tbody>tr>td:nth-child(5), .listTable>tbody>tr>td:nth-child(6),
	.listTable>tbody>tr>td:nth-child(7), .listTable>tbody>tr>td:nth-child(8), .listTable>tbody>tr>td:nth-child(9),
	.listTable>tbody>tr>td:nth-child(10){
		text-align: center;
	}
	.listTable>thead>tr>th{
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
	       <img src="/resources/img/logo.png" class="navbar-brand-img" alt="...">
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
	                 <img alt="Image placeholder" src="/resources/img/logo.png">
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
				<h1>상품리스트</h1>
				<button class="insertBtn" onclick="location.href = 'enrollForm.pro'">상품추가</button>
			</div>
			<div>
				카테고리 :
				<select>
					<option>전체</option>
					<option>욕실</option>
					<option>식품</option>
					<option>주방</option>
					<option>생활</option>
					<option>취미</option>
					<option>음료용품</option>
					<option>여성용품</option>
					<option>반려동물</option>
					<option>화장품</option>
					<option>문구</option>
				</select>
				| 검색 :
				<input type="text" placeholder="상품명을 입력하세요">
			</div>
			<div>
				<table class="listTable" border="1">
					<thead>
						<tr>
							<th><input type="checkbox"></th>
							<th width="70">상품번호</th>
							<th width="400">상품명</th>
							<th width="100">카테고리</th>
							<th>가격</th>
							<th width="70">할인률</th>
							<th width="70">재고</th>
							<th width="100">등록일</th>
							<th width="80">표시여부</th>
							<th width="50">수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><input type="checkbox"></td>
							<td>1</td>
							<td>상품1</td>
							<td>카테고리1</td>
							<td>1000</td>
							<td>10%</td>
							<td>100</td>
							<td>2020-01-01</td>
							<td>표시</td>
							<td><button>수정</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	   </div>
	 </div>


</body>
</html>