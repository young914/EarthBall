<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 게시판</title>

	<jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

 	<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
    <script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <!-- CSS only -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
	<!-- JavaScript Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>




    <style>

        /* ---------------------------------- */

        .search2>form {
            position: relative;
            width: 200px;

        }

        .search2>form>img {
            position : absolute;
		    width: 17px;
		    top: 10px;
		    right: 30px;
		    margin: 0;
		 }

        .search2>form>input {
           border: 1px solid #bbb;
		    border-radius: 8px;
		    padding: 10px 12px;
		    font-size: 14px;
        }

        /* ---------------------------------- */


        /* 공지사항 */
        table {
        border-collapse: collapse;
        width: 100%;
        }

        td, th {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: left;
        }

        #boardtext {
        background-color:#ffffff;
        border: solid 0.1rem #19a7ce;
        border-radius: 0.7rem;
        color: #19a7ce;
        font-family : Roboto, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 500;
        line-height: 1.1725;
        text-align: center;
        }

        .auto-group-t8bp-ei9 {
        align-items:  center;
        flex-shrink:  0;
        height : 4.6rem;
        margin-bottom: 11.9rem;
        width: 100%;
        }

        .btn-group { float: right; }

        #list, #insertList { /* 버튼크기를 지정 */
              font-size: 18px;
		    width: 100px;
		    height: 100%;
		    border: none;
		    color: white;
		    border-radius: 5px;
		    background-color: #19A7CE;
		    cursor: pointer;
        }

        #QZWUheUHEXEqWaaaEWt8BP {
        background-color: #19a7ce;
        box-shadow: 0 0.4rem 0.4rem rgba(0, 0, 0, 0.25);
        color: #ffffff;
        display: flex;
        font-family: Inter, 'Source Sans Pro';
        font-size: 1.2rem;
        font-weight: 400;
        line-height: 1.2125;
        white-space: nowrap;
        width: 36.4rem;
        }

        .mId {
    text-decoration: none;
     color: black;
  }
  	.enrollbo {
  	    text-decoration: none;
     color: white;
  	}

	/*-------------  버튼 스타일 ---------------*/

		#page {
		  text-align: center;
		  display: inline-flex;
		  align-items: center;
		  justify-content: space-around
		}
		.page_btn {
		  align-items: center;
		}
		.pagination {
		  list-style: none;
		  padding: 0;
		  margin-top: 20px;
		}
		.pagination li {
		  display: inline;
		  text-align: center;
		}
		/* 숫자들에 대한 스타일 지정 */
		.pagination a {
		  float: left;
		  display: block;
		  font-size: 14px;
		  text-decoration: none;
		  padding: 5px 12px;
		  color: #797979;
		  line-height: 1.5;
		}
		.first { margin-right: 15px; }
		.last { margin-left: 15px; }
		.first:hover, .last:hover, .arrow_left:hover, .arrow_right:hover {
		  color: #146C94;
		}
		.pagination a:active {
		  cursor: default;
		  color: #69ABCE;
		}
		.pagination a:active {
		  outline: none;
		}
		.num {
		  margin-left: 3px;
		  padding: 0;
		  width: 30px;
		  -moz-border-radius: 100%;
		  -webkit-border-radius: 100%;
		  border-radius: 100%;
		}
		.num:hover {
		  background-color: #146C94;
		  color: #FFFFFF;
		}
		.num:active, .modal .num:active {
		  background-color: #69ABCE;
		  cursor: pointer;
		}

		.title{
            width : 250px;
            height : 70px;
            margin : 30px 0px 0px 15px;
            box-sizing : border-box;
            align-items : center;
            display : flex;
        }

           .bar {
            width : 12px;
            height : 70px;
            background-color : #146C94;
        }

         .title_text{
            width : 200px;
            height : 50px;
            font-size : 40px;
            font-weight : bold;
            padding : 0px 0px 7px 10px;
        }

    </style>
</head>
<body>

		<jsp:include page="/WEB-INF/jsp/fo/common/header.jsp"/>

    	<div id="container">

        		<!-- 배너 -->
				<div class="title">
                <div class="bar"></div>
                <div class="title_text">고객센터</div>
				</div>



        <!-- 공지사항 -->
        <div class="board">

                <br/>

<table>
    <thead>
        <tr>
            <th colspan="8">
                <h1 id="boardtext">FAQ</h1>
                <h4 style="text-align: center;">자주 문의하시는 질문입니다.
                            <br>더 자세한 문의는 '문의하기' 게시판을 이용해주세요
                </h4>
                <c:if test="${not empty loginUser}">
                    <span class="btn-group">
                        <!-- 버튼 클래스 -->
                        <button id="insertList">
                            <a class="enrollbo"href="enrollForm.bo">작성하기</a>
                        </button>
                    </span>
                </c:if>
            </tr>
            <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="list.bo">FAQ</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarColor01">
                        <ul class="navbar-nav me-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="list.no">공지사항</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="list.bo">1:1문의</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </thead>
        <tbody>
            <c:forEach var="b" items="${list}">
                <tr>
                    <td class="bno">${b.boardNo}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/detail.bo?bno=${b.boardNo}">${b.boardTitle}</a>
                    </td>
                    <td>${b.memberId}</td>
                    <td>${b.boardDate}</td>
                </tr>
            </c:forEach>
            <tr>
        </tbody>
    </table>
       <div class="accordion" id="accordionExample">
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                                무통장입금 후 입금 확인이 안돼요.
                            </font></font></button>
                          </h2>
                          <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample" style="">
                            <div class="accordion-body">
                              <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">무통장 입금 주문건의 경우 주문 확인 시 수동으로 입금 확인을 진행하고 있으며, 오전 10시 이후 주문 시 익일에 확인 처리가 진행됩니다.

                                금요일 오전 10시 이후 혹은 주말에 주문 및 입금을 진행해주실 경우 입금 확인이 불가능하여 전산상 입금 마감기한 경과로 취소 요청 처리가 될 수 있으나, 가까운 영업일 오전에 담당자 확인 후 취소 철회 및 정상적으로 배송 처리되므로 우려하지 않으셔도 괜찮습니다.

                                빠른 입금 확인 처리를 원하실 경우, 홈페이지 우측 하단 채널톡 상담을 통해 주문번호와 함께 입금 확인 요청을 주시면 처리 도와드리겠습니다.</font>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                              아이디와 비밀번호가 기억나지 않아요.
                            </font></font></button>
                          </h2>
                          <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong>우측 상단의 'Login' 메뉴에 접속하여 '내계정찾기'를 통해 아이디와 비밀번호를 찾으실 수 있습니다.
                                아이디는 이메일 형식이며, 계정 정보는 가입하신 이메일 주소로 전달됩니다.
                                가입하신 이메일 주소를 통해 비밀번호를 재설정하실 수 있습니다.
                                </strong>
                            </div>
                          </div>
                        </div>
                        <div class="accordion-item">
                          <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree"><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">
                              반품 보낸 상품은 언제 환불되나요?
                            </font></font></button>
                          </h2>
                          <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                              <strong><font style="vertical-align: inherit;"><font style="vertical-align: inherit;">반품이 완료된 날 바로 환불을 진행하며, 환불은 카드사 사정에 따라 영업일 기준 3~7일 정도 소요됩니다.
                                자세한 사항은 카드사에 문의 부탁드리며, 7일 이후에도 환불이 되지 않은 경우 고객센터를 통해 문의 부탁드립니다.</font>
                             </div>
                          </div>
                        </div>
                      </div>
</div>
<!-- page_search div -->
</div>
</div>
<jsp:include page="/WEB-INF/jsp/fo/common/footer.jsp"/>
</body>

</html>