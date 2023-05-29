<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

        #enrollForm>table {width:100%;}
        #enrollForm>table * {margin:5px;}
    </style>
</head>
<body>
        

    <div class="content">
        <br><br>
        <div class="innerOuter">
            <h2>챌린지 오픈</h2>
            <br>
           
            <form id="enrollForm" method="post" action="" enctype="">

                <h5 style="color:blue">기본정보</h5>

                <table algin="center">
                    <tr>
                        <th><label for="title">챌린지명</label></th>
                        <td colspan="2"><input type="text" id="title" class="form-control" name="" required></td>
                    </tr>
                    <tr>
                        <th><label for="writer">카테고리</label></th>
                        <td colspan="2"><input type="text" id="writer" class="form-control" value="${category.categoryName}" name="" readonly></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">도전기간</label></th>
                        <td colspan="2"><input type="date" > ~ <input type="date" ></td>
                    </tr>
                    <tr>
                        <th><label for="upfile">썸네일 이미지</label></th>
                        <td><input type="file" id="upfile" class="form-control-file border" name="" accept="image/*"></td>
                    </tr>
                </table>

                <hr>
                
                <!--for문!!!-->
                <c:forEach var="temp" items="${templateList}">
                    <h5 style="color:blue">${temp.chSubTitle}</h5>

                    <!-- select 박스면!!! -->
                    <c:if test="${temp.inputType eq 'select'}">
                        <${temp.inputType} name="${temp.categoryTemplateNo}_${temp.inputType}">

                        <c:forEach var="code" items="${temp.codeList}">
                            <option value=“${code.code}”>${code.codeName}</option>
                        </c:forEach>

                        </select>
                    </c:if>

                    <!-- checkbox면!!! -->
                    <c:if test="${temp.inputType eq 'checkbox'}">
                        <c:forEach var="code" items="${temp.codeList}">
                            <input type="${temp.inputType}" id=“${temp.categoryTemplateNo}_${code.code}” name="${temp.categoryTemplateNo}_${temp.inputType}" >
                            <label for=“${temp.categoryTemplateNo}_${code.code}”> ${code.codeName} </label>
                        </c:forEach>
                    </c:if>


                    <!-- radio라면!!! -->
                    <c:if test="${temp.inputType eq 'radio'}">
                        <c:forEach var="code" items="${temp.codeList}">
                            <input type=${temp.inputType} id=“${temp.categoryTemplateNo}_${code.code}”
                                   name=“${temp.categoryTemplateNo}_${temp.inputType}”>
                            <label for=“${temp.categoryTemplateNo}_${code.code}”> ${code.codeName} </label>
                        </c:forEach>
                    </c:if>


                    <!--textarea 일 때 -->
                    <c:if test="${temp.inputType eq 'textarea'}">
                         <${temp.inputType} name=“${temp.categoryTemplateNo}_${temp.inputType}” row=“” cols=“”></${temp.inputType}>
                     </c:if>


                    <!-- 이미지 파일일 때 -->
                    <c:if test="${temp.inputType eq 'file'}">
                        <input type=${temp.inputType} name=“${temp.categoryTemplateNo}_${temp.inputType}” accept=“image/*”>
                    </c:if>
    </c:forEach>







                <br>

                <div align="center">
                    <button type="submit" class="btn btn-primary">등록하기</button>
                    <button type="reset" class="btn btn-danger">취소하기</button>
                </div>
            </form>
        </div>
        <br><br>

    </div>
    

</body>
</html>