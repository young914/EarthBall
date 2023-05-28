<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>

    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet"
          href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script
            src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        .content {
            background-color: rgb(247, 245, 245);
            width: 80%;
            margin: auto;
        }

        .innerOuter {
            border: 1px solid lightgray;
            width: 80%;
            margin: auto;
            padding: 5% 10%;
            background-color: white;
        }

        #categoryList {
            text-align: center;
        }

        #categoryList>tbody>tr:hover {
            cursor: pointer;
        }

        #pagingArea {
            width: fit-content;
            margin: auto;
        }

        #searchForm {
            width: 80%;
            margin: auto;
        }

        #searchForm>* {
            float: left;
            margin: 5px;
        }

        .select {
            width: 20%;
        }

        .text {
            width: 53%;
        }

        .searchBtn {
            width: 20%;
        }

        .codeHead {
            display: none; /* 초기에 숨김으로 설정 */
        }

        .codeContents {
            display: none;
        }

        #categoryList>tbody>.codeHead {
            background-color: rgb(208, 208, 208);
            color: rgb(18, 119, 181);
        }

        #categoryList>tbody>.codeContents {
            background-color: rgb(208, 208, 208);
            color: rgb(18, 119, 181);
        }
    </style>

</head>
<body>

<div class="content">
    <br><br>
    <div class="innerOuter" style="padding: 5% 10%;">
        <h2>카테고리 리스트</h2>
        <br> <br>
        <div align="right">
            <a class="btn btn-secondary" href="/EnrollForm.ca">카테고리 생성</a>
        </div>
        <br>

        <table id="categoryList" class="table table-hover" align="center">
            <thead>
            <tr>
                <th>카테고리 번호</th>
                <th>카테고리명</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach var="category" items="${categoryList}">
                    <tr class="category">
                        <td class="categoryNo" data-category="${ category.categoryNo }">${ category.categoryNo }</td>
                        <td>${ category.categoryName }</td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <br>
        <br clear="both">
        <br>

        <form id="searchForm" action="" method="get" align="center">
            <div class="select">
                <select class="custom-select" name="condition">
                    <option value="grpCode" class="">그룹코드</option>
                    <option value="grpCodeName">그룹코드명</option>
                </select>
            </div>
            <div class="text">
                <input type="text" class="form-control" name="keyword">
            </div>
            <button type="submit" class="searchBtn btn btn-secondary">검색</button>
        </form>
        <br>
        <br>
    </div>
    <br>
    <br>

</div>

<script>

    // ROW 클릭 시, 상세페이지로~
    $(function() {
        $(".category").click(function() {
            let categoryNo = $(this).children(".categoryNo").text();
/*
            $.ajax({
                  url : "detail.ca"
                , type : "get"
                , data : {categoryNo : categoryNo}
                , success : function(result) {

                }
                , error : function() {

                }
            })
*/
            console.log("categoryNo : ", categoryNo);

            location.href="detail.ca?categoryNo=" + categoryNo;
        })
    });

</script>



</body>
</html>