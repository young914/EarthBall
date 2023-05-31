<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>관리자 페이지 > 챌린지 메인</title>
    <jsp:include page="/WEB-INF/jsp/common/adminPageCommon.jsp"/>

    <!-- 사이드 바 css -->
    <link rel="stylesheet" href="resources/css/admin/common/adminSideBar.css">

    <!-- 페이징 css -->
    <link rel="stylesheet" href="resources/css/common/pagingBar.css">

    <!-- js 영역-->
    <script src="/resources/js/admin/challenge/grpCodeListView.js"></script>

    <style>
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
      }
    </style>
</head>
<body>
<!-- 사이드바 & 네비바 -->
<jsp:include page="/WEB-INF/jsp/common/adminSideBar.jsp"/>
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

    <!-- 이 영역에 작성하면 됨 -->
    <div class="content">
        <div class="listArea">
            <div class="title">
                <h1>그룹코드 리스트</h1>
                <button class="insertBtn">그룹코드 생성</button>
            </div>
            <div>
                카테고리 :
                <select>
                    <option>전체</option>
                    <option>욕실</option>
                </select>
                | 검색 :
                <input type="text" placeholder="코드를 입력하세요">
            </div>
            <div>
                <table class="listTable">
                    <thead>
                        <tr>
                            <th>그룹코드</th>
                            <th>그룹코드명</th>
                            <th></th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="grp" items="${ grpCodeList }">
                            <tr class="grpCode">
                                <td class="code" data-grpCode="${ grp.grpCode }">${ grp.grpCode }</td>
                                <td>${ grp.grpCodeName }</td>
                                <td><input type="button" value="수정"
                                           class="btn btn-secondary editButton"></td>
                                <td><input type="button" value="삭제"
                                           class="btn btn-secondary deleteButton"></td>
                            </tr>
                            <!-- grpCode 한줄 클릭했을 때 둘다 열려야 -->
                        </c:forEach>
                    </tbody>
                </table>

                <jsp:include page="/WEB-INF/jsp/common/pagingBar.jsp"/>




            </div>
        </div>
    </div>
</div>

</body>
</html>