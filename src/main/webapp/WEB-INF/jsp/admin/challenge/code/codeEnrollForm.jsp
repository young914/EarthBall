<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>그룹코드 생성하기</title>
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
            <h2>공통코드 생성</h2>
            <br>

            <form id="enrollForm" method="post" action="">
                <table algin="center">
                    <tr>
                        <th>그룹코드</th>
                        <td><input type="text" class="form-control" name="grpCode" value="${ grp.grpCode }" readonly></td>
                    </tr>
                    <tr>
                        <th>그룹코드명</th>
                        <td><input type="text" class="form-control" name="grpCodeName" value="${ grp.grpCodeName }" readonly></td>
                    </tr>
                    <tr>
                        <th>공통코드</th>
                        <td>
                            <input type="text" class="form-control" name="code" placeholder="1~8글자의 코드를 입력해주세요.(영어, 숫자 입력가능)" required>
                        </td>
                    </tr>
                    <tr>
                        <th>공통코드명</th>
                        <td>
                            <input type="text" class="form-control" name="codeName" required>
                        </td>
                    </tr>
                    <tr>
                        <th>우선순위 번호</th>
                        <td>
                            <input type="text" class="form-control" name="sortNo" required>
                        </td>
                    </tr>



                </table>
                <br>

                <div align="center">
                    <button type="button" class="btn btn-primary" onclick="codeValidate();">생성하기</button>
                    <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>

    <script>
	    function codeValidate() {
			let grpCode = $("input[type=text][name=grpCode]").val();
			let code = $("input[type=text][name=code]").val();
			let codeName = $("input[type=text][name=codeName]").val();
			let sortNo = $("input[type=text][name=sortNo]").val();

			let regExp = /^(?=.*[a-zA-Z0-9]).{1,8}$/;

			if(!regExp.test(code)) {
				alert("8글자의 코드를 입력해주세요.(영어, 숫자 입력가능)");
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
				  url : "insert.code"
				, type : "post"
				, data : data
				, success : function(result) {

					if(result > 0) {
						alert("공통코드가 생성되었습니다.");
						console.log("공통코드 생성 성공");
                        location.href="list.grp";
					} else {
						alert("공통코드가 생성되지 않았습니다.");
						console.log("공통코드 생성 실패");
					}
				}
				, error : function() {
					console.log("공통코드 생성 ajax 통신 실패");
				}
			});

			return true;
	    }

    </script>

</body>
</html>