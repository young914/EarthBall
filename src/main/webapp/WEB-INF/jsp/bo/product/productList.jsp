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
  <style>
    .content{
      width: calc(100% - (1.625rem * 2));
      margin: 0.75rem auto 0;
      border-radius: 0.375rem;
      padding: 0 1.5rem;
      background-color: white;
      /* 그림자효과 */
      box-shadow: 0 0.5rem 1rem rgba(0, 0, 0, 0.15);
    }
    .title{
      font-size: 1.5rem;
      font-weight: 600;
      margin-bottom: 1.5rem;
      margin-top: 1.5rem;
    }
    .nav>*{
      margin-right: 10px;
    }
    .nav>button{
      width: 100px;
      border: 1px solid #e5e5e5;
      border-radius: 5px;
      background-color: white;
      color: #333;
      font-size: 14px;
      font-weight: 600;
    }
    .nav>button:hover{
      background-color: #f5f5f5;
    }
    .productList{
      width: 100%;
      border-collapse: collapse;
      margin-top: 30px;
      margin-bottom: 30px;
    }
    .productList>thead{
      background-color: #f5f5f5;
      height: 50px;
      text-align: center;
    }
    .productList>tbody>tr{
      height: 40px;
      text-align: center;
    }
    .productList>tbody>tr>td{
      border-bottom: 1px solid #e5e5e5;
    }
    .productList>tbody>tr:hover{
      background-color: #f5f5f5;
    }
    /* 페이징바 */
    #page {
      width: 100%;
      text-align: center;
      display: inline-flex;
      align-items: center;
      justify-content: space-around;
      margin-bottom: 30px;
    }
    .page_btn {
      justify-content: center;
    }
    .pagination {
      list-style: none;
      padding: 0;
      margin-top: 20px;
    }
    .pagination li {
      display: inline;
      text-align: center;
    }
    /* 숫자들에 대한 스타일 지정 */
    .pagination a {
      float: left;
      display: block;
      font-size: 14px;
      text-decoration: none;
      padding: 5px 12px;
      color: #797979;
      line-height: 1.5;
    }
    .first { margin-right: 15px; }
    .last { margin-left: 15px; }
    .first:hover, .last:hover, .arrow_left:hover, .arrow_right:hover {
      color: #146C94;
    }
    .pagination a:active {
      cursor: default;
      color: #69ABCE;
    }
    .pagination a:active {
      outline: none;
    }
    .num {
      margin-left: 3px;
      padding: 0;
      width: 30px;
      -moz-border-radius: 100%;
      -webkit-border-radius: 100%;
      border-radius: 100%;
    }
    .num:hover {
      background-color: #146C94;
      color: #FFFFFF;
    }
    .num:active, .modal .num:active {
      background-color: #69ABCE;
      cursor: pointer;
    }
  </style>
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
        <div class="content">
          <h1 class="title">상품리스트</h1>
          <div class="nav">
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
            <input type="text" name="search" placeholder="검색어를 입력하세요."/>
            <button type="button">검색</button>
          </div>
          <div>
            <table class="productList">
              <thead>
                <tr>
                  <th width="70">상품번호</th>
                  <th>제품명</th>
                  <th width="80">카테고리</th>
                  <th width="100">가격</th>
                  <th width="70">할인률</th>
                  <th width="70">재고</th>
                  <th width="130">등록일</th>
                  <th width="70">상태값</th>
                </tr>
              </thead>
              <tbody>
			  	<c:forEach var="p" items="${ list }">
			  		<tr>
			  			<td>${ p.productNo }</td>
			  			<td>${ p.productName }</td>
			  			<td>${ p.category }</td>
			  			<td>${ p.price }</td>
			  			<td>${ p.discount }</td>
			  			<td>${ p.stock }</td>
			  			<td>${ p.createDate }</td>
			  			<td>${ p.status }</td>
			  		</tr>
			  	</c:forEach>
              </tbody>
            </table>
          </div>
          <!-- 페이징바 넣을 자리 시작 -->
          <div id="page">
              <div class="page_btn" align="center">
                  <ul class="pagination">
                    <c:choose>
                      <c:when test="${ pi.currentPage eq 1 }">
                        <li style="display: none"> <a href="#" class="first">처음 페이지</a> </li>
                      </c:when>
                      <c:otherwise>
                        <li> <a href="adminlist.pro" class="first">처음 페이지</a> </li>
                      </c:otherwise>
                    </c:choose>

                      <li> <a href="#" class="arrow_left"> << </a>  </li>

                      <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li> <a href="adminlist.pro?cPage=${ p }" class="active num"> ${ p } </a>  </li>
                      </c:forEach>

                      <li> <a href="#" class="arrow_right"> >> </a> </li>

                      <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                          <li style="display: none"> <a href="#" class="last">끝 페이지</a> </li>
                        </c:when>
                        <c:otherwise>
                          <li> <a href="adminlist.pro?cPage=${ pi.maxPage }" class="last">끝 페이지</a> </li>
                        </c:otherwise>
                      </c:choose>
                  </ul>
              </div>
          </div>
          <!-- 페이징바 넣을 자리 끝 -->
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