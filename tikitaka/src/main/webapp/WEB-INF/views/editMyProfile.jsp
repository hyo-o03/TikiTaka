<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>마이페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/myPage.css">
    <meta charset="UTF-8">
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
	
	    <div class="mypage">
	        <div class="user-info">
	            <img src="images/profile.png" class="avatar" />
	            <div class="userid">userId</div>
	        </div>
	
	        <div class="section">
	            <h3>프로필 정보</h3>
	            <ul>
	                <li><a href="editHobby.jsp">취미<span class="arrow">›</span></a></li>
	                <li><a href="editAddress.jsp">주소<span class="arrow">›</span></a></li>  
	                <li><a href="editMbti.jsp">MBTI<span class="arrow">›</span></a></li>
	                <li><a href="editProfile.jsp">프로필 동물<span class="arrow">›</span></a></li>
	            </ul>
	        </div>
	    </div>
	</div>
</body>
</html>