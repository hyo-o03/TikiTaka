<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/editFormMenu.css">
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
            <jsp:include page="alarm.jsp" />
        </div>
    </div>
    <div class="menu">
        <div class="user-info">
            <img src="${pageContext.request.contextPath}/images/profile.png" class="avatar" />
            <div class="userid">
                <c:out value="${loginUser.userId}" />
            </div>
        </div>
    
        <div class="section">
            <h3>개인 정보</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editAnimalProfile">프로필 동물 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editAddress">거주지 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editHobby">취미 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editMbti">MBTI 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editSns">SNS 정보 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editStyle">패션 정보 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editReligion">종교 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editSmoke">흡연유무 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editIntroduce">자기소개 변경<span class="arrow">›</span></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>