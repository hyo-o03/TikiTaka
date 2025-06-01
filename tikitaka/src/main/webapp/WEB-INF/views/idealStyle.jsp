<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>설문-스타일
    </title>
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
   
	<form action="${pageContext.request.contextPath}/mypage/mypage" method="post" class="form-layout">
	    <div class="content">
			<div class="title">이상형의 패션 스타일은 어땠으면 좋겠나요?</div>
			
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
            <button type="submit" class="next-button">완료</button>
        </div>
    </form>
</div>
  
</body>
</html>