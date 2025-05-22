<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>거주지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
   	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/addressForm.css">
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
		    <div class="title">거주지 정보 수정</div>
		
		    <div class="region-input">
		        <label for="userRegion">내 거주 지역</label>
		        <input type="text" id="userRegion" name="userRegion" placeholder="예: 서울시 마포구">
		    </div>
		    
		    <div class="preference-options">
		        <label class="option">
		            <input type="radio" name="distancePreference" value="close">
		            가까웠으면 좋겠어요
		        </label>
		        <label class="option">
		            <input type="radio" name="distancePreference" value="far">
		            멀어도 괜찮아요
		        </label>
		    </div>
		</div>
	    <div class="footer">
	        <button type="submit" class="next-button">수정하기</button>
	    </div>
	</div>
</body>
</html>