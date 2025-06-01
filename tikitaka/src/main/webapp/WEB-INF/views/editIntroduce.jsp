<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>

<head>
    <title>설문-자기소개
    </title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/introduceForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
	</script>
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
        <form action="${pageContext.request.contextPath}/mypage/editFormMenu" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">간단한 한 줄 소개를 해주세요</div>
	        	<div class="description">매칭 시 상대에게 보여질 자기소개를 작성해주세요!</div>
	            <div class="intro-box">
	                <textarea class="intro-textarea" name="introduce" placeholder="자기소개를 입력해주세요 :)"></textarea>
	            </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">수정하기</button>
	        </div>
		</form>
    </div>

</body>

</html>