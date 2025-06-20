<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/deleteComplete.css">
    
    <meta charset="UTF-8">
    <style>
        .container {
            position: relative;
            background:
                radial-gradient(circle at left bottom, rgba(200, 200, 200, 0.3) 0.1%, transparent 50%),
                radial-gradient(circle at right top, rgba(200, 200, 200, 0.3) 0.1%, transparent 50%);
            background-size: cover;
            background-repeat: no-repeat;
        }

        .footer .next-button {
            background-color: #7a4ff7;
            color: white;
            border: none;
            border-radius: 20px;
            padding: 10px 30px;
            font-size: 15px;
            cursor: pointer;
            width: 150px;
        }

        .textCog {
            font-size: 24px;
            font-weight: bold;
            text-align: center;
            margin-top: 40px;
            color: #444;
        }

        .content {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="location.href='${pageContext.request.contextPath}/signup/start'">
    </div>

     <div class="textCog">회원 탈퇴가 완료되었습니다</div><br>

    <div class="content">
        <div class="emoji">🙇‍♀️</div>
        <div style="color:#808080; margin-top: 10px;">
            그동안 Tiki-Taka를 이용해주셔서 감사합니다<br>
            언젠가 다시 만날 수 있기를 바라요 ☁️
        </div>
    </div>

    <div class="footer" style="margin-top: 40px; text-align: center;">
        <button type="button" class="next-button" onclick="location.href='${pageContext.request.contextPath}/signup/start'">첫화면으로</button>
    </div>
</div>
</body>
</html>
