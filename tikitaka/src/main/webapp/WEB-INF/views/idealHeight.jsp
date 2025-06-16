<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tiki Taka</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/userForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styleForm.css">

    <meta charset="UTF-8">
    <script>
		function exit() {
		    if (confirm("수정을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		window.addEventListener("DOMContentLoaded", function () {
            const buttons = document.querySelectorAll('.style-tag');
            const hiddenInput = document.getElementById("selectedFashionType");

            buttons.forEach(button => {
                button.addEventListener("click", function (e) {
                    e.preventDefault(); // form submit 방지

                    // 기존 선택 해제
                    buttons.forEach(b => b.classList.remove("selected"));

                    // 새로 선택
                    this.classList.add("selected");

                    // 값 저장
                    hiddenInput.value = this.innerText.trim();
                });
            });
        });
	</script>
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
    </div>
   
	<form action="${pageContext.request.contextPath}/ideal/idealMbti" method="post" class="form-layout">
	    <div class="content">
			<div class="title">선호하는 이상형의 키를 골라주세요</div>
			
			<input type="hidden" name="fashion" id="selectedFashionType">
				
	        <div class="style-grid">
	            <button class="style-tag">상관없음</button>
	            <button class="style-tag">170 - 175</button>
	            <button class="style-tag">175 - 180</button>
	            <button class="style-tag">180 이상</button>
	          </div>
	    </div>
        <div class="footer">
            <button type="submit" class="next-button">다음단계</button>
        </div>
    </form>
</div>
  
</body>
</html>