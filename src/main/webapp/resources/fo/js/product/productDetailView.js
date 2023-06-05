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

// #detail, #review, #qna를 클릭하면
// #productDetail, #productReview, #productQna를 보여줌
$("#detail").click(function(){
    $("#productDetail").show();
    $("#productReview").hide();
    $("#productQna").hide();
});
$("#review").click(function(){
    $("#productDetail").hide();
    $("#productReview").show();
    $("#productQna").hide();
});
$("#qna").click(function(){
    $("#productDetail").hide();
    $("#productReview").hide();
    $("#productQna").show();
});

$(".reviewArea").click(function(){
    $(this).next().toggle();
});

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