<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>
    <link rel="stylesheet" href="/resources/fo/css/product/productDetailView.css?after">
    <script type="text/javascript" src="/resources/fo/js/product/productDetailView.js?after"></script>
</head>
<body>

    <jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>


    <div id="container">

        <div id="infomationArea">
            <div id="productPhoto">
                <input type="hidden" class="memberId" value="${ loginUser.memberId }">
                <input type="hidden" class="productNo" value="${ p.productNo }">
            	<c:forEach var="a" items="${ list }">
            		<c:if test="${ a.fileLevel eq 0 }">
                        <img src="/resources/fo/upfiles/${a.changerName}" style="width: 500px; height: 600px;">
            		</c:if>
            	</c:forEach>
            </div>
            <div id="productInfo">
                <div id="productName"><h1>${ p.productName }</h1></div>
                <div id="productPrice"><h4>${ p.price }원</h4></div>
                <hr>
                <div id="productText">
                    더 상큼한 제로웨이스트 양치시간! 지구샵 마일드 고체치약으로 시작해요 :) <br>
                    *틴케이스 별도 구매
                </div>
                <div id="productTable">
                    <table>
                        <tr>
                            <td>원산지</td>
                            <td>대한민국</td>
                        </tr>
                        <tr>
                            <td>구매혜택</td>
                            <td>??? 포인트 적립예정</td>
                        </tr>
                        <tr>
                            <td>배송방법</td>
                            <td>택배</td>
                        </tr>
                        <tr>
                            <td>배송비</td>
                            <td>3,000원 (50,000원 이상 무료배송)</td>
                        </tr>
                    </table>
                </div>
                <div id="priceArea">
                    <div>
                        <table>
                            <tr>
                                <td><button class="down" onclick="minus();">-</button></td>
                                <td><input type="text" value="1" class="amount"></td>
                                <td><button class="up" onclick="plus();">+</button></td>
                            </tr>
                        </table>
                    </div>
                    <div id="total">
                        <span>${ p.price }</span>
                        <span>원</span>
                    </div>
                </div>
                <div id="buttonArea">
                    <div></div>
                    <div><button class="buy_btn">구매하기</button></div>
                    <!-- 주문 form -->
					<form action="payment.pa" method="get" class="order_form">
						<input type="hidden" name="orders[0].productNo" value="${p.productNo}">
						<input type="hidden" name="orders[0].amount" value="">
						<input type="hidden" name="orders[0].memberId" value="${ loginUser.memberId }">
					</form>
                    <div>
                        <c:choose>
                            <c:when test="${ loginUser.memberId != null }">
                                <button type="button" data-bs-toggle="modal" data-bs-target="#staticBackdrop" onclick="insertCart();">
                                    장바구니
                                </button>
                            </c:when>
                            <c:otherwise>
                                <button onclick="loginPage();">
                                    장바구니
                                </button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div>
                        <c:choose>
                            <c:when test="${ likeStatus }"> <!-- 좋아요 한 경우 -->
                                <button onclick="unlike();" class="likeBtn"><i class="xi-heart"></i></button>
                            </c:when>
                            <c:otherwise> <!-- 좋아요를 안한 경우 -->
                                <button onclick="like();" class="unLikeBtn"><i class="xi-heart-o"></i></button>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    <div></div>
                </div>
            </div>
        </div>

        <!-- Modal -->
        <div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-body" style="text-align: center; height: 100px; line-height: 100px;">
                선택하신 상품을 장바구니에 담았습니다.
                </div>
                <div class="modal-footer" style="justify-content: space-evenly;">
                <button type="button" class="btn" data-bs-dismiss="modal">계속쇼핑</button>
                <button type="button" class="btn" onclick="location.href='cart.me'">장바구니</button>
                </div>
            </div>
            </div>
        </div>


        <script>
        </script>

        <div id="photoReviewArea">
            <!-- 배너 -->
            <div class="reviewSlide">
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                    </div>
                </div>
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                    </div>
                </div>
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                    </div>
                </div>
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                    </div>
                </div>
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                    </div>
                </div>
                <div class="review1">
                    <div>
                        <img src="#">
                    </div>
                    <div class="profileArea">
                        <!-- 별점만들기 -->
                        <div class="star1">
                            <span class="starR1">★</span>
                            <span class="starR2">★</span>
                            <span class="starR3">★</span>
                            <span class="starR4">★</span>
                            <span class="starR5">★</span>
                        </div>
                        <div>
                            <p>
                                안녕하세요.
                                저는 지구샵의 고객입니다.
                                지구샵의 제품들은 모두 친환경적이고 좋은 제품들이 많아서 좋아요.
                                앞으로도 좋은 제품들 많이 만들어주세요.
                            </p>
                        </div>
                        <!-- 유저프로필 -->
                        <div class="userProfile">
                            <div class="userPhoto"><img src="#"></div>
                            <div class="userName">이름</div>
                        </div>
                </div>
                </div>
            </div>
        </div>

        <!-- 탭영역 -->
        <div id="navArea">
            <div><button style="border-right: none;" id="detail" onclick="detail();">상세정보</button></div>
            <div><button style="border-right: none;" id="review" onclick="review();">구매평</button></div>
            <div><button id="qna" onclick="qna();">Q&A</button></div>
        </div>

        <!-- 메인영역 -->
        <div id="changeArea">

            <!-- 상세정보 -->
            <div id="productDetail">
            	<c:forEach var="a" items="${ list }">
            		<c:if test="${ a.fileLevel ne 0 }">
                        <img src="/resources/fo/upfiles/${ a.changerName }" alt="">
            		</c:if>
            	</c:forEach>
            </div>

            <!-- 리뷰 -->
            <div id="productReview">

                <c:if test="${ not empty loginUser }">
                    <div>
                        <button type="button" class="btn btn-primary insertReview" data-bs-toggle="modal" data-bs-target="#exampleModal">
                            구매평 작성
                        </button>
                    </div>
                </c:if>


                <!-- Button trigger modal -->


                <!-- Modal -->
                <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog">
                    <div class="modal-content">
                        <form id="insertReview" enctype="multipart/form-data">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">구매평 작성</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>
                            <div class="modal-body">
                                <div><textarea name="" id="reviewContent" maxlength="1000"></textarea></div>
                                <div><input type="file" name="upfile"></div>
                                <div class="starRev">
                                    <span class="starR on" onclick="starRev();">★</span>
                                    <span class="starR" onclick="starRev();">★</span>
                                    <span class="starR" onclick="starRev();">★</span>
                                    <span class="starR" onclick="starRev();">★</span>
                                    <span class="starR" onclick="starRev();">★</span>
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="reset" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
                                <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="insertReview();">작성</button>
                            </div>
                        </form>
                    </div>
                    </div>
                </div>

                <div><button class="onlyPhoto"><i class="xi-library-image-o"></i>포토 구매평만 보기</button></div>

				<c:forEach var="r" items="${ rlist }">
					<div class="review2" onclick="reviewToggle();">
	                    <div class="reviewArea" >
	                        <div class="star2">
	                        	<c:forEach var="i" begin="1" end="${ r.rating }">
		                            <span class="starR1">★</span>
	                            </c:forEach>
	                        </div>
	                        <div>
	                            <p>
	                                ${ r.reviewContent }
	                            </p>
	                        </div>
	                        <div>
	                            <img src="/resources/fo/upfiles/${ r.changeName }">
	                        </div>
	                        <div class="replyCount">댓글 <span>1</span></div>
	                    </div>
	                    <div class="replyArea">
	                        <div class="area1">
	                            <div><img src="#"></div>
	                            <div>
	                                <div>
	                                    <span>관리자</span> <span>2022-01-07</span>
	                                </div>
	                                <div>
	                                    <p>
	                                        안녕하세요. 지구샵입니다. <br>
	                                        댓글을 달아주셔서 감사합니다. <br>
	                                        앞으로도 좋은 제품들 많이 만들어드리겠습니다. <br>
	                                        감사합니다.
	                                    </p>
	                                </div>
	                            </div>
	                        </div>
	                        <div class="area2">
	                            <div><textarea name="" id="" cols="30" rows="10" placeholder="댓글"></textarea></div>
	                            <div>
	                                <i class="xi-library-image-o"></i>
	                                <button>작성</button>
	                            </div>
	                        </div>
	                    </div>
	                </div>
				</c:forEach>

            </div>

            <!-- 문의 -->
            <div id="productQna">
                <div>
                    궁금하신 점이 있으신가요? <br>
                    지구샵에 문의해주세요.
                </div>
                <button class="insertQna">문의하기</button>
            </div>

        </div>
    </div>

    <script>
 	// 구매하기 버튼
    $(".buy_btn").on("click", function(){

    	console.log("버튼 눌리나?");
    	let amount = $(".amount").val();
    	console.log(amount);
    	$(".order_form").find("input[name='orders[0].amount']").val(amount);
    	$(".order_form").submit();
    });
    </script>

    <jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>


</body>
</html>