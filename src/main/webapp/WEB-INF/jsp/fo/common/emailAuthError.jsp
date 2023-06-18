<%--
  Created by IntelliJ IDEA.
  User: young
  Date: 2023-06-18
  Time: 오후 10:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>이메일 인증 후 사용가능한 서비스입니다.</title>

    <jsp:include page="/WEB-INF/jsp/fo/common/common.jsp"/>

  <style>
    body {
      background-color: white;
      font-family: 'Jua', sans-serif;
    }

    .container {
      max-width: 1200px;
      margin: 0px auto;
      padding: 40px;
      background-color: #69abce;
      border-radius: 5px;
      color: white;
      text-align: center;
    }

    h1 {
      font-size: 24px;
      margin-top: 0;
    }

    p {
      font-size: 18px;
      margin-bottom: 20px;
    }

    button {
      padding: 10px 20px;
      background-color: white;
      color: #146C94;
      border: none;
      border-radius: 5px;
      font-size: 16px;
      cursor: pointer;
    }

    button:hover {
      background-color: #146C94;
      color: white;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Email Verification</h1>
  <p>이메일 인증 후 이용이 가능합니다.</p>
  <button onclick="emailAuth();">인증하기</button>
</div>

<script>
  function emailAuth() {
    location.href="/myPage.me?memberId=" + '${loginUser.memberId}';
  }
</script>

</body>
</html>
