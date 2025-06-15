<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>가입화면</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
	<div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>
    <div class="content">
	    <form action="${pageContext.request.contextPath}/user/home" method="post">
		    <div class="input-wrapper">
			    <input type="text" class="text-input" name="emailOrPhone" placeholder="이메일 혹은 전화번호를 입력해주세요">
			</div>	
			<br>
			<div class="input-wrapper">
				<input type="text" class="text-input" name="password" placeholder="비밀번호를 입력해주세요">
		    </div>
		    <div class="footer">
		         <button type="submit" class="sibutton" name="registerPageButton">Login</button>
		    </div>
	    </form>
    </div>
</div>
</body>
</html>