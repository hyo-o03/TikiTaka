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
		    if (confirm("설문 작성을 취소하시겠습니까?")) {
		        window.location.href = "${pageContext.request.contextPath}/signup/start";
		    }
		}
		
		function validateStyle() {
	        const fashion = document.getElementById("selectedFashionType").value.trim();
	        if (fashion === "") {
	            alert("스타일을 하나 선택해주세요!");
	            return false;
	        }
	        return true;
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
	<form action="${pageContext.request.contextPath}/user/smoke" method="post" class="form-layout" onsubmit="return validateStyle();">
	    <div class="content">
			<div class="title">평소 사복 스타일이 궁금해요</div>
			
			<!-- 패션 선택 값 담을 hidden input -->
			<input type="hidden" name="fashion" id="selectedFashionType">
				
	        <div class="style-grid">
	            <button class="style-tag">캐주얼</button>
	            <button class="style-tag">모던</button>
	            <button class="style-tag">스트릿</button>
	            <button class="style-tag">페미닌</button>
	            <button class="style-tag">클래식</button>
	            <button class="style-tag">빈티지</button>
	          </div>
	    </div>
	    <div class="footer">
	        <button type="submit" class="next-button">수정하기</button>
	    </div>
	</form>
</div>
  
</body>
</html>