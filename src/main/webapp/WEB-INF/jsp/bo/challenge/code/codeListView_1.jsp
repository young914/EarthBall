<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
  <c:if test="${empty codeList}">
      <tr>
        <td colspan="5">
          <strong>등록된 데이터가 없습니다.</strong>
        </td>
      </tr>
  </c:if>
  <c:if test="${not empty codeList}">
  <c:forEach var="item" items="${codeList}">
    <tr>
      <td><strong>${item.grpCode}</strong></td>
      <td><strong>${item.code}</strong></td>
      <td><strong>${item.codeName}</strong></td>
      <td>
        <button type="button" class="btn btn-primary">수정</button>
      </td>
      <td>
        <button type="button" class="btn btn-primary">삭제</button>
      </td>
    </tr>
  </c:forEach>
  </c:if>
  </tbody>
</table>