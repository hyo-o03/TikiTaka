<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로필</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/profileForm.css">
</head>
<body>
	<div class="container">
	    <div class="header">
	        <div class="logo">Tiki-Taka</div>
	        <div class="icons">
	            <span class="myPage">👤</span>
	            <span class="alarm">🔔</span>
	        </div>
	    </div>
	    <div class="content">
	        <div class="title">프로필 동물 정보 수정</div>
	        <div class="animal-grid">
	            <div class="animal-card" style="background-color: #fff9c4;">🐱</div>
	            <div class="animal-card" style="background-color: #ffecb3;">🐶</div>
	            <div class="animal-card" style="background-color: #fce4ec;">🐹</div>
	            <div class="animal-card" style="background-color: #f8bbd0;">🐰</div>
	            <div class="animal-card" style="background-color: #bbdefb;">🐻</div>
	            <div class="animal-card" style="background-color: #cfd8dc;">🐺</div>
	        </div>
	    </div>
	    <div class="footer">
	        <button class="next-button">수정하기</button>
	    </div>
	</div>
</body>
</html>