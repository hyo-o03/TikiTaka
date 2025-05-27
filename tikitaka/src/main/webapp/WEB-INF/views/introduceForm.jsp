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
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
	</script>
</head>

<body>
    <div class="container">
        <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
        </div>
        <form action="${pageContext.request.contextPath}/user/finishSurvey" method="post" class="form-layout">
	        <div class="content">
	        	<div class="title">간단한 한 줄 소개를 해주세요</div>
	        	<div class="description">매칭 시 상대에게 보여질 자기소개를 작성해주세요!</div>
	            <div class="intro-box">
	                <textarea class="intro-textarea" placeholder="자기소개를 입력해주세요 :)"></textarea>
	            </div>
	        </div>
	        <div class="footer">
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
		</form>
    </div>

</body>

</html>