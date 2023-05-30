<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <jsp:include page="" />

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>공통코드 수정</h2>
            <br>

            <form id="enrollForm" method="post" action="">
                <table algin="center">
                    <tr>
                        <th><label for="title">그룹코드</label></th>
                        <td><input type="text" class="form-control" name="grpCode" value="${ grp.grpCode }" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="writer">그룹코드명</label></th>
                        <td><input type="text" class="form-control" name="grpCodeName" value="${ grp.grpCodeName }" readonly></td>
                    </tr>
                    <tr>
                        <th>공통코드</th>
                        <td>
                            <input type="text" class="form-control" name="code"  value="${ code.code }" readonly>
                            <input type="hidden" name="beforeCode" value="${ code.code }">
                        </td>
                    </tr>
                    <tr>
                        <th>공통코드명</th>
                        <td>
                            <input type="text" class="form-control" name="codeName" value="${ code.codeName }" required>
                        </td>
                    </tr>
                    <tr>
                        <th>우선순위 번호</th>
                        <td>
                            <input type="text" class="form-control" name="sortNo" value="${ code.sortNo }" required>
                        </td>
                    </tr>



                </table>
                <br>

                <div align="center">
                    <button type="button" class="btn btn-primary" onclick="codeValidate();">수정하기</button>
                    <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <jsp:include page="" />

    <script>
	    function codeValidate() {
			let grpCode = $("input[type=text][name=grpCode]").val();
			let code = $("input[type=text][name=code]").val();
			let codeName = $("input[type=text][name=codeName]").val();
			let sortNo = $("input[type=text][name=sortNo]").val();

			let regExp = /^(?=.*[a-zA-Z])(?=.*[0-9]).{1,8}$/;

			if(!regExp.test(code)) {
				alert("영어, 숫자를 조합한 8글자 이하의 코드를 입력해주세요.");
				$("input[type=text][name=code]").focus();
				return false;
			}

			regExp = /^[가-힣]{2,}$/;

			if(!regExp.test(codeName)) {
				alert("코드는 2글자 이상의 한글로 입력해주세요.");
				$("input[type=text][name=codeName]").focus();
				return false;
			}

			regExp = /^[0-9]+$/;

			if(!regExp.test(sortNo)){
				alert("우선순위는 숫자로만 입력해주세요.");
				$("input[type=text][name=sortNo]").focus();
				return false;
			}

			let data = { code : code
					   , codeName : codeName
					   , sortNo : sortNo
					   , grpCode : grpCode};

			console.log("코드 잘 들어감? : " , data);

			$.ajax({
				  url : "update.code"
				, type : "post"
				, data : data
				, success : function(result) {

					if(result > 0) {
						alert("공통코드가 수정되었습니다.");
						console.log("공통코드 수정 성공");
						location.href ="list.code";
					} else {
						alert("공통코드가 수정되지 않았습니다.");
						console.log("공통코드 수정 실패");
					}
				}
				, error : function() {
					console.log("공통코드 수정 ajax 통신 실패");
				}
			});

			return true;
	    }

    </script>

</body>
</html>