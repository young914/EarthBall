<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	html, body{
        margin: 0;
        padding: 0;
    }
    *{font-family: 'Jua', sans-serif;}
    /* footer */
    #footer{
        width: 100%;
        height: 220px;
        margin: 0 auto;
        background-color: #19A7CE;
        display: flex;
        justify-content: space-evenly;
    }
    .logoArea{
        width: 250px;
        height: 100px;
        margin-top: 60px;
        color: white;
        display: flex;
        align-items: center;
        font-size: 50px;
    }
    .logoArea img{
        width: 100px;
        height: 100px;
        padding: 5px;
        border-radius: 50%;
    }
    .logoArea div{
        margin-left: 10px;
        padding: 5px;
        /* 그림자효과 */
        text-shadow: 2px 2px 10px gray;
    }
</style>
</head>
<body>
	<div id="footer">
        <div style="width: 100px;"></div>

        <div class="logoArea">
            <img src="../resources/logo.png">
            <div>지구공</div>
        </div>

        <div style="margin-top: 30px; color: white;">
            <p style="font-weight: bold;">
                이용약관  |  개인정보처리방침  |  도매 전용 B2B몰
            </p>
            <p>
                회사명 : 주식회사 인수온송민근 | 대표자 : 양선주 <br>
                주소 : 서울시 금천구 가산디지털2로 165, 1001호 | 이메일 : contact@jigugong.co.kr | 팩스 : 0303-3444-2050 <br>
                사업자등록번호 : 689-86-00791 | 통신판매업신고 : 제2018-서울동작-02955 | 건강기능식품영업신고 : 제2022-0112707 <br>
                개인정보보호책임자 : 양선주 | 고객센터 : 02-812-2050 | 호스팅 제공자 : (주)지구공
            </p>
        </div>

        <div style="width: 100px;"></div>

    </div>
</body>
</html>