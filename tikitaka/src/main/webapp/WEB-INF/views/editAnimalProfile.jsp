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
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		function selectAnimal(element) {
			// 기존 선택 해제
		    document.querySelectorAll('.animal-card').forEach(el => el.classList.remove('selected'));

		    // 선택된 카드에 스타일 추가
		    element.classList.add('selected');

		    // hidden input에 값 넣기
		    document.getElementById("selectedFacialType").value = element.getAttribute("data-value");
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
	    
	    <form action="${pageContext.request.contextPath}/mypage/editFormMenu" method="post" class="form-layout" style="align-items: center;">
		    <div class="content">
		        <div class="title">프로필에 쓰일 동물을 선택해주세요</div>
		        
		        <!-- 동물 선택 값 담을 hidden input -->
				<input type="hidden" name="facialType" id="selectedFacialType">

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
</body>
</html>