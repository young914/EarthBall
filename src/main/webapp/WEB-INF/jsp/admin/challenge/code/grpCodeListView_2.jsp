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
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"
    />

    <title>Tables - Basic Tables | Sneat - Bootstrap 5 HTML Admin Template - Pro</title>

    <meta name="description" content="" />

    <!-- Favicon -->
    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Public+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap"
      rel="stylesheet"
    />

    <!-- Icons. Uncomment required icon fonts -->
    <link rel="stylesheet" href="/resources/admin/assets/vendor/fonts/boxicons.css" />

    <!-- Core CSS -->
    <link rel="stylesheet" href="/resources/admin/assets/vendor/css/core.css" class="template-customizer-core-css" />
    <link rel="stylesheet" href="/resources/admin/assets/vendor/css/theme-default.css" class="template-customizer-theme-css" />
    <link rel="stylesheet" href="/resources/admin/assets/css/demo.css" />

    <!-- Vendors CSS -->
    <link rel="stylesheet" href="/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.css" />

    <!-- Page CSS -->

    <!-- Helpers -->
    <script src="/resources/admin/assets/vendor/js/helpers.js"></script>

    <!--! Template customizer & Theme config files MUST be included after core stylesheets and helpers.js in the <head> section -->
    <!--? Config:  Mandatory theme config file contain global vars & default theme options, Set your preferred theme option in this file.  -->
    <script src="/resources/admin/assets/js/config.js"></script>
  </head>

  <body>
    <!-- Layout wrapper -->
    <div class="layout-wrapper layout-content-navbar">
      <div class="layout-container">
        <!-- Menu -->

        <aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
          <div class="app-brand demo">
            <a href="index.html" class="app-brand-link">
              <img src="/resources/img/logo.png" class="navbar-brand-img" alt="...">
            </a>

            <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
              <i class="bx bx-chevron-left bx-sm align-middle"></i>
            </a>
          </div>

          <div class="menu-inner-shadow"></div>

          <ul class="menu-inner py-1">
            <!-- Dashboard -->
            <li class="menu-item">
              <a href="index.html" class="menu-link">
                <i class="menu-icon tf-icons bx bx-home-circle"></i>
                <div data-i18n="Analytics">Dashboard</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/l" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">회원</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/l" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">상품</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/l" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">공지사항</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/l" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">매장</div>
              </a>
            </li>
            <li class="menu-item">
              <a href="/l" class="menu-link">
                <i class="menu-icon tf-icons bx bx-table"></i>
                <div data-i18n="Tables">신고</div>
              </a>
            </li>
            <li class="menu-item active open">
              <a href="javascript:void(0);" class="menu-link menu-toggle">
                <i class="menu-icon tf-icons bx bx-dock-top"></i>
                <div data-i18n="Account Settings">챌린지</div>
              </a>
              <ul class="menu-sub">
                <li class="menu-item active">
                  <a href="pages-account-settings-account.html" class="menu-link">
                    <div data-i18n="Account">그룹코드/공통코드 관리</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-account-settings-notifications.html" class="menu-link">
                    <div data-i18n="Notifications">카테고리 관리</div>
                  </a>
                </li>
                <li class="menu-item">
                  <a href="pages-account-settings-connections.html" class="menu-link">
                    <div data-i18n="Connections">챌린지 오픈 관리</div>
                  </a>
                </li>
              </ul>
            </li>
          </ul>
        </aside>
        <!-- / Menu -->

        <!-- Layout container -->
        <div class="layout-page">
          <!-- Navbar -->

          <nav
            class="layout-navbar container-xxl navbar navbar-expand-xl navbar-detached align-items-center bg-navbar-theme"
            id="layout-navbar"
          >
            <div class="layout-menu-toggle navbar-nav align-items-xl-center me-3 me-xl-0 d-xl-none">
              <a class="nav-item nav-link px-0 me-xl-4" href="javascript:void(0)">
                <i class="bx bx-menu bx-sm"></i>
              </a>
            </div>

            <div class="navbar-nav-right d-flex align-items-center" id="navbar-collapse">
              <ul class="navbar-nav flex-row align-items-center ms-auto">
                <!-- Place this tag where you want the button to render. -->
                <!-- User -->
                <li class="nav-item navbar-dropdown dropdown-user dropdown">
                  <a class="nav-link dropdown-toggle hide-arrow" href="javascript:void(0);" data-bs-toggle="dropdown">
                    <div class="avatar avatar-online">
                      <img src="/resources/img/logo.png" alt class="w-px-40 h-auto rounded-circle" />
                    </div>
                  </a>
                  <ul class="dropdown-menu dropdown-menu-end">
                    <li>
                      <a class="dropdown-item" href="#">
                        <div class="d-flex">
                          <div class="flex-grow-1">
                            <span class="fw-semibold d-block">John Doe</span>
                          </div>
                        </div>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="#">
                        <i class="bx bx-user me-2"></i>
                        <span class="align-middle">My Profile</span>
                      </a>
                    </li>
                    <li>
                      <div class="dropdown-divider"></div>
                    </li>
                    <li>
                      <a class="dropdown-item" href="auth-login-basic.html">
                        <i class="bx bx-power-off me-2"></i>
                        <span class="align-middle">Log Out</span>
                      </a>
                    </li>
                  </ul>
                </li>
                <!--/ User -->
              </ul>
            </div>
          </nav>

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
    <!-- build:js assets/vendor/js/core.js -->
    <script src="/resources/admin/assets/vendor/libs/jquery/jquery.js"></script>
    <script src="/resources/admin/assets/vendor/libs/popper/popper.js"></script>
    <script src="/resources/admin/assets/vendor/js/bootstrap.js"></script>
    <script src="/resources/admin/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

    <script src="/resources/admin/assets/vendor/js/menu.js"></script>
    <!-- endbuild -->

    <!-- Vendors JS -->

    <!-- Main JS -->
    <script src="/resources/admin/assets/js/main.js"></script>

    <!-- Page JS -->

    <!-- Place this tag in your head or just before your close body tag. -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <script type="text/javascript">
      $(document).on('click', '#grpCodeList .grpCode', function(){
        let grpCode = $(this).data('grpCode');
        $.ajax({
          url : "list.code",
          type : "get",
          data : {
            grpCode : grpCode
          },
          success : function(result) {				// jsp 파일을 result로 받을 수 있음!!! ***  => return "admin/codeListView";
            $("#codeList").html(result);
          },
          error : function() {
            console.log("공통코드 생성 ajax 통신 실패");
          }
        });
      });
    </script>
  </body>
</html>
