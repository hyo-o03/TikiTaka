<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-종료
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/finishSurvey.css">

    <meta charset="UTF-8">
</head>

<body>
    <div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png">
	    </div>
        <div class="complete-container">
            <h2 class="complete-title">드디어 모든 절차가 끝났어요</h2>
            <p class="complete-desc">
                매칭을 위한 설문조사가 모두 끝났어요!<br>
                이제 원하는 만남을 선택하여 매칭을 신청할 수 있어요<br>
                좋은 인연이 나타나길 빌어요
            </p>
            <div class="complete-emoji">🥰</div>
        </div>
        <div class="footer">
            <button class="next-button" onclick="location.href='${pageContext.request.contextPath}/user/home'">확인</button>
        </div>
    </div>
</body>
</html>