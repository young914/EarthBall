<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>�� �ۼ��ϱ�</title>
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

        #post_title, #id {
            font-size: 20px;
    border: none;
    border-bottom: 1px solid rgba(128, 128, 128, 0.3);
    border-radius: 0;
    padding: 8px 118px 8px 0;
    line-height: 1.2;
        }
    </style>

    <!-- ��ӳ�Ʈ ��ũ��Ʈ -->
    <script>
        // ����ȭ�� ������ �ε� �Լ�
        $(document).ready(function () {
            $('#summernote').summernote({
                placeholder: '������ �ۼ��ϼ���',
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
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','���� ���','�ü�','����ü','����','����ü','����ü'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'] });

            /* callbacks: {	//���� �κ��� �̹����� ÷���ϴ� �κ�
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
	* �̹��� ���� ���ε�
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
            	//�׻� ���ε�� ������ url�� �־�� �Ѵ�.
				$(editor).summernote('insertImage', data.url);
			}
		});
	} */

	        // �ۼ� ��ư Ŭ�� �Լ�
	        $(document).on('click','#saveBtn',function() {
	            saveContent();
	        });
	        // ��� ��ư Ŭ��
	        $(document).on('click','#resetBtn',function() {
	            window.location.href ="list.bo";
	        })

	    });

       		 // ������ ����
		       function saveContent() {
		    // get value
		    var summernoteContent = $('#summernote').summernote('code'); //summer note (description)
		    var boardTitle = $("#post_title").val();
		    var memberId = "${loginUser.memberId}";

		    // Save to server
		    $.ajax({
		        type: "POST",
		        url: "/insert.bo",
		        data: { boardTitle : boardTitle, boardContent : summernoteContent, memberId : memberId },
		        success: function(response) {
		            alert("�� �ۼ� �Ϸ�");
		            window.location.href="list.bo"; // redirect to another page
		        },
		        error: function(e) {
		            alert("�� �ۼ� ����");
		        }
		    });
		}

    </script>

<body>
</head>


    <h1>�� �ۼ��ϱ�</h1><hr>
    <input id="post_title" name="boardTitle" class="no-margin basic_input title_name w100p mb24" type="text" placeholder="����" required="required"> <br><br>
    <input id="id" name="memberId" class="no-margin basic_input title_name w100p mb24" value="${loginUser.memberName}" readonly> <br><br>
    <textarea id="summernote" name="boardContent"></textarea>
        <div class="enrollFormBtn">
        <button type="reset" id="resetBtn" class="btn btn-danger">�������</button>
        <button type="submit" class="btn btn-primary" id="saveBtn">�ۼ�</button>
        </div>


</body>
</html>