<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>가입화면</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/register.css">
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
	    <div class="text" style="padding-left: 15%;">전화번호 또는 이메일로 가입해서<br>새로운 인연을 만들어요!</div>
	    <br><br>
	    <form action="${pageContext.request.contextPath}/signup/terms" method="post">
		    <div class="input-wrapper">
			    <input type="text" class="text-input" name="registerPhone" placeholder="전화번호로 가입">
			</div>	
			<br>
			<div class="input-wrapper">
				<input type="text" class="text-input" name="registerEmail" placeholder="이메일로 가입">
		    </div>
		    <div class="footer">
		         <button type="submit" class="sibutton" name="registerPageButton">Sign In</button>
		    </div>
	    </form>
    </div>
</div>
</body>
</html>