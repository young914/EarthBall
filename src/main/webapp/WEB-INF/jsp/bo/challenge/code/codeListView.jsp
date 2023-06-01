<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

                        <!-- grpCode 한줄 클릭했을 때 둘다 열려야 -->
                        <tr class="codeHead">
                            <th>공통코드</th>
                            <th>공통코드명</th>
                            <th colspan="2">
                                <a class="btn btn-info" onclick="codeEnrollForm(this);">공통코드 생성 </a>
                            </th>
                        </tr>
                    	<c:forEach var="code" items="${ codeList }">
                        	<tr class="codeContents ${code.grpCode}">

	                            <td>${ code.code }</td>
	                            <td>${ code.codeName }</td>
	                            <td>
	                                <a class="btn btn-info" onclick="updateCodeForm('${code.grpCode}', '${code.code}');">수정</a>
	                            </td>
	                            <td>
	                                <input type="button" value="삭제" class="btn btn-info" onclick="deleteCode('${code.grpCode}', '${code.code}');">
	                            </td>
                        	</tr>
                        </c:forEach>


