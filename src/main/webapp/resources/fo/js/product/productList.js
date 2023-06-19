function categoryList(){
    location.href = "categoryList.pro?category=" + event.target.value;
}

function AllList(){
    location.href = "list.pro"
}

function detailView(){
    // input type hidden에 담긴 값 가져오기
    var productNo = $(event.target).children("input").val();
}

// 등록순, 낮은 가격순, 높은 가격순 정렬
function sortList(){
    console.log(event.target.value);
}