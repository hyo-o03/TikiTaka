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
    <style>
        .animal-card.selected {
            transform: scale(1.15);
            border: 3px solid #fbc02d;
            box-shadow: 0 0 15px #f9a82540;
            z-index: 2;
        }
        .animal-card {
            transition: all 0.18s;
            cursor: pointer;
        }
    </style>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <div class="logo">Tiki-Taka</div>
	        <div class="icons">
	            <span class="myPage">👤</span>
	            <span class="alarm">🔔</span>
	        </div>
	    </div>
	    <div class="content">
	        <div class="title">프로필 동물 정보 수정</div>
			<form id="facialTypeForm" action="${pageContext.request.contextPath}/user/updateFacialType" method="post">
			    <input type="hidden" id="facialTypeInput" name="facialType" value="">
			    <div class="animal-grid">
			        <div class="animal-card" style="background-color: #fff9c4;" data-value="고양이">🐱</div>
			        <div class="animal-card" style="background-color: #ffecb3;" data-value="강아지">🐶</div>
			        <div class="animal-card" style="background-color: #fce4ec;" data-value="햄스터">🐹</div>
			        <div class="animal-card" style="background-color: #f8bbd0;" data-value="토끼">🐰</div>
			        <div class="animal-card" style="background-color: #bbdefb;" data-value="곰">🐻</div>
			        <div class="animal-card" style="background-color: #cfd8dc;" data-value="늑대">🐺</div>
			    </div>
			    <div class="footer">
			        <button type="submit" class="next-button">수정하기</button>
			    </div>
			</form>
	    </div>
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
