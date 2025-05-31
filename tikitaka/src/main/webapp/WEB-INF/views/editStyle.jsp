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
        <img src="${pageContext.request.contextPath}/images/leftBtn.png">
        <img src="${pageContext.request.contextPath}/images/escBtn.png">
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
  
</body>
</html>