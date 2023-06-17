// 수량 증가, 감소 및 총 가격 계산
function plus(){
    let amount = $(".amount").val();
    let price = parseInt($("#productPrice").children().text());

    if(amount  > 0){
        amount++;
        var total = price * amount
        $(".amount").val(amount);
        $("#total").children().eq(0).text(total);
    }
}

function minus(){
    let amount = $(".amount").val();
    let price = parseInt($("#productPrice").children().text());

    if(amount > 1){
        amount--;
        var total = price * amount
        $(".amount").val(amount);
        $("#total").children().eq(0).text(total);
    }
}

// 장바구니 추가
// 로그인 안되어있으면 로그인 페이지로 이동
function loginPage(){
    alert("로그인이 필요한 서비스입니다.");
    location.href = "loginForm.me";
}
// 로그인 되어있으면 장바구니 추가
function insertCart(){
    let productNo = $(".productNo").val();
    let memberId = $(".memberId").val();
    let amount = $(".amount").val();
    let price = parseInt($("#productPrice").children().text());

    console.log(productNo);
    console.log(memberId);
    console.log(amount);
    console.log(price);

    $.ajax({
        url: "insert.cart",
        type: "post",
        data: {productNo: productNo,
                memberId: memberId,
                amount: amount,
                price: price},
        success: function(result) {
            if(result == 1){
                console.log("장바구니 추가 완료");
            } else {
                console.log("장바구니 추가 실패");
            }
        },
        error: function() {
            console.log("장바구니 추가 ajax 에러");
        }
    });

}



// 상품 상세보기, 리뷰, QnA 탭
function detail(){
    $("#productDetail").show();
    $("#productReview").hide();
    $("#productQna").hide();
}
function review(){
    $("#productDetail").hide();
    $("#productReview").show();
    $("#productQna").hide();

    reviewList();
}
function qna(){
    $("#productDetail").hide();
    $("#productReview").hide();
    $("#productQna").show();
}

// 리뷰 불러오기
function reviewList(){
    let productNo = $(".productNo").val();

    $.ajax({
        url: "list.review",
        type: "get",
        data: {productNo: productNo},
        success: function(result) {
            let html = "";
            for(let i in result){
                let r = result[i];
                // HTML 요소 동적 생성
                html += '<div class="review' + r.reviewNo + ' review" >';
                    html += '<div class="reviewArea" onclick="reviewToggle('+ r.reviewNo +');">';
                        html += '<div class="star2">';
                            for(let j = 1; j <= r.rating; j++) {
                                html += '<span class="starR1">★</span>';
                            }
                        html += '</div>';
                        html += '<div>';
                            html += '<p>';
                                html += r.reviewContent;
                            html += '</p>';
                        html += '</div>';
                        if(r.changeName != null) {
                            html += '<div>';
                                html += '<img src="/resources/fo/upfiles/' + r.changeName + '">';
                            html += '</div>';
                        }
                        html += '<div class="replyCount">댓글 <span>' + r.count + '</span></div>';
                    html += '</div>';
                    html += '<div class="replyArea">';
                        html += '<div class="area2">';
                            html += '<div><textarea name="" class="replyContent" cols="30" rows="10" placeholder="댓글"></textarea></div>';
                            html += '<div>';
                                html += '<i class="xi-library-image-o"></i>';
                                html += '<button onclick="replyBtn('+ r.reviewNo +');">작성</button>';
                            html += '</div>';
                        html += '</div>';
                        html += '<div class="area1"></div>';
                    html += '</div>';
                html += '</div>';
            }
            $(".reviewContentArea").html(html);
        },
    });
}

// 사진리뷰 토글
function photoToggle(){
    // 한번 누르면 onlyPhoto() 실행
    // 두번 누르면 reviewList() 실행
    if($(".onlyPhoto").text() == "포토 구매평만 보기"){
        $(".onlyPhoto").text("전체리뷰 보기");
        onlyPhoto();
    }
    else {
        $(".onlyPhoto").text("포토 구매평만 보기");
        reviewList();
    }
}

// 사진리뷰만 불러오기
function onlyPhoto(){
    let productNo = $(".productNo").val();
    $.ajax({
        url: "only.photo",
        type: "get",
        data: {productNo: productNo},
        success: function(result) {
            let html = "";
            for(let i in result){
                let r = result[i];
                // HTML 요소 동적 생성
                html += '<div class="review' + r.reviewNo + '">';
                    html += '<div class="reviewArea" onclick="reviewToggle('+ r.reviewNo +');">';
                        html += '<div class="star2">';
                            for(let j = 1; j <= r.rating; j++) {
                                html += '<span class="starR1">★</span>';
                            }
                        html += '</div>';
                        html += '<div>';
                            html += '<p>';
                                html += r.reviewContent;
                            html += '</p>';
                        html += '</div>';
                        if(r.changeName != null) {
                            html += '<div>';
                                html += '<img src="/resources/fo/upfiles/' + r.changeName + '">';
                            html += '</div>';
                        }
                        html += '<div class="replyCount">댓글 <span>' + r.count + '</span></div>';
                    html += '</div>';
                    html += '<div class="replyArea">';
                        html += '<div class="area2">';
                            html += '<div><textarea name="" class="replyContent" cols="30" rows="10" placeholder="댓글"></textarea></div>';
                            html += '<div>';
                                html += '<i class="xi-library-image-o"></i>';
                                html += '<button onclick="replyBtn('+ r.reviewNo +');">작성</button>';
                            html += '</div>';
                        html += '</div>';
                        html += '<div class="area1"></div>'; // 댓글 리스트 영역
                    html += '</div>';
                html += '</div>';
            }
            $(".reviewContentArea").html(html);
        }
    });
}


// 리뷰 댓글
function reviewToggle(reviewNo){
    if($(".review" + reviewNo + " .replyArea").css("display") == "none"){
        $(".review" + reviewNo + " .replyArea").show();
        replyList(reviewNo);
    }else{
        $(".review" + reviewNo + " .replyArea").hide();
    }
}

// 리뷰 댓글 작성
function replyBtn(reviewNo){
    let replyContent = $(event.target).parent().prev().children().val();
    let memberId = $(".memberId").val();
    console.log("댓글 내용 : " + replyContent);
    console.log("리뷰 번호 : " + reviewNo);
    console.log("회원 아이디 : " + memberId);

    if(memberId != "" && replyContent != null){
        $.ajax({
            url: "insert.reply",
            type: "get",
            data: {reviewNo: reviewNo,
                   replyContent: replyContent,
                   memberId: memberId},
            success: function(result) {
                if(result == 1){
                    console.log("댓글 등록 성공");
                    replyList(reviewNo);
                    // 댓글 등록 후 textarea 초기화
                    $(".replyContent").val("");
                    // 댓글 등록 후 댓글 수 증가
                    let count = $(".review" + reviewNo + " .replyCount span").text();
                    count++;
                    $(".review" + reviewNo + " .replyCount span").text(count);

                }
                else {
                    console.log("댓글 등록 실패");
                }
            }
        });
    }
}

// 리뷰 댓글 불러오기
function replyList(reviewNo){
    $.ajax({
        url: "list.reply",
        type: "get",
        data: {reviewNo: reviewNo},
        success: function(result) {
            console.log("불러오기 성공" + result);
            let html = "";
            for(let i in result){
                let r = result[i];
                // HTML 요소 동적 생성
                html += "<div class='replyOne' value='" + r.replyNo + "'>";
                    html += "<div><img src=''></div>";
                    html += "<div>";
                        html += "<div>";
                            html += "<span>" + r.memberName + "</span><span>" + r.createdDate + "</span>";
                        html += "</div>";
                        html += "<div>";
                            html += "<p>" + r.replyContent + "</p>";
                        html += "</div>";
                    html += "</div>";
                html += "</div>";
            }
            $(".review" + reviewNo + " .area1").html(html);
        }
    });
}

// 찜하기
function like(){
	var productNo = $(".productNo").val();
	var memberId = $(".memberId").val();
	if(memberId != ""){
		$.ajax({
        url : "insert.like",
        type : "get",
        data : {productNo : productNo,
                memberId : memberId},
        success : function(result){

            if(result == "success"){
                $(".xi-heart-o").removeClass("xi-heart-o").addClass("xi-heart");
                $(".unLikeBtn").removeAttr("onclick");
                $(".unLikeBtn").attr("onclick", "unlike()");
                $(".likeBtn").removeAttr("onclick");
                $(".likeBtn").attr("onclick", "unlike()");
            }
        }
    });
	}else{
        // 로그인 페이지로 이동
        alert("로그인이 필요한 서비스입니다.");
        location.href = "loginForm.me";
	}
}
// 찜하기 취소
function unlike(){
    var productNo = $(".productNo").val();
    var memberId = $(".memberId").val();
    if(memberId != ""){
        $.ajax({
            url : "delete.like",
            type : "get",
            data : {productNo : productNo,
                    memberId : memberId},
            success : function(result){

                if(result == "success"){
                    $(".xi-heart").removeClass("xi-heart").addClass("xi-heart-o");
                    $(".unLikeBtn").removeAttr("onclick");
                    $(".unLikeBtn").attr("onclick", "like()");
                    $(".likeBtn").removeAttr("onclick");
                    $(".likeBtn").attr("onclick", "like()");
                }
            }
        });
    }
}

// 리뷰 별점
function starRev(){
    $(".starR").removeClass("on");
    // 클릭당한 요소의 이전형제요소까지 포함해서 on클래스 추가
    $(event.target).addClass("on").prevAll().addClass("on");
}

// 리뷰 작성
function insertReview(){
    var productNo = $(".productNo").val();
    var memberId = $(".memberId").val();
    var reviewContent = $("#reviewContent").val();
    var reviewScore = $(".starR.on").length;
    var upfile = $("input[name=upfile]")[0].files[0];


    console.log(productNo);
    console.log(memberId);
    console.log(reviewContent);
    console.log(reviewScore);
    console.log(upfile);

    var formData = new FormData();

    formData.append("productNo", productNo);
    formData.append("memberId", memberId);
    formData.append("reviewContent", reviewContent);
    formData.append("reviewScore", reviewScore);
    if(upfile !== undefined){
        formData.append("upfile", upfile);
    }else{
        formData.append("upfile", null);
    }

    $.ajax({
        url : "insert.review",
        type : "post",
        data : formData,
        processData : false,
        contentType : false,
        success : function(result){
            if(result == 1){
                reviewList();
                $(".onlyPhoto").text("전체리뷰 보기");
            }
        }
    });

}

// 슬라이드
$(function(){
    $('.reviewSlide').slick({
        autoplay : false,
        autoplaySpeed : 2000,
        speed : 1000,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 1,
        arrows : true
    })
})

// 구매하기 버튼
function order() {

	let amount = $(".amount").val();
	console.log(amount);
	$(".order_form").find("input[name='orders[0].amount']").val(amount);
	$(".order_form").submit();

}
