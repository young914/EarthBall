<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

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
                    <a class="nav-link">
                        <i class="xi-crown" onclick="dropChallenge();"></i> 챌린지
                    </a>
                    <div class="dropdown">
                        <a href="/list.grp">그룹코드/공통코드 관리</a>
                        <a href="">카테고리 관리</a>
                        <a href="">챌린지 오픈 관리</a>
                    </div>
                </li>

                <script>
                    function dropChallenge() {

                    }
                </script>


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