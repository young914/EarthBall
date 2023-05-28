<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>카테고리 생성하기</title>
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
        <h2>카테고리 생성</h2>
        <br>

        <form id="enrollForm" method="post" action="">
            <table algin="center">
                <tr>
                    <th><label for="writer">카테고리명</label></th>
                    <td><input type="text" class="form-control" name="categoryName" required></td>
                </tr>
            </table>
            <br>

            <div align="center">
                <button type="button" class="btn btn-primary" onclick="categoryNameValidate();">생성하기</button>
                <button type="reset" class="btn btn-danger" onclick="javascript:history.go(-1);">생성취소</button>
            </div>
        </form>
    </div>
    <br><br>

</div>

<script>
    function categoryNameValidate() {

        let categoryName = $("input[type=text][name=categoryName]").val();

        let regExp = /^[가-힣]{2,}$/;

        if(!regExp.test(categoryName)) {
            alert("카테고리명은 2글자 이상의 한글로 입력해주세요.");
            $("input[type=text][name=categoryName]").focus();
            return false;
        }

        let data = { categoryName : categoryName };

        console.log("카테고리명 잘 들어감? : ", data);

        $.ajax({
            url : "insert.ca"
            , type : "post"
            , data : data
            , success : function(result) {

                if(result > 0) {
                    alert("카테고리가 생성되었습니다.");
                    console.log("카테고리 생성 성공");
                    location.href="/list.ca";
                } else {
                    alert("카테고리가 생성되지 않았습니다.");
                    console.log("카테고리 생성 실패");
                }
            }
            , error : function() {
                console.log("카테고리 생성 ajax 통신 실패");
            }
        });

        return true;

    }
</script>

</body>
</html>