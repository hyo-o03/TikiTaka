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
    <script>
		function exit() {
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
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
		
		function validateAnimalSelection() {
	        const selected = document.getElementById("selectedFacialType").value.trim();
	        if (selected === "") {
	            alert("동물을 하나 선택해주세요.");
	            return false;
	        }
	        return true;
	    }
	</script>
</head>
<body>
	<div class="container">
	    <div class="header">
	        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
	        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
	    </div>
	    
	    <form action="${pageContext.request.contextPath}/user/hobby" method="post" class="form-layout" style="align-items: center;" onsubmit="return validateAnimalSelection();">
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
	            <button type="submit" class="next-button">다음단계</button>
	        </div>
        </form>
	</div>
</body>
</html>