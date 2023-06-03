<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<aside id="layout-menu" class="layout-menu menu-vertical menu bg-menu-theme">
  <div class="app-brand demo">
    <a href="index.html" class="app-brand-link">
      <img src="/resources/bo/img/logo.png" class="navbar-brand-img" alt="...">
    </a>

    <a href="javascript:void(0);" class="layout-menu-toggle menu-link text-large ms-auto d-block d-xl-none">
      <i class="bx bx-chevron-left bx-sm align-middle"></i>
    </a>
  </div>

  <div class="menu-inner-shadow"></div>

  <ul class="menu-inner py-1">
    <!-- Dashboard -->
    <li class="menu-item ${param.menuId eq '00' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-home-circle"></i>
        <div data-i18n="Analytics">Dashboard</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '10' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">회원</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '20' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">상품</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '30' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">공지사항</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '40' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">매장</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId eq '0' ? 'active' : ''}">
      <a href="/" class="menu-link">
        <i class="menu-icon tf-icons bx bx-table"></i>
        <div data-i18n="Tables">신고</div>
      </a>
    </li>
    <li class="menu-item ${param.menuId > '50' && param.menuId < '60' ? 'active open' : ''}">
      <a href="javascript:void(0);" class="menu-link menu-toggle">
        <i class="menu-icon tf-icons bx bx-dock-top"></i>
        <div data-i18n="Account Settings">챌린지</div>
      </a>
      <ul class="menu-sub">
        <li class="menu-item ${param.menuId eq '51' ? 'active' : ''}">
          <a href="/list.grp" class="menu-link">
            <div data-i18n="Account">그룹코드/공통코드 관리</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '52' ? 'active' : ''}">
          <a href="/list.ca" class="menu-link">
            <div data-i18n="Notifications">카테고리 관리</div>
          </a>
        </li>
        <li class="menu-item ${param.menuId eq '53' ? 'active' : ''}">
          <a href="pages-account-settings-connections.html" class="menu-link">
            <div data-i18n="Connections">챌린지 오픈 관리</div>
          </a>
        </li>
      </ul>
    </li>
  </ul>
</aside>