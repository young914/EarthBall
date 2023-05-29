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
        /* �׸���ȿ�� */
        text-shadow: 2px 2px 10px gray;
    }
</style>
</head>
<body>
	<div id="footer">
        <div style="width: 100px;"></div>

        <div class="logoArea">
            <img src="../resources/logo.png">
            <div>������</div>
        </div>

        <div style="margin-top: 30px; color: white;">
            <p style="font-weight: bold;">
                �̿���  |  ��������ó����ħ  |  ���� ���� B2B��
            </p>
            <p>
                ȸ��� : �ֽ�ȸ�� �μ��¼۹α� | ��ǥ�� : �缱�� <br>
                �ּ� : ����� ��õ�� ���������2�� 165, 1001ȣ | �̸��� : contact@jigugong.co.kr | �ѽ� : 0303-3444-2050 <br>
                ����ڵ�Ϲ�ȣ : 689-86-00791 | ����Ǹž��Ű� : ��2018-���ﵿ��-02955 | �ǰ���ɽ�ǰ�����Ű� : ��2022-0112707 <br>
                ����������ȣå���� : �缱�� | ������ : 02-812-2050 | ȣ���� ������ : (��)������
            </p>
        </div>

        <div style="width: 100px;"></div>

    </div>
</body>
</html>