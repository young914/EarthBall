$(document).ready(function() {
    let memberId = $("#memberId").val();

    // 장바구니에 담긴 상품이 있는지 확인
    $.ajax({
        url: "list.cart",
        type: "get",
        data: {memberId: memberId},
        success: function(result) {
            var html = "";

            for(let i in result){
                html += "<tr>";
                    html += "<td>";
                        html += "<input type='checkbox'>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div class='productArea'>";
                            html += "<div>";
                                html += "<img src='/resources/fo/upfiles/" + result[i].changerName + "'>";
                            html += "</div>";
                            html += "<div>";
                                html += result[i].productName;
                            html += "</div>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div>";
                            html += "<table class='quantityArea'>";
                                html += "<tr>";
                                    html += "<input type='hidden' value='" + result[i].productNo + "'>";
                                    html += "<td><button class='down' onclick='minus();'>-</button></td>";
                                    html += "<td>";
                                        html += "<input type='text' id='product-amount-" + result[i].productNo + "' value='" + result[i].amount + "' class='amount'>";
                                    html += "</td>";
                                    html += "<td><button class='up' onclick='plus();'>+</button></td>";
                                html += "</tr>";
                            html += "</table>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div class='price" +  result[i].productNo + "'>";
                            html += "<span>" + result[i].price + "</span>";
                            html += "<span>원</span>";
                        html += "</div>";
                    html += "</td>";
                    html += "<td>";
                        html += "<div>";
                            html += "<span class='totalPrice" + result[i].productNo + "'>" + (result[i].price * result[i].amount) + "</span>";
                            html += "<span>원</span>";
                        html += "</div>";
                    html += "</td>";
                html += "</tr>";
            }

            $(".cartList tbody").html(html);
        }
    });
});

// +버튼 눌른 행만 수량 증가 및 주문금액 증가
function plus(){
    let productNo = $(event.target).parent().parent().parent().parent().find("input[type='hidden']").val();
    let amount = $(event.target).parent().parent().find(".amount").val();
    let price = $(".price" + productNo).children().eq(0).text();

    amount++;
    $("#product-amount-" + productNo).val(amount);
    $(".totalPrice" + productNo).text(price * amount);
}

// -버튼 눌른 행만 수량 감소 및 주문금액 감소
function minus(){
    let productNo = $(event.target).parent().parent().parent().parent().find("input[type='hidden']").val();
    let amount = $(event.target).parent().parent().find(".amount").val();
    let price = $(".price" + productNo).children().eq(0).text();

    if(amount > 1){
        amount--;
        $("#product-amount-" + productNo).val(amount);
        $(".totalPrice" + productNo).text(price * amount);
    }
}