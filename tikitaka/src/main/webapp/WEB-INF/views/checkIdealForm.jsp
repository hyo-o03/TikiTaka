<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>이상형 조건 우선순위</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/checkIdealForm.css">
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
	
		<div class=".priority-options">
		    <a href="${pageContext.request.contextPath}/ideal/idealAnimalProfile">
		        <div class="priority-card green">
		            <div class="priority-text">이상형 설문 조사<br>하러 가기</div>
		            <div class="priority-sub">인연을 찾으러 갈래요?</div>
		            <div class="priority-arrow">›</div>
		        </div>
		    </a>
		
		    <a href="${pageContext.request.contextPath}/ideal/editSurvey">
		        <div class="priority-card pink">
		            <div class="priority-text">이상형 설문<br>수정하러 가기</div>
		            <div class="priority-sub">인연에 변화가 생겼나요?</div>
		            <div class="priority-arrow">›</div>
		        </div>
		    </a>
		</div>
	</div>
</body>
</html>