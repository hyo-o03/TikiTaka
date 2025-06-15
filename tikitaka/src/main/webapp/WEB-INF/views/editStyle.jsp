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
        <div class="logo"><a href="${pageContext.request.contextPath}/user/home" class="homeBtn">Tiki-Taka</a></div>
        <div class="icons">
            <a href="${pageContext.request.contextPath}/user/myPage" class="mypageBtn">👤</a>
            <a href="${pageContext.request.contextPath}/user/alarm" class="alarmBtn">🔔</a>
        </div>
    </div>
	<form action="${pageContext.request.contextPath}/user/updateFashion" method="post" id="styleForm">
	    <div class="content">
	        <div class="title">평소 사복 스타일이 궁금해요</div>
	        <input type="hidden" name="style" id="styleInput">
	        <div class="style-grid">
	            <button type="button" class="style-tag" data-value="캐주얼">캐주얼</button>
	            <button type="button" class="style-tag" data-value="모던">모던</button>
	            <button type="button" class="style-tag" data-value="스트릿">스트릿</button>
	            <button type="button" class="style-tag" data-value="페미닌">페미닌</button>
	            <button type="button" class="style-tag" data-value="클래식">클래식</button>
	            <button type="button" class="style-tag" data-value="빈티지">빈티지</button>
	        </div>
	    </div>
	    <div class="footer">
	        <button type="submit" value="수정" class="next-button">수정하기</button>
	    </div>
	</form>
	<script>
	    const tags = document.querySelectorAll('.style-tag');
	    const styleInput = document.getElementById('styleInput');
	    tags.forEach(tag => {
	        tag.addEventListener('click', function(e) {
	            tags.forEach(t => t.classList.remove('selected'));
	            tag.classList.add('selected');
	            styleInput.value = tag.getAttribute('data-value');
	        });
	    });
	    document.getElementById('styleForm').addEventListener('submit', function(e) {
	        if (!styleInput.value) {
	            alert('스타일을 하나 선택해주세요!');
	            e.preventDefault();
	        }
	    });
	</script>
  </div>
</body>
</html>