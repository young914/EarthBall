

// 메인 슬라이드
$(function(){
    $('.mainSlide').slick({
        dots: true,
        autoplay : true,
        autoplaySpeed : 3000,
        speed : 1000,
        infinite : true
    });
})

// 환경일기장 슬라이드
$(function(){
    $('.diarySlide').slick({
        autoplay : true,
        autoplaySpeed : 1000,
        speed : 2000,
        infinite: true,
        slidesToShow: 3,
        slidesToScroll: 3
    })
})