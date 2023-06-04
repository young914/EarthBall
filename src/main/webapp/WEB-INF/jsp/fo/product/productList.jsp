<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="/resources/fo/css/product/productList.css">
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>


<div id="container">
    <!-- 버튼 -->
    <div id="buttonArea">
        <div>
            <button>선물꾸러미</button>
        </div>
        <div>
            <button>욕실</button>
        </div>
        <div>
            <button>식품</button>
        </div>
        <div>
            <button>주방</button>
        </div>
        <div>
            <button>생활</button>
        </div>
        <div>
            <button>취미</button>
        </div>
        <div>
            <button>음료용품</button>
        </div>
        <div>
            <button>여성용품</button>
        </div>
        <div>
            <button>반려동물</button>
        </div>
        <div>
            <button>화장품</button>
        </div>
        <div>
            <button>문구</button>
        </div>
        <div>
            <button>전체</button>
        </div>
    </div>
    <hr style="margin-top: 90px; border-color: #e5e7eb; opacity: 0.3;">
    <div id="dropBox">
        <select class="form-select" aria-label="Default select example">
            <option value="1">등록순</option>
            <option value="2">가격순</option>
        </select>
    </div>
    <!-- 리스트 -->
    <div id="productArea">
		<c:forEach var="p" items="${ list }">
			<div class="product">
            <div class="product-img">
                <img src="/resources/fo/upfiles/${ p.changerName }">
            </div>
            <div class="product-info">
                <div class="product-name">
                    <p>${ p.productName }</p>
                </div>
                <div class="product-price">
                    <p>${ p.price }원</p>
                </div>
                <div class="product-icon">
                    <div><i class="xi-speech-o"></i></div>
                    <div><i class="xi-heart-o"></i></div>
                    <div><i class="xi-cart-o"></i></div>
                </div>
            </div>
        </div>
		</c:forEach>
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

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>

</body>
</html>