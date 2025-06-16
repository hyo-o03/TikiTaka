<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkLogin.css">
    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("처음으로 돌아가시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
	</script>
</head>
<body>
    <div class="container">
		<div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    <div class="title">Tiki Taka</div>
	    <div class="content">
	   	    <br>
		    <div class="text" style="padding-left: 15%;">당신의 인연을 찾아주는 매칭 플랫폼</div>
		    <br><br>
	        <div class="input-wrapper">
	            <button class="loginBtn" onclick="location.href='${pageContext.request.contextPath}/signup/login'">💌 로그인 💌</button>
	        </div>
			<br>
	        <div class="input-wrapper">
	            <button class="signUpBtn" onclick="location.href='${pageContext.request.contextPath}/signup/register'">💌 회원가입 💌</button>
	        </div>
	    </div>
	</div>
</body>
</html>