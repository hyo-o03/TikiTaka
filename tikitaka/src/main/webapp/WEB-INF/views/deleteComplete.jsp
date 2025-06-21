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
</head>

<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="location.href='${pageContext.request.contextPath}/signup/start'">
	    </div>

	    <div class="complete-container">
	   		<h2 class="complete-title">회원 탈퇴가 완료되었습니다</h2>
	   		<p class="complete-desc">
                그동안 Tiki-Taka를 이용해주셔서 감사합니다<br>
	            언젠가 다시 만날 수 있기를 바라요 ☁️
            </p>      
	        <div class="complete-emoji">🙇‍♀️</div>
	    </div>
	
	    <div class="footer" style="margin-top: 40px; text-align: center;">
			<button class="next-button" onclick="location.href='${pageContext.request.contextPath}/signup/start'">첫화면으로</button>
	    </div>
	</div>
</body>
</html>
