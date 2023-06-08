<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성하기</title>
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
    <script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

    <!-- include summernote css/js-->
    <link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
    <script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>

    <style>
        .enrollFormBtn {
            float: right;
        }

        #post_subject {
            font-size: 20px;
    border: none;
    border-bottom: 1px solid rgba(128, 128, 128, 0.3);
    border-radius: 0;
    padding: 8px 118px 8px 0;
    line-height: 1.2;
        }
    </style>

    <!-- 썸머노트 스크립트 -->
    <script>
        // 메인화면 페이지 로드 함수
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '내용을 작성하세요',
                height: 400,
                maxHeight: 400,
                focus : true,
                lang : 'ko-KR',
                toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture','link','video']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋움체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'] });

            /* callbacks: {	//여기 부분이 이미지를 첨부하는 부분
					onImageUpload : function(files) {
						uploadSummernoteImageFile(files[0],this);
					},
					onPaste: function (e) {
						var clipboardData = e.originalEvent.clipboardData;
						if (clipboardData && clipboardData.items && clipboardData.items.length) {
							var item = clipboardData.items[0];
							if (item.kind === 'file' && item.type.indexOf('image/') !== -1) {
								e.preventDefault();
							}
						}
					}
				}
	}); */

    /**
	* 이미지 파일 업로드
	*/
	/* function uploadSummernoteImageFile(file, editor) {
		data = new FormData();
		data.append("file", file);
		$.ajax({
			data : data,
			type : "POST",
			url : "/uploadSummernoteImageFile",
			contentType : false,
			processData : false,
            enctype: 'multipart/form-data',
			success : function(data) {
            	//항상 업로드된 파일의 url이 있어야 한다.
				$(editor).summernote('insertImage', data.url);
			}
		});
	} */

	 <script type="text/javascript">
    $(document).on("change", function () {
        let $this = $(this);

    function updateBoardBtn() {
        let boardTitle = $("input[name=boardTitle]");
        let boardContent = $("#boardContent").summernote("code");
        let boardNo = $("input[type=hidden][name=boardNo]").val();

        let updateChallenge = { // 기본 정보 데이터
            boardTitle: boardTitle.val()
            , memberId: "${loginUser.memberId}"
            , boardContent : boardContent
            , chNo : chNo
        }

        console.log("보드 업데이트 요청_기본정보용 data : ", update);

        $.ajax({
            url: "/update.bo"
            , type: "post"
            , data: JSON.stringify(updateChallenge)
            , contentType: 'application/json'
            , success: function (result) {
                if (result > 0) {
                    alert("게시글이 성공적으로 수정되었습니다.");
                    location.href = "/detail.bo?bno=4" + boardNo;
                } else {
                    alert("게시글 수정에 실패하였습니다.");
                }
            }
            , error: function () {
                console.log("게시글 수정용  ajax 연결 실패");
            }
        });
    }


    </script>

<body>
</head>


    <h1>글 작성하기</h1><hr>
    <input id="post_title" name="boardTitle" class="no-margin basic_input title_name w100p mb24" type="text"  value="${b.boardTitle }" required="required"> <br><br>
    <input id="id" name="memberId" class="no-margin basic_input title_name w100p mb24" value="${loginUser.memberName}" readonly> <br><br>
    <textarea id="summernote" name="boardContent" required="required" >${b.boardContent }</textarea>
        <div class="enrollFormBtn">
        <button type="reset" id="resetBtn" class="btn btn-danger" onabort="javascript:history.go(-1);">목록</button>
        <button type="submit" class="btn btn-primary" id="saveBtn" onabort="updateBoardBtn">수정</button>
        </div>


</body>
</html>