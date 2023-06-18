<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>주문 내역</title>
  <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
  <link rel="stylesheet" href="/resources/fo/css/mypage/commonMyPage.css?after">
  <link rel="stylesheet" href="/resources/fo/css/mypage/myOrder.css">

  <style type="text/css">

    .hover tr:hover {
    background-color: #f5f5f5;
  	}

  	 table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

  </style>
</head>
<body>

<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp" />

<!-- 메인 컨텐츠 -->
<div id="container">
  <!-- Sidebar Menu -->
  <jsp:include page="/WEB-INF/jsp/fo/common/myPageSidebar.jsp" />
  <!-- Main Content -->
  <div class="main-content">

    <jsp:include page="/WEB-INF/jsp/fo/common/mypageProfile.jsp" />

    <div class="main-content2">

      <h2>주문 내역 <span>${ orderList.size()} 개</span></h2>

      <!-- content_1-->
      <div id="content_1">
     <table>
        <tr>
            <th>주문번호</th>
            <th>상품명</th>
            <th>결제금액</th>
            <th>결제일</th>
            <th>취소</th>
        </tr>
        <tbody class="hover">
          <c:forEach var="ol" items="${orderList}">
            <tr>
              <td class="ono" width="200">${ol.paymentNo}</td>
              <td width="350">${ol.paymentName}</td>
              <td width="120"><fmt:formatNumber value="${ol.paymentTotal}" pattern="###,###원"/></td>
              <td width="110">${ol.paymentDate}</td>
              <c:choose>
                <c:when test="${ol.status == 'Y'}">
                  <td width="100"><button id="payCancel" class="cancel_btn">취소하기</button></td>
                </c:when>
                <c:when test="${ol.status == 'R'}">
                  <td width="100">취소요청됨</td>
                </c:when>
                <c:otherwise>
                  <td width="100">취소됨</td>
                </c:otherwise>
              </c:choose>
            </tr>
          </c:forEach>
        </tbody>
    </table>
</div>
      <!-- content_1 끝-->


      <!-- 페이징바 넣을 자리 시작 -->
      <div id="page">
        <div class="page_btn" align="center">

          <ul class="pagination">
            <li> <a href="/list.myorder?memberId=${loginUser.memberId}&currentPage=1" class="first">처음 페이지</a> </li>

            <c:choose>
              <c:when test="${ pi.currentPage eq 1}">
                <li> <a href="#" class="arrow_left" disabled> << </a>  </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pageInfo.currentPage - 1}" class="arrow_left" disabled> << </a>  </li>
              </c:otherwise>
            </c:choose>


            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}" step="1">
              <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${page}" class="active num"> ${page} </a>  </li>
            </c:forEach>


            <c:choose>
              <c:when test="${pi.currentPage eq pi.maxPage}">
                <li> <a href="#" class="arrow_right" disabled> >> </a> </li>
              </c:when>
              <c:otherwise>
                <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pi.currentPage + 1}" class="arrow_right" disabled> >> </a> </li>
              </c:otherwise>
            </c:choose>

            <li> <a href="/list.myOrder?memberId=${loginUser.memberId}&currentPage=${pageInfo.maxPage}" class="last">끝 페이지</a> </li>
          </ul>
        </div>
      </div>

      <!-- 페이징바 넣을 자리 끝 -->



    </div>
  </div>

</div>

<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp" />

<script>

$(".cancel_btn").on("click", function() {

	let paymentNo = parseInt($(this).parent().parent().children(0).eq(0).text());

	console.log(paymentNo);

	$.ajax({
		url : "/reqPayCancel",
		type : "post",
		data : {
			memberId : "${loginUser.memberId}",
			paymentNo : 2023061903370495
		},
		success : function(result) {

			if(result == "1") {

				updatePayStatus();

				var msg = "취소요청이 등록되었습니다.";
				alert(msg);
			}
		},
		error : function() {

			var msg = "알 수 없는 이유로 취소요청에 실패하였습니다.";
			alert(msg);
		}
	});

})

function updatePayStatus() {



	$.ajax({
		url : "/updatePayStatus",
		type : "post",
		data : {
			memberId : ${loginUser.memberId},
			paymentNo : paymentNo
		},
		success : function(result) {

			if(result == "1") {
				console.log("payStatus 변경 성공");
			}

		},
		error : function() {

			console.log("payStatus ajax 실패");
		}
	});

}
</script>

</body>
</html>
