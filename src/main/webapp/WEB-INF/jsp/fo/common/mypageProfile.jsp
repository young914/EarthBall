<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="profile">

  <div class="profile-1">
    <img class="profile-picture" src="/resources/fo/img/logo.png">
    <div>
      <p class="memberName">${loginUser.memberName}님 환영합니다!</p>
      <p style="margin: 0;">현재 등급은 ${loginUser.gradeName} 입니다.</p>
    </div>
  </div>
  <div class="profile-2">
    포인트 <br>
    <span class="point">${loginUser.totalPoint}</span>
  </div>
</div>
