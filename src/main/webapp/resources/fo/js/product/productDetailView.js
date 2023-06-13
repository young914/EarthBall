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
}
function qna(){
    $("#productDetail").hide();
    $("#productReview").hide();
    $("#productQna").show();
}

// 리뷰 댓글
function reviewToggle() {
    $(".reviewArea").click(function() {
        $(this).siblings(".replyArea").toggle();
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
    formData.append("upfile", upfile);

    $.ajax({
        url : "insert.review",
        type : "post",
        data : formData,
        processData : false,
        contentType : false,
        success : function(result){
            if(result == "success"){
                alert("리뷰가 등록되었습니다.");
                location.reload();
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