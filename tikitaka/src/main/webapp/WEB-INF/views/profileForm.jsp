<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>프로필</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/profileForm.css">
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
	    
	    <form action="${pageContext.request.contextPath}/user/address" method="post" class="form-layout" style="align-items: center;">
		    <div class="content">
		        <div class="title">프로필에 쓰일 동물을 선택해주세요</div>
		        <div class="animal-grid">
		            <div class="animal-card" style="background-color: #fff9c4;">🐱</div>
		            <div class="animal-card" style="background-color: #ffecb3;">🐶</div>
		            <div class="animal-card" style="background-color: #fce4ec;">🐹</div>
		            <div class="animal-card" style="background-color: #f8bbd0;">🐰</div>
		            <div class="animal-card" style="background-color: #bbdefb;">🐻</div>
		            <div class="animal-card" style="background-color: #cfd8dc;">🐺</div>
		        </div>
		    </div>
	        <div class="footer">
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
        </form>
	</div>
</body>
</html>