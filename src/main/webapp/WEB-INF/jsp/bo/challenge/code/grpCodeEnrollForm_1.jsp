<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<!-- =========================================================
* Sneat - Bootstrap 5 HTML Admin Template - Pro | v1.0.0
==============================================================

* Product Page: https://themeselection.com/products/sneat-bootstrap-html-admin-template/
* Created by: ThemeSelection
* License: You must have a valid license purchased in order to legally use the theme for your project.
* Copyright ThemeSelection (https://themeselection.com)

=========================================================
-->
<!-- beautify ignore:start -->
<html
    lang="kr"
    class="light-style layout-menu-fixed"
    dir="ltr"
    data-theme="theme-default"
    data-assets-path="/resources/admin/assets/"
    data-template="vertical-menu-template-free"
>
<head>
    <jsp:include page="/WEB-INF/jsp/bo/common/commonHead.jsp" />
</head>

<body>
<!-- Layout wrapper -->
<div class="layout-wrapper layout-content-navbar">
    <div class="layout-container">
        <!-- Menu -->

        <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutMenu.jsp">
            <jsp:param name="menuId" value="51"/>
        </jsp:include>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
            <!-- Navbar -->
            <jsp:include page="/WEB-INF/jsp/bo/common/commonLayoutNavbar.jsp" />
            <!-- / Navbar -->

            <!-- Content wrapper -->
            <div class="content-wrapper">
                <!-- Content -->

                <div class="container-xxl flex-grow-1 container-p-y">
                    <h4 class="fw-bold">그룹 코드</h4>
                    <!-- HTML5 Inputs -->
                    <div class="card mb-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-10">
                                    <button type="button" class="btn btn-primary">그룹코드 등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Hoverable Table rows -->
                    <div class="card mb-2">
                        <div class="table-responsive text-nowrap" id="grpCodeList">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="20%">그룹코드</th>
                                    <th width="60%">그룹코드명</th>
                                    <th width="10%">수정</th>
                                    <th width="10%">삭제</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <c:forEach var="item" items="${ grpCodeList }">
                                    <tr>
                                        <td class="grpCode" data-grp-code="${item.grpCode}"><strong>${item.grpCode}</strong></td>
                                        <td class="grpCode" data-grp-code="${item.grpCode}"><strong>${item.grpCodeName}</strong></td>
                                        <td>
                                            <button type="button" class="btn btn-primary">수정</button>
                                        </td>
                                        <td>
                                            <button type="button" class="btn btn-primary">삭제</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <!--/ Hoverable Table rows -->

                    <div class="card mb-4">
                        <!-- Basic Pagination -->
                        <div class="demo-inline-spacing">
                            <!-- Basic Pagination -->
                            <nav aria-label="Page navigation">
                                <ul class="pagination justify-content-center">
                                    <c:choose>
                                        <c:when test="${ pi.currentPage eq 1 }">
                                            <li class="page-item prev disabled">
                                                <a class="page-link" href="#"><i class="tf-icon bx bx-chevron-left"></i></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item prev">
                                                <a class="page-link" href="list.grp?currentPage=${ pi.currentPage - 1 }"><i class="tf-icon bx bx-chevron-left"></i></a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                    <c:forEach var="page" begin="${ pi.startPage }" end="${ pi.endPage }" step="1">
                                        <li class="page-item">
                                            <a class="page-link" href="list.grp?currentPage=${ page }">${ page }</a>
                                        </li>
                                    </c:forEach>
                                    <c:choose>
                                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                                            <li class="page-item next disabled">
                                                <a class="page-link" href="#"><i class="tf-icon bx bx-chevron-right"></i></a>
                                            </li>
                                        </c:when>
                                        <c:otherwise>
                                            <li class="page-item next">
                                                <a class="page-link" href="list.grp?currentPage=${ pi.currentPage + 1 }"><i class="tf-icon bx bx-chevron-right"></i></a>
                                            </li>
                                        </c:otherwise>
                                    </c:choose>
                                </ul>
                            </nav>
                            <!--/ Basic Pagination -->
                        </div>
                    </div>

                    <h4 class="fw-bold">공통 코드</h4>
                    <div class="card mb-2">
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-10">
                                    <button type="button" class="btn btn-primary">공통 등록</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- HTML5 Inputs -->
                    <div class="card">
                        <div class="table-responsive text-nowrap" id="codeList">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th width="15%">그룹코드</th>
                                    <th width="15%">공통코드</th>
                                    <th width="30%">공통코드명</th>
                                    <th width="10%">수정</th>
                                    <th width="10%">삭제</th>
                                </tr>
                                </thead>
                                <tbody class="table-border-bottom-0">
                                <tr>
                                    <td colspan="5">
                                        <strong>등록된 데이터가 없습니다.</strong>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- / Content -->


                <!-- Footer -->
                <footer class="content-footer footer bg-footer-theme">
                    <div class="container-xxl d-flex flex-wrap justify-content-between py-2 flex-md-row flex-column">
                        <div class="mb-2 mb-md-0">
                            ©
                            <script>
                                document.write(new Date().getFullYear());
                            </script>
                        </div>
                    </div>
                </footer>
                <!-- / Footer -->

                <div class="content-backdrop fade"></div>
            </div>
            <!-- Content wrapper -->
        </div>
        <!-- / Layout page -->
    </div>

    <!-- Overlay -->
    <div class="layout-overlay layout-menu-toggle"></div>
</div>
<jsp:include page="/WEB-INF/jsp/bo/common/commonScript.jsp" />
<script type="text/javascript">

</script>
</body>
</html>