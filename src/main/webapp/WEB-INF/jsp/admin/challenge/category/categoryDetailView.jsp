<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Document</title>
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

        #templateList {text-align:center;}
        #templateList>tbody>tr:hover {cursor:pointer;}

        #pagingArea {width:fit-content; margin:auto;}
        
        #searchForm {
            width:80%;
            margin:auto;
        }
        #searchForm>* {
            float:left;
            margin:5px;
        }
        .select {width:20%;}
        .text {width:53%;}
        .searchBtn {width:20%;}

        .innerOuter .btn-secondary {
            margin-inline: 5px;
        }
    </style>
</head>
<body>
    

    <div class="content">
        <br><br>
        <div class="innerOuter" style="padding:5% 10%;">
            <h2>카테고리명 - <span id="categoryName" style="color : #2984d4" >${category.categoryName}</span></h2>
            <input type="hidden" id="categoryNo" value="${category.categoryNo}">
            <br>
            
            <input type="button" value="카테고리 삭제" style="float:right;" class="btn btn-secondary" onclick="deleteButton(this);">
            <input type="button" value="카테고리 수정" style="float:right;" class="btn btn-secondary" onclick="editButton(this);">

            <br>
            <br>
            <hr>

            <h5>탬플릿 리스트</h5>

            <input type="button" value="탬플릿 등록" style="float:right;" class="btn btn-secondary" onclick="insertTemp(this);">
            <input type="button" value="탬플릿 확인" style="float:right;" class="btn btn-secondary" onclick="confirmTemp(this);"> <br><br>


            <table id="templateList" class="table table-hover" align="center">
                <thead>
                    <tr>
                        <th>탬플릿 번호 </th>
                        <th>입력타입</th>
                        <th>챌린지 소제목</th>
                        <th>그룹코드</th>
                        <th>우선순위</th>
                        <th></th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="temp" items="${templateList}">
                        <tr>
                            <td>${temp.categoryTemplateNo}</td>
                            <td>${temp.inputType}</td>
                            <td>${temp.chSubTitle}</td>
                            <td>${temp.grpCode}</td>
                            <td>${temp.sortNo}</td>
                            <td>
                                <button type="button" class="btn btn-secondary">수정</button>
                            </td>
                            <td>
                                <button type="button" class="btn btn-secondary">삭제</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <br>

            <br clear="both"><br>


        </div>
        <br><br>

    </div>

    
    <script>
        function editButton(button){
            let categoryNo = $("#categoryNo").val();
    
            console.log("categoryNo : ", categoryNo);
    
            location.href = "updateForm.ca?categoryNo=" + categoryNo;
        }
    
    
        function deleteButton(button) {
            let categoryNo = $("#categoryNo").val();
            console.log("categoryNo : ", categoryNo);
            $.ajax({
                  url : "delete.ca"
                , type : "post"
                , data : { categoryNo : categoryNo}
                , success : function (result) {
                      if(result > 0) {
                          alert("카테고리가 삭제되었습니다.");
                          console.log("카테고리 삭제 성공");
                          location.href = "/list.ca";
                      } else {
                          alert("카테고리가 삭제되지 않았습니다.");
                          console.log("카테고리 삭제 실패");
                      }
                }
                , error : function () {
                      console.log("카테고리 삭제 ajax 통신 실패");
                }
            });
        }

        function insertTemp(button) {
            let categoryNo = $("#categoryNo").val();
            location.href="insertForm.te?categoryNo=" + categoryNo;
        }


        function confirmTemp(button) {
            // 여기다가 이 카테고리의 모든 템플릿을 뿌리를 화면연결지을 것임
            let categoryNo = $("#categoryNo").val();
            location.href="insertForm.ch?categoryNo=" + categoryNo;
        }
    </script>

    
</body>
</html>