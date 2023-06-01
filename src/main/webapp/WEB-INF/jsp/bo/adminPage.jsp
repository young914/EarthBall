<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
<jsp:include page="../common/adminPageCommon.jsp"/>
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
	           <a class="nav-link " href="adminProductListView">
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
	   <!-- End Navbar -->
	   <!-- Header -->
	   <div class="header bg-gradient-primary pb-8 pt-5 pt-md-8">
	     <div class="container-fluid">
	       <div class="header-body">
	         <!-- Card stats -->
	         <div class="row">
	           <div class="col-xl-3 col-lg-6">
	             <div class="card card-stats mb-4 mb-xl-0">
	               <div class="card-body">
	                 <div class="row">
	                   <div class="col">
	                     <h5 class="card-title text-uppercase text-muted mb-0">Traffic</h5>
	                     <span class="h2 font-weight-bold mb-0">350,897</span>
	                   </div>
	                   <div class="col-auto">
	                     <div class="icon icon-shape bg-danger text-white rounded-circle shadow">
	                       <i class="fas fa-chart-bar"></i>
	                     </div>
	                   </div>
	                 </div>
	                 <p class="mt-3 mb-0 text-muted text-sm">
	                   <span class="text-success mr-2"><i class="fa fa-arrow-up"></i> 3.48%</span>
	                   <span class="text-nowrap">Since last month</span>
	                 </p>
	               </div>
	             </div>
	           </div>
	           <div class="col-xl-3 col-lg-6">
	             <div class="card card-stats mb-4 mb-xl-0">
	               <div class="card-body">
	                 <div class="row">
	                   <div class="col">
	                     <h5 class="card-title text-uppercase text-muted mb-0">New users</h5>
	                     <span class="h2 font-weight-bold mb-0">2,356</span>
	                   </div>
	                   <div class="col-auto">
	                     <div class="icon icon-shape bg-warning text-white rounded-circle shadow">
	                       <i class="fas fa-chart-pie"></i>
	                     </div>
	                   </div>
	                 </div>
	                 <p class="mt-3 mb-0 text-muted text-sm">
	                   <span class="text-danger mr-2"><i class="fas fa-arrow-down"></i> 3.48%</span>
	                   <span class="text-nowrap">Since last week</span>
	                 </p>
	               </div>
	             </div>
	           </div>
	           <div class="col-xl-3 col-lg-6">
	             <div class="card card-stats mb-4 mb-xl-0">
	               <div class="card-body">
	                 <div class="row">
	                   <div class="col">
	                     <h5 class="card-title text-uppercase text-muted mb-0">Sales</h5>
	                     <span class="h2 font-weight-bold mb-0">924</span>
	                   </div>
	                   <div class="col-auto">
	                     <div class="icon icon-shape bg-yellow text-white rounded-circle shadow">
	                       <i class="fas fa-users"></i>
	                     </div>
	                   </div>
	                 </div>
	                 <p class="mt-3 mb-0 text-muted text-sm">
	                   <span class="text-warning mr-2"><i class="fas fa-arrow-down"></i> 1.10%</span>
	                   <span class="text-nowrap">Since yesterday</span>
	                 </p>
	               </div>
	             </div>
	           </div>
	           <div class="col-xl-3 col-lg-6">
	             <div class="card card-stats mb-4 mb-xl-0">
	               <div class="card-body">
	                 <div class="row">
	                   <div class="col">
	                     <h5 class="card-title text-uppercase text-muted mb-0">Performance</h5>
	                     <span class="h2 font-weight-bold mb-0">49,65%</span>
	                   </div>
	                   <div class="col-auto">
	                     <div class="icon icon-shape bg-info text-white rounded-circle shadow">
	                       <i class="fas fa-percent"></i>
	                     </div>
	                   </div>
	                 </div>
	                 <p class="mt-3 mb-0 text-muted text-sm">
	                   <span class="text-success mr-2"><i class="fas fa-arrow-up"></i> 12%</span>
	                   <span class="text-nowrap">Since last month</span>
	                 </p>
	               </div>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	   </div>
	   <div class="container-fluid mt--7">
	     <div class="row">
	       <div class="col-xl-8 mb-5 mb-xl-0">
	         <div class="card bg-gradient-default shadow">
	           <div class="card-header bg-transparent">
	             <div class="row align-items-center">
	               <div class="col">
	                 <h6 class="text-uppercase text-light ls-1 mb-1">Overview</h6>
	                 <h2 class="text-white mb-0">Sales value</h2>
	               </div>
	               <div class="col">
	                 <ul class="nav nav-pills justify-content-end">
	                   <li class="nav-item mr-2 mr-md-0" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 10, 30, 15, 40, 20, 60, 60]}]}}' data-prefix="$" data-suffix="k">
	                     <a href="#" class="nav-link py-2 px-3 active" data-toggle="tab">
	                       <span class="d-none d-md-block">Month</span>
	                       <span class="d-md-none">M</span>
	                     </a>
	                   </li>
	                   <li class="nav-item" data-toggle="chart" data-target="#chart-sales" data-update='{"data":{"datasets":[{"data":[0, 20, 5, 25, 10, 30, 15, 40, 40]}]}}' data-prefix="$" data-suffix="k">
	                     <a href="#" class="nav-link py-2 px-3" data-toggle="tab">
	                       <span class="d-none d-md-block">Week</span>
	                       <span class="d-md-none">W</span>
	                     </a>
	                   </li>
	                 </ul>
	               </div>
	             </div>
	           </div>
	           <div class="card-body">
	             <!-- Chart -->
	             <div class="chart">
	               <!-- Chart wrapper -->
	               <canvas id="chart-sales" class="chart-canvas"></canvas>
	             </div>
	           </div>
	         </div>
	       </div>
	       <div class="col-xl-4">
	         <div class="card shadow">
	           <div class="card-header bg-transparent">
	             <div class="row align-items-center">
	               <div class="col">
	                 <h6 class="text-uppercase text-muted ls-1 mb-1">Performance</h6>
	                 <h2 class="mb-0">Total orders</h2>
	               </div>
	             </div>
	           </div>
	           <div class="card-body">
	             <!-- Chart -->
	             <div class="chart">
	               <canvas id="chart-orders" class="chart-canvas"></canvas>
	             </div>
	           </div>
	         </div>
	       </div>
	     </div>
	     <div class="row mt-5">
	       <div class="col-xl-8 mb-5 mb-xl-0">
	         <div class="card shadow">
	           <div class="card-header border-0">
	             <div class="row align-items-center">
	               <div class="col">
	                 <h3 class="mb-0">Page visits</h3>
	               </div>
	               <div class="col text-right">
	                 <a href="#!" class="btn btn-sm btn-primary">See all</a>
	               </div>
	             </div>
	           </div>
	           <div class="table-responsive">
	             <!-- Projects table -->
	             <table class="table align-items-center table-flush">
	               <thead class="thead-light">
	                 <tr>
	                   <th scope="col">Page name</th>
	                   <th scope="col">Visitors</th>
	                   <th scope="col">Unique users</th>
	                   <th scope="col">Bounce rate</th>
	                 </tr>
	               </thead>
	               <tbody>
	                 <tr>
	                   <th scope="row">
	                     /argon/
	                   </th>
	                   <td>
	                     4,569
	                   </td>
	                   <td>
	                     340
	                   </td>
	                   <td>
	                     <i class="fas fa-arrow-up text-success mr-3"></i> 46,53%
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     /argon/index.html
	                   </th>
	                   <td>
	                     3,985
	                   </td>
	                   <td>
	                     319
	                   </td>
	                   <td>
	                     <i class="fas fa-arrow-down text-warning mr-3"></i> 46,53%
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     /argon/charts.html
	                   </th>
	                   <td>
	                     3,513
	                   </td>
	                   <td>
	                     294
	                   </td>
	                   <td>
	                     <i class="fas fa-arrow-down text-warning mr-3"></i> 36,49%
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     /argon/tables.html
	                   </th>
	                   <td>
	                     2,050
	                   </td>
	                   <td>
	                     147
	                   </td>
	                   <td>
	                     <i class="fas fa-arrow-up text-success mr-3"></i> 50,87%
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     /argon/profile.html
	                   </th>
	                   <td>
	                     1,795
	                   </td>
	                   <td>
	                     190
	                   </td>
	                   <td>
	                     <i class="fas fa-arrow-down text-danger mr-3"></i> 46,53%
	                   </td>
	                 </tr>
	               </tbody>
	             </table>
	           </div>
	         </div>
	       </div>
	       <div class="col-xl-4">
	         <div class="card shadow">
	           <div class="card-header border-0">
	             <div class="row align-items-center">
	               <div class="col">
	                 <h3 class="mb-0">Social traffic</h3>
	               </div>
	               <div class="col text-right">
	                 <a href="#!" class="btn btn-sm btn-primary">See all</a>
	               </div>
	             </div>
	           </div>
	           <div class="table-responsive">
	             <!-- Projects table -->
	             <table class="table align-items-center table-flush">
	               <thead class="thead-light">
	                 <tr>
	                   <th scope="col">Referral</th>
	                   <th scope="col">Visitors</th>
	                   <th scope="col"></th>
	                 </tr>
	               </thead>
	               <tbody>
	                 <tr>
	                   <th scope="row">
	                     Facebook
	                   </th>
	                   <td>
	                     1,480
	                   </td>
	                   <td>
	                     <div class="d-flex align-items-center">
	                       <span class="mr-2">60%</span>
	                       <div>
	                         <div class="progress">
	                           <div class="progress-bar bg-gradient-danger" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%;"></div>
	                         </div>
	                       </div>
	                     </div>
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     Facebook
	                   </th>
	                   <td>
	                     5,480
	                   </td>
	                   <td>
	                     <div class="d-flex align-items-center">
	                       <span class="mr-2">70%</span>
	                       <div>
	                         <div class="progress">
	                           <div class="progress-bar bg-gradient-success" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%;"></div>
	                         </div>
	                       </div>
	                     </div>
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     Google
	                   </th>
	                   <td>
	                     4,807
	                   </td>
	                   <td>
	                     <div class="d-flex align-items-center">
	                       <span class="mr-2">80%</span>
	                       <div>
	                         <div class="progress">
	                           <div class="progress-bar bg-gradient-primary" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%;"></div>
	                         </div>
	                       </div>
	                     </div>
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     Instagram
	                   </th>
	                   <td>
	                     3,678
	                   </td>
	                   <td>
	                     <div class="d-flex align-items-center">
	                       <span class="mr-2">75%</span>
	                       <div>
	                         <div class="progress">
	                           <div class="progress-bar bg-gradient-info" role="progressbar" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100" style="width: 75%;"></div>
	                         </div>
	                       </div>
	                     </div>
	                   </td>
	                 </tr>
	                 <tr>
	                   <th scope="row">
	                     twitter
	                   </th>
	                   <td>
	                     2,645
	                   </td>
	                   <td>
	                     <div class="d-flex align-items-center">
	                       <span class="mr-2">30%</span>
	                       <div>
	                         <div class="progress">
	                           <div class="progress-bar bg-gradient-warning" role="progressbar" aria-valuenow="30" aria-valuemin="0" aria-valuemax="100" style="width: 30%;"></div>
	                         </div>
	                       </div>
	                     </div>
	                   </td>
	                 </tr>
	               </tbody>
	             </table>
	           </div>
	         </div>
	       </div>
	     </div>
	     <!-- Footer -->
	     <footer class="footer">
	       <div class="row align-items-center justify-content-xl-between">
	         <div class="col-xl-6">
	           <div class="copyright text-center text-xl-left text-muted">
	             &copy; 2023 <a href="https://www.creative-tim.com" class="font-weight-bold ml-1" target="_blank">made my Insu</a>
	           </div>
	         </div>
	       </div>
	     </footer>
	   </div>
	 </div>

</body>
</html>