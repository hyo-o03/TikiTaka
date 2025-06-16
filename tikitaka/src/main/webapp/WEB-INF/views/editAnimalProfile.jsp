<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/animalProfileForm.css">
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
	    <form action="${pageContext.request.contextPath}/user/updateFacialType" method="post" class="form-layout" style="align-items: center;">
		    <div class="content">
		        <div class="title">프로필에 쓰일 동물을 선택해주세요</div>
		        
			    <input type="hidden" id="facialTypeInput" name="facialType" value="">
			    
		        <div class="animal-grid">
		            <div class="animal-card" data-value="고양이" onclick="selectAnimal(this)" style="background-color: #fff9c4;">🐱</div>
		            <div class="animal-card" data-value="강아지" onclick="selectAnimal(this)" style="background-color: #ffecb3;">🐶</div>
		            <div class="animal-card" data-value="햄스터" onclick="selectAnimal(this)" style="background-color: #fce4ec;">🐹</div>
		            <div class="animal-card" data-value="토끼" onclick="selectAnimal(this)" style="background-color: #f8bbd0;">🐰</div>
		            <div class="animal-card" data-value="곰" onclick="selectAnimal(this)" style="background-color: #bbdefb;">🐻</div>
		            <div class="animal-card" data-value="늑대" onclick="selectAnimal(this)" style="background-color: #cfd8dc;">🐺</div>
		        </div>
		    </div>
	    	<div class="footer">
			        <button type="submit" class="next-button">수정하기</button>
			</div>
	    </form>
	</div>
	<script>
	    const cards = document.querySelectorAll('.animal-card');
	    const input = document.getElementById('facialTypeInput');
	    cards.forEach(function(card) {
	        card.addEventListener('click', function() {
	            cards.forEach(c => c.classList.remove('selected'));
	            card.classList.add('selected');
	            input.value = card.getAttribute('data-value');
	        });
	    });
	    // 폼 제출 전 선택 안했으면 경고
	    document.getElementById('facialTypeForm').addEventListener('submit', function(e) {
	        if (!input.value) {
	            alert('동물을 선택해주세요!');
	            e.preventDefault();
	        }
	    });
	</script>
</body>
</html>
