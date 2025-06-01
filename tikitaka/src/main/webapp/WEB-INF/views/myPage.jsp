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
                <li><a href="${pageContext.request.contextPath}/mypage/editPassword">비밀번호 변경 <span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editFacePic">내 얼굴사진 변경 <span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/mypage/editBaseInfo">기본정보 변경 <span class="arrow">›</span></a></li>
            </ul>
        </div>
        
        <hr>

        <div class="section">
            <h3>내 프로필</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editFormMenu">매칭 정보 변경 <span class="arrow">›</span></a></li>
            </ul>
        </div>

        <div class="section">
            <h3>이상형 프로필</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/friend/friendAge">동성친구 매칭 정보 설정 <span class="arrow">›</span></a></li>
                <li><a href="${pageContext.request.contextPath}/ideal/idealAnimalProfile">이성친구 매칭 정보 설정 <span class="arrow">›</span></a></li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>