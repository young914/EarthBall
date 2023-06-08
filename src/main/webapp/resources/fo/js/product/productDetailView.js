// 수량 증가, 감소 및 총 가격 계산
function plus(){
    let quantity = $(".quantity").val();
    let price = parseInt($("#productPrice").children().text());

    if(quantity  > 0){
        quantity++;
        var total = price * quantity
        $(".quantity").val(quantity);
        $("#total").children().eq(0).text(total);
    }
}

function minus(){
    let quantity = $(".quantity").val();
    let price = parseInt($("#productPrice").children().text());

    if(quantity > 1){
        quantity--;
        var total = price * quantity
        $(".quantity").val(quantity);
        $("#total").children().eq(0).text(total);
    }
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
	var productNo = $("#productNo").val();
	var memberId = $("#memberId").val();
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
    var productNo = $("#productNo").val();
    var memberId = $("#memberId").val();
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