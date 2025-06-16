<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/verifyCode.css">
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
	<div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>
    
    <div class="content">	    
        <div class="title">인증번호를 입력해주세요</div>
        
        <div class="input-verfiy">
            <input type="text" class="input-verfiy-box" placeholder="인증번호를 입력해주세요">
            <button class="verify-button" name="certificationButton">인증하기</button>
        </div>
	</div>
	
    <form action="${pageContext.request.contextPath}/signup/baseInfo" method="post">
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
	</form>
</div>
</body>
</html>