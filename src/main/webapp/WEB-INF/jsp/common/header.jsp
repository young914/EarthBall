<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://kenwheeler.github.io/slick/slick/slick-theme.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<Style>

	html, body{
    	margin: 0;
    	padding: 0;
    }
    *{font-family: 'Jua', sans-serif;}

     /* header */
    header{
        position: fixed;
        left: 0;
        right: 0;
        top: 0;
        z-index: 9999;
        background-color: white;
        /* bottom �׸��� ȿ�� */
        box-shadow: 0px 0px 10px 0px rgba(0,0,0,0.3);
    }
    .header{
        width: 1200px;
        height: 110px;
        margin: 0 auto;
        display: flex;
        justify-content: space-between;
    }
    .menu{
        width: 1200px;
        height: 38px;
        margin: 0 auto;
        margin-bottom: 30px;
        display: flex;
        justify-content: space-between;
    }
    .login-area{
        display: flex;
        justify-content: space-between;
        width: 200px;
        margin-top: 30px;
        color: #19A7CE;
    }
    .login-area a{
        text-decoration: none;
        color: #19A7CE;
    }
    .logo{width: 250px;}
    .logo a{
        text-decoration: none;
        color: #19A7CE;
        display: flex;
        align-items: center;
        justify-content: center;
        margin-top: 10px;
    }
    .logo img{
        width: 80px;
        height: 80px;
        padding: 5px;
    }
    .logo div{
        font-size: 40px;
        padding: 5px;
    }

    /* ��Ӵٿ� */
    .dropdown{
        position : relative;
        display : inline-block;
    }
    .dropdown-content{
        /* display : none; */
        position : absolute;
        z-index : -99; /*�ٸ� ��ҵ麸�� �տ� ��ġ*/
        background-color : white;
        width : 100px;
        border-radius : 8px;
        box-shadow : 0 0 10px rgba(0,0,0,0.2);
        opacity: 0;
        transition: 0.3s;
    }
    .dropdown-content a{
        display : block;
        text-decoration : none;
        color : black;
        padding: 10px;
        transition: 0.3s;
    }
    .dropdown-content a:hover{
        background-color : #19A7CE;
        color : white;
        border-radius: 8px;
    }
    .dropdown:hover .dropdown-content{
        display : block;
        z-index: 1;
        opacity: 1;
    }
    .dropdown>span{
        display: block;
        margin: 10px;
        cursor: pointer;
        color: #19A7CE;
    }
    .dropdown-content a{
        color : #19A7CE;
    }

    .search>form {
        position: relative;
        width: 200px;
    }

    .search>form>input {
        border: 1px solid #bbb;
        border-radius: 8px;
        padding: 10px 12px;
        font-size: 14px;
    }

    .search>form>i {
        position : absolute;
        width: 17px;
        top: 10px;
        right: 30px;
        margin: 0;
    }
    /* ���뿵����Ÿ�� */
    #container{
        width: 1200px;
        height: 100%;
        margin: 0 auto;
        margin-bottom: 100px;
        padding-top: 170px;
        /* background-color: aliceblue; */
    }
    
    /* �α��� ���� ��Ÿ�� */
    
        .login-wrapper {
            width: 400px;
            height: 350px;
            padding: 40px;
            box-sizing: border-box;
        }
        
        .login-wrapper > h2 {
            font-size: 24px;
            color: #19A7CE;
            margin-bottom: 20px;
        }
        
        #login-form > input {
            width: 100%;
            height: 48px;
            padding: 0 10px;
            box-sizing: border-box;
            margin-bottom: 16px;
            border-radius: 6px;
            background-color: #F8F8F8;
        }
        
        #login-form > input::placeholder {
            color: #D2D2D2;
        }
        
        #login-form > input[type="submit"] {
            color: #fff;
            font-size: 16px;
            background-color: #19A7CE;
            margin-top: 20px;
        }
    
    
</Style>
</head>
<body>

	<!-- �α��� ���� -->
    <header>

    	<!-- �ΰ�+�α��� -->
        <div class="header">
            <div style="width: 200px;"></div>
            <div class="logo">
                <a href="">
                    <img src="../resources/logo.png">
                    <div>������</div>
                </a>
            </div>
            <div class="login-area">
                <div></div>
                
<<<<<<< Updated upstream
                
                <div><a href="">�α���</a></div>
                |
                <div><a href="mem.me">ȸ������</a></div>
=======
                <!-- �α��� �� -->
                <div><a data-toggle="modal" data-target="#loginModal">�α���</a></div>
               |<div><a href="mem.me">ȸ������</a></div>
               
               <div class="modal fade" id="loginModal">
        <div class="modal-dialog modal-sm">
            <div class="modal-content">
            
                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">������</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
        
                <form action="login.me" method="post">
                    <!-- Modal body -->
                    <div class="login-wrapper">
																	         <label for="userId" class="mr-sm-2">���̵� : </label>
		                        <input type="text" placeholder="���̵� �Է����ּ���" id="login-form" name="userId" value="${ cookie.saveId.value }" required> <br>
		                        <label for="userPwd" class="mr-sm-2">��й�ȣ : </label>
		                        <input type="password" placeholder="��й�ȣ�� �Է����ּ���" id="userPwd" name="userPwd" required>
		                   					<br>
                        
															    </div>
                        
                        <c:choose>
                        	<c:when test="${ not empty cookie.saveId }">
                        		<!-- ���� saveId ��� ��Ű�� �ִٸ� : üũ�ڽ��� üũ�ǰԲ� -->
                        		<input type="checkbox" id="saveId" name="saveId" value="y" checked>
                        		<label for="saveId">���̵� ����</label>
                        	
                        	</c:when>
                        	<c:otherwise>
                        		<!-- ���� saveId ��� ��Ű�� ���ٸ� : üũ�ڽ��� üũ���� �ʰԲ� -->
                        		<input type="checkbox" id="saveId" name="saveId" value="y">
                        		<label for="saveId">���̵� ����</label>
                        	</c:otherwise>
                        </c:choose>
                          <!-- Modal footer -->
                    <div class="modal-footer">
                        <button type="submit" >�α���</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">���</button>
                    </div>
                </form>
                   </div>
        </div>
                        
                
                <!-- �α��� �� -->
                
>>>>>>> Stashed changes
                
                
                
                <div></div>
                <!-- <div><a href="">�α׾ƿ�</a></div>|
                <div><a href=""><i class="xi-user"></i></a></div>|
                <div><a href=""><i class="xi-market"></i></a></div> -->
            </div>
        </div>

        <!-- �Ŵ��� -->
        <div class="menu">
            <div>
                <div class="dropdown">
                    <span class="dropbtn">�庸��</span>
                    <div class="dropdown-content">
                        <a href="">�����ٷ���</a>
                        <a href="">���</a>
                        <a href="">��ǰ</a>
                        <a href="">�ֹ�</a>
                        <a href="">��Ȱ</a>
                        <a href="">���</a>
                        <a href="">�����ǰ</a>
                        <a href="">������ǰ</a>
                        <a href="">�ݷ�����</a>
                        <a href="">ȭ��ǰ</a>
                        <a href="">����</a>
                        <a href="">��ü</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">�����Ұ�</span>
                    <div class="dropdown-content">
                        <a href="">#</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">ç����</span>
                    <div class="dropdown-content">
                        <a href="">#</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">ȯ���ϱ�</span>
                    <div class="dropdown-content">
                        <a href="">#</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">����ã��</span>
                    <div class="dropdown-content">
                        <a href="">#</a>
                    </div>
                </div>
                <div class="dropdown">
                    <span class="dropbtn">������</span>
                    <div class="dropdown-content">
                        <a href="">#</a>
                    </div>
                </div>
            </div>


            <div class="search">
                <form action="">
                    <input type="text" placeholder="�˻��� �Է�">
                    <i class="xi-search"></i>
                </form>
            </div>

        </div>
    </header>

</body>
</html>