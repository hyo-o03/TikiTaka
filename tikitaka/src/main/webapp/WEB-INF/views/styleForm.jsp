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
</head>
<body>
<div class="container">
    <div class="header">
        <img src="${pageContext.request.contextPath}/images/leftBtn.png" onclick="history.back()">
        <img src="${pageContext.request.contextPath}/images/escBtn.png" onclick="exit()">
    </div>
   
	<form action="${pageContext.request.contextPath}/user/updateFashion" method="post" id="fashionForm">
	    <input type="hidden" name="fashion" id="fashionInput">
	    <div class="style-grid">
	        <div class="style-tag" data-value="캐주얼">캐주얼</div>
	        <div class="style-tag" data-value="댄디">댄디</div>
	        <div class="style-tag" data-value="스포티">스포티</div>
	        <div class="style-tag" data-value="스트릿">스트릿</div>
	        <div class="style-tag" data-value="포멀">포멀</div>
	        <div class="style-tag" data-value="힙합">힙합</div>
	        <div class="style-tag" data-value="러블리">러블리</div>
	        <div class="style-tag" data-value="미니멀">미니멀</div>
	        <div class="style-tag" data-value="아메카지">아메카지</div>
	        <div class="style-tag" data-value="기타">기타</div>
	    </div>
	    <div class="footer">
	        <button type="submit" class="next-button">수정하기</button>
	    </div>
	</form>
	<script>
		const tags = document.querySelectorAll('.style-tag');
		const fashionInput = document.getElementById('fashionInput');

		tags.forEach(tag => {
		    tag.addEventListener('click', function(e) {
		        e.preventDefault(); // ★ 이 줄 추가! 페이지 이동 방지
		        tags.forEach(t => t.classList.remove('selected'));
		        tag.classList.add('selected');
		        fashionInput.value = tag.getAttribute('data-value');
		    });
		});

		document.getElementById('fashionForm').addEventListener('submit', function(e) {
		    if (!fashionInput.value) {
		        alert('스타일을 하나 선택해주세요!');
		        e.preventDefault();
		    }
		});
	</script>
</div>
  
</body>
</html>