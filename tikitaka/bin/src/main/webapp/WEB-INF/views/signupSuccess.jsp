<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>가입완료</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/signupSuccess.css">
    <meta charset="UTF-8">
    <style>
	    .container {
			position: relative;
			background: 
				radial-gradient(circle at left bottom, rgba(179, 135, 252, 0.59) 0.1%, transparent 50%),
				radial-gradient(circle at right top, rgba(179, 135, 252, 0.59) 0.1%, transparent 50%);
			background-size: cover;
			background-repeat: no-repeat;
		}
    </style>
</head>
<body>
<div class="container">
	<div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
    </div>
    <div class="textCog">가입을 완료했어요!</div><br>
    <div class="content">
	    <div style="color:#808080; text-align: center;">
	    	이제 인연을 만날 준비를 시작해요<br>
			매칭을 위한 설문조사를 진행해주세요<br>
			좋은 인연이 나타나길 행운을 빌어요!
		</div>
		<div style="margin-top: 20px; justify-content: center; display: flex;">
			<img src="<c:url value='/images/party.png' />">
		</div>
    </div>
    
	<form action="${pageContext.request.contextPath}/user/profile" method="get">
        <div class="footer">
            <button type="submit" class="next-button">설문 진행하기</button>
        </div>
    </form>
</div>
</body>
</html>