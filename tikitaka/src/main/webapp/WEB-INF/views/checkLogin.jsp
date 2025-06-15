<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>가입화면</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkLogin.css">
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
	<div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>
    <div class="title">Tiki Taka</div>
    <div class="center content">
   	    <br>
	    <br><br>
	    <div class="input-wrapper">
		    <button class="loginBtn" onclick="location.href='${pageContext.request.contextPath}/signup/login'">로그인</button>
		</div>	
		<br>
		<div class="input-wrapper">
			<button class="signUpBtn" onclick="location.href='${pageContext.request.contextPath}/signup/register'">회원가입</button>
	    </div>
    </div>
</div>
</body>
</html>