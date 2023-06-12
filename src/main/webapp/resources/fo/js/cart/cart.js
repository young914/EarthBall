// 체크박스 전체 체크 기능
function allCheck(){
    if($("#allCheck").prop("checked")){
        $("input[type=checkbox]").prop("checked", true);
    }else{
        $("input[type=checkbox]").prop("checked", false);
    }
}

// 수량 변경 및 주문금액 변경 기능 및 총 주문금액 변경 기능
function plus(){
    // var productNo = $(event.target).parent().siblings(input[type=hidden]).val();
    var quantity = $(event.target).parent().prev().children().val();

    // console.log(productNo);
    console.log(quantity);
}




