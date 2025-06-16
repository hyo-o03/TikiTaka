<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css">
    <meta charset="UTF-8">
</head>
<body>
<div class="container">
    <div class="header">
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
			<!-- 알림 드롭다운 include -->
			<jsp:include page="alarm.jsp" />
        </div>
    </div>
    <div class="main">
        <p class="todayMatching">오늘의 매칭</p>
        <div class="matchings">
            <div class="friendMatching">
                <a href="${pageContext.request.contextPath}/match/prioritySelect" style="text-decoration: none; color: inherit;">
                    <p class="matchingMent">오늘의 친구를<br>만나러 가요</p>
                    <img src="${pageContext.request.contextPath}/images/friendHeart.png">
                </a>
            </div>
            <div class="loverMatching">
                <a href="${pageContext.request.contextPath}/match/prioritySelect" style="text-decoration: none; color: inherit;">
                    <p class="matchingMent">오늘의 인연을<br>만나러 가요</p>
                    <img src="${pageContext.request.contextPath}/images/loverHeart.png">
                </a>
            </div>
        </div>
        <div class="matchingResult">
            <div class="mREmoji">🥰</div>
            <div class="mRText">
                <p class="mRSubText">오늘의 매칭 알림</p>
                <p class="mRText">오늘 매칭된 상대 확인하기</p>
            </div>
            <a href="${pageContext.request.contextPath}/match/matchingResultPage" style="text-decoration: none;"><img class="mRBtn" src="${pageContext.request.contextPath}/images/mRBtn.png"></a>
        </div>
    </div>
</div>
</body>
</html>
