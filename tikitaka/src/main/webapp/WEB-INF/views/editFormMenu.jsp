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
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
            <a href="${pageContext.request.contextPath}/user/alarm" class="alarmBtn">🔔</a>
        </div>
    </div>

    <div class="mypage">
        <div class="user-info">
            <img src="${pageContext.request.contextPath}/images/profile.png" class="avatar" />
            <div class="userid">
                <c:out value="${loginUser.userId}" />
            </div>
        </div>

        <div class="section">
            <h3>개인 정보</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editPassword"><span class="arrow">프로필 동물 변경</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editFacePic">거주지 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">취미 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">MBTI 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">SNS 정보 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">패션 정보 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">흡연유무 변경<span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editKakao">자기소개 변경<span class="arrow">›</span></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>