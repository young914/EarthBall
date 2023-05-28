<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>그룹코드 수정하기</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color:rgb(247, 245, 245);
            width:80%;
            margin:auto;
        }
        .innerOuter {
            border:1px solid lightgray;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
        }

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>그룹코드 생성</h2>
            <br>

            <form id="enrollForm" method="post" action="">
                <table algin="center">
                    <tr>
                        <th><label for="title">그룹코드</label></th>
                        <td><input type="text" class="form-control" name="grpCode" required value="${ grp.grpCode }"></td>
                    </tr>
                    <tr>
                        <th><label for="writer">그룹코드명</label></th>
                        <td><input type="text" class="form-control" name="grpCodeName" required value="${ grp.grpCodeName }"></td>
                    </tr>
                </table>
                <br>

                <div align="center">
                    <button type="button" class="btn btn-primary" onclick="grpCodeValidate();">수정하기</button>
                    <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">수정취소</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <script type="text/javascript">
    	function grpCodeValidate() {

    		let grpCode = $("input[type=text][name=grpCode]").val();
    		let grpCodeName = $("input[type=text][name=grpCodeName]").val();

    		let regExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{1,8}$/;

    		if(!regExp.test(grpCode)) {
    			alert("영어, 숫자를 조합한 8글자 이하의 코드를 입력해주세요.");
    			$("input[type=text][name=grpCode]").focus();
    			return false;
    		}

    		regExp = /^[가-힣]{2,}$/;

    		if(!regExp.test(grpCodeName)) {
    			alert("그룹코드는 2글자 이상의 한글로 입력해주세요.");
    			$("input[type=text][name=grpCodeName]").focus();
    			return false;
    		}

    		let data = { grpCode : grpCode
    				   , grpCodeName : grpCodeName };

    		console.log("그룹코드 잘 들어감? : " + data);

    		$.ajax({
    			  url : "update.grp"
    			, type : "post"
    			, data : data
    			, success : function(result) {

    				if(result > 0) {
    					alert("그룹코드가 수정되었습니다.");
    					console.log("그룹코드 수정 성공");
    					location.href="/list.grp";
    				} else {
    					alert("그룹코드가 수정되지 않았습니다.");
    					console.log("그룹코드 수정 실패");
    				}
    			}
    			, error : function() {
    				console.log("그룹코드 수정 ajax 통신 실패");
    			}
    		});

    		return true;

    	}
    </script>

</body>
</html>