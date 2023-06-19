<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="sidebar">
  <h2 class="divider"></h2>
  <ul class="menu1">
    <li><a href="/list.myChallenge?memberId=${ loginUser.memberId }">챌린지 현황</a></li>
    <li><a href="#">환경 일기 </a></li>
    <li><a href="#">주문 관리</a></li>
    <li><a href="list.like?memberId=${ loginUser.memberId }">찜 목록</a></li>
    <li><a href="list.mybo?memberId=${loginUser.memberId}">1:1문의</a></li>
    <li><a href="#">포인트 내역</a></li>
    <li><a href="updateInfo.me">내 정보 수정</a></li>
    <li><a href="#" data-toggle="modal" data-target="#deleteForm">회원탈퇴</a></li>
  </ul>
</div>
