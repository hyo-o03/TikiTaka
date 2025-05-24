<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>MBTI</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    	<link rel="stylesheet" href="${pageContext.request.contextPath}/css/mbtiForm.css">
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
		    <div class="title">MBTI 정보 수정</div>
		
		    <div class="mbti-select-wrapper">
		        <select class="mbti-dropdown" name="mbti">
		            <option value="" disabled selected>선택하기</option>
		            <option value="INTJ">INTJ</option>
		            <option value="INTP">INTP</option>
		            <option value="ENTJ">ENTJ</option>
		            <option value="ENTP">ENTP</option>
		            <option value="INFJ">INFJ</option>
		            <option value="INFP">INFP</option>
		            <option value="ENFJ">ENFJ</option>
		            <option value="ENFP">ENFP</option>
		            <option value="ISTJ">ISTJ</option>
		            <option value="ISFJ">ISFJ</option>
		            <option value="ESTJ">ESTJ</option>
		            <option value="ESFJ">ESFJ</option>
		            <option value="ISTP">ISTP</option>
		            <option value="ISFP">ISFP</option>
		            <option value="ESTP">ESTP</option>
		            <option value="ESFP">ESFP</option>
		        </select>
		
		        <div class="mbti-option">몰라요</div>
		    </div>
		</div>
        <div class="footer">
            <button type="submit" class="next-button">수정하기</button>
        </div>
	</div>
</body>
</html>