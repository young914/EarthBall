// 그룹코드 수정하기
$(document).on('click', '.editButton', function() {
    // 클릭한 수정 버튼의 부모 요소인 <tr>을 선택
    let $row = $(this).closest('tr');

    // <td> 요소에서 grpCode 값을 가져오기
    let code = $row.find('.code').text();

    // 가져온 grpCode를 사용하여 필요한 작업을 수행
    console.log("code:", code);

    location.href = "updateForm.grp?code=" + code;
});

// 그룹코드 삭제하기
$(document).on('click', '.deleteButton', function() {
    let $row = $(this).closest('tr');

    let code = $row.find('.code').text();

    console.log("code:", code);

    location.href = "deleteForm.grp?code=" + code;
});

// 그룹코드 클릭 시, 공통코드 슬라이드
$(function() {
    $(".grpCode").click(function() {
        let grpCode = $(this).find(".code").attr("data-grpCode");	// $(".grpCode")의 자손 중에서 .code 찾고,
        // 그놈의 data-grpCode속성값을 grpCode에 담기
        if($(this).next().prop("class") == 'codeHead') {			// $(".grpCode")의 다음 중 class 속성값이 codeHead와 일치한다면 if 문 안으로 들어가기

            //요소의 상태를 나타내는 불리언 속성인 경우 (예: checked, disabled): prop()
            // 일반적인 HTML 속성인 경우 (예: class, id, src): attr()
            $(this).next().slideUp();
            $(this).siblings('.' + grpCode).slideUp();				// siblings() : 형제 요소를 선택하는 메서드
            $(this).siblings('.' + grpCode).remove();
            $(this).next().remove();								// 만약 else 문으로 넘어가 ajax가 계속적으로 호출된다면, 계속해서 같은 데이터가
            // 쌓여서 1개, 2개, 3개.... 쌓일 것이므로  제거해주는 것임
        } else {													// tr을 클릭해서 열려있을 경우에만 true 이기 때문에
            // 보통 열려있지 않으므로 else 문으로 들어오는게 정상
            let $this = $(this);									// ajax 를 타고 오면 $(this)가 안먹는 경우가 발생하기도 하므로
            // 이를 방지하기 위해 ajax 타기 전 미리 변수에 담아 놓은 것임
            console.log(grpCode);
            $.ajax({
                url : "list.code",
                type : "get",
                data : {
                    grpCode : grpCode
                },
                success : function(result) {				// jsp 파일을 result로 받을 수 있음!!! ***  => return "admin/codeListView";
                    $this.after(result);					// after() : 요소의 뒤에 새로운 요소나 내용을 추가하는 메서드
                    // <div id="target">기존 요소</div>
                    // $("#target").after("<p>새로운 요소</p>");
                    // ======> <div id="target">기존 요소</div>
                    //			<p>새로운 요소</p>
                    // 선택한 요소의 뒤에 여러 개의 요소나 내용을 추가할 수도 있음
                    // ex) $("#target").after("<p>첫 번째 요소</p>", "<p>두 번째 요소</p>");
                    $('.codeHead').slideDown();
                    $('.codeContents').slideDown();
                },
                error : function() {
                    console.log("공통코드 생성 ajax 통신 실패");
                }
            });
        }
    });
});

// 그룹코드 담아서 보내기
function codeEnrollForm(element) {

    let grpCode = $(element).closest('tr').prev('.grpCode').find(
        '.code').text();
    //console.log("grpCode : " + grpCode);

    location.href = "codeEnrollForm?grpCode=" + grpCode;
}


function updateCodeForm(grpCode, code) {

    //console.log("들어옴1", grpCode, code);
    location.href = "updateForm.code?grpCode=" + grpCode + "&code=" + code;

    //console.log("들어옴2", grpCode, code);
}


function deleteCode(grpCode, code) {
    console.log("지울 코드 들어와 : " , code);

    $.ajax({
        url : "delete.code"
        , type : "post"
        , data : {
            grpCode : grpCode
            , code : code
        }
        , success : function(result) {

            if(result > 0) {
                alert("공통코드가 삭제되었습니다.");
                console.log("공통코드 삭제 성공");
                location.href = "/list.grp";
            } else {
                alert("공통코드가 삭제되지 않았습니다.");
                console.log("공통코드 삭제 실패");
            }
        }
        , error : function() {
            console.log("공통코드 삭제 ajax 통신 실패");
        }
    });
}