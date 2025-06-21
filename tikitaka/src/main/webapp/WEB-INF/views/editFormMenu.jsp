<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
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
            <c:set var="bgColor" value="#eeeeee" />
			<c:choose>
			    <c:when test="${loginUser.facialType eq '고양이'}"><c:set var="bgColor" value="#fff9c4" /></c:when>
			    <c:when test="${loginUser.facialType eq '강아지'}"><c:set var="bgColor" value="#ffecb3" /></c:when>
			    <c:when test="${loginUser.facialType eq '햄스터'}"><c:set var="bgColor" value="#fce4ec" /></c:when>
			    <c:when test="${loginUser.facialType eq '토끼'}"><c:set var="bgColor" value="#f8bbd0" /></c:when>
			    <c:when test="${loginUser.facialType eq '곰'}"><c:set var="bgColor" value="#bbdefb" /></c:when>
			    <c:when test="${loginUser.facialType eq '늑대'}"><c:set var="bgColor" value="#cfd8dc" /></c:when>
			</c:choose>
			
			<div class="avatar" style="background-color: ${bgColor};">
			    <c:choose>
			        <c:when test="${loginUser.facialType eq '고양이'}">&#x1F431;</c:when>
			        <c:when test="${loginUser.facialType eq '강아지'}">&#x1F436;</c:when>
			        <c:when test="${loginUser.facialType eq '햄스터'}">&#x1F439;</c:when>
			        <c:when test="${loginUser.facialType eq '토끼'}">	&#x1F430;</c:when>
			        <c:when test="${loginUser.facialType eq '곰'}">&#x1F43B;</c:when>
			        <c:when test="${loginUser.facialType eq '늑대'}">&#x1F43A;</c:when>
			        <c:otherwise>❓</c:otherwise>
			    </c:choose>
			</div>
            <div class="userid">
                <c:out value="${loginUser.name}" />
            </div>
        </div>
    
        <div class="section">
            <h3>개인 정보</h3>
            <ul>
                <li><a href="${pageContext.request.contextPath}/mypage/editAnimalProfile">프로필 동물 변경<span class="arrow">›</span></a></li>
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