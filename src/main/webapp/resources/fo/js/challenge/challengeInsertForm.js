function open_request() {
    let chTitle = $("input[name=chTitle]");                     //챌린지명
    let categoryNo = $("input[name=categoryNo]").val();         // 카테고리일련번호   값!!!
    let chStartDay = $("input[name=chStartDay]");               // 챌린지시작일
    let chEndDay = $("input[name=chEndDay]");                   // 챌린지종료일
    //let fileName = $("#fileNo")[0].files[0].name;               // 파일이름     => 가공필요

    $.ajax({
        url : "/select/fileNo"
        , type : "post"
        /*, data : fileName*/
        , success : function (fileNo) {   // 파일 번호 조회 성공 시, 한 번 더 호출

            console.log("파일번호 조회 성공했음");

            let data = {
                chTitle: chTitle.val()
                , categoryNo: categoryNo
                , chStartDay: chStartDay.val()
                , chEndDay: chEndDay.val()
                , fileNo : fileNo
            }

            console.log("챌린지 오픈 요청_기본정보용 data : " , data);

            $.ajax({
                url: "/openRequest.chall"
                , type: "post"
                , data: data
                , success: function () {
                    alert("챌린지 오픈 요청이 되었습니다.");
                    console.log("챌린지 오픈 요청 성공");
                    location.href = "/main.chall";
                }
                , error: function () {
                    alert("챌린지 오픈 요청이 되지 않았습니다.");
                    console.log("챌린지 오픈 요청 실패");
                }
            });
        }
        , error : function() {
            console.log("조회된 파일번호가 없습니다.");
        }
    });
    return true;
}

function uploadImage() {
    let fileInput = $('#fileNo')[0].files[0];
    if (fileInput) {
        let imageType = /^image\//;

        if (!imageType.test(fileInput.type)) {
            // 이미지 파일이 아닐 경우 처리
            console.error('Selected file is not an image.');
            return;
        }

        let formData = new FormData();
        formData.append('file', fileInput);

        $.ajax({
            url: '/challenge/file-upload',
            type: 'POST',
            data: formData,
            processData: false,
            contentType: false,
            success: function (response) {
                // 업로드 성공 시 처리
                console.log('Image uploaded successfully.');
                $("#fileNo").siblings(".image-box").attr("src", response.filePath);
            },
            error: function () {
                // 업로드 실패 시 처리
                console.error('Image upload failed.');
            }
        });
    } else {
        // 파일이 선택되지 않았을 경우 처리
        console.error('No file selected.');
    }

}