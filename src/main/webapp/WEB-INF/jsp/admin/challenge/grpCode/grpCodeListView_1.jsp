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