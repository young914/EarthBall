let quantity = $(".quantity").val();
let price = parseInt($("#productPrice").children().text());

$(".up").click(function(){
    quantity++;
    var total = price * quantity
    $(".quantity").val(quantity);
    // id="total"인 태그의 자식 태그 중에 첫번째 span 태그의 text를 total로 바꿔줌
    $("#total").children().eq(0).text(total);
});
$(".down").click(function(){
    if(quantity == 1){
        return;
    }
    quantity--;
    var total = price * quantity
    $(".quantity").val(quantity);
    $("#total").children().eq(0).text(total);
});

function detail(){
    $("#productDetail").show();
    $("#productReview").hide();
    // $("#productQna").hide();
}
function review(){
    $("#productDetail").hide();
    $("#productReview").show();
    // $("#productQna").hide();
}
function qna(){
    $("#productDetail").hide();
    $("#productReview").hide();
    // $("#productQna").show();
}

// 리뷰 댓글
function reviewToggle() {
    $(".reviewArea").click(function() {
        $(this).siblings(".replyArea").toggle();
        // 만약 replyArea가 보이면 reviewArea의 후손중 img의 크기를 300px로 키우고 
        // replyArea가 안보이면 reviewArea의 후손중 img의 크기를 원래대로 줄인다.
        if($(this).siblings(".replyArea").css("display") == "block"){
            $(this).children("img").css("width", "300px");
        } else {
            $(this).children("img").css("width", "100px");
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